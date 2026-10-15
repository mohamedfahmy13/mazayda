import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';
import '../errors/exceptions.dart';
import '../session/session_manager.dart';
import '../utils/locale_cubit.dart';
import 'api_response.dart';
import 'auth_interceptor.dart';
import 'token_storage.dart';

/// غلاف حول Dio:
/// - يضبط الـ baseUrl والمهلات.
/// - يركّب الـ interceptors (auth + logging).
/// - يفكّ الـ envelope الموحّد {data, message, meta}.
/// - يحوّل أخطاء Dio إلى exceptions نظيفة يفهمها الـ Repository.
@lazySingleton
class ApiClient {
  late final Dio _dio;

  ApiClient(
    TokenStorage tokenStorage,
    SessionManager sessionManager,
    LocaleCubit localeCubit,
  ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout:
            const Duration(milliseconds: ApiConstants.connectTimeout),
        receiveTimeout:
            const Duration(milliseconds: ApiConstants.receiveTimeout),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      AuthInterceptor(
        tokenStorage,
        _dio,
        sessionManager,
        () => localeCubit.state.languageCode,
      ),
    );
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      compact: true,
    ));

    // إعادة المحاولة تلقائيًا — يُركّب أخيرًا (بعد auth واللوجر).
    // يعيد فقط عند أخطاء الشبكة/المهلة، 3 محاولات بفواصل متصاعدة.
    // ملاحظة: لا يعيد على 4xx (401/422...) لأنها لا تُحلّ بإعادة المحاولة.
    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: (msg) {}, // اللوجر عندنا بالفعل
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
    ));
  }

  Dio get dio => _dio;

  /// GET — يرجّع جزء `data` من الـ envelope.
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    return _handle(() => _dio.get(path, queryParameters: query));
  }

  /// POST — يرجّع جزء `data` من الـ envelope.
  Future<dynamic> post(
    String path, {
    dynamic body,
  }) async {
    return _handle(() => _dio.post(path, data: body));
  }

  /// PUT
  Future<dynamic> put(String path, {dynamic body}) async {
    return _handle(() => _dio.put(path, data: body));
  }

  /// PATCH
  Future<dynamic> patch(String path, {dynamic body}) async {
    return _handle(() => _dio.patch(path, data: body));
  }

  /// DELETE
  Future<dynamic> delete(String path, {dynamic body}) async {
    return _handle(() => _dio.delete(path, data: body));
  }

  /// رفع ملف (multipart) — مثلًا مستندات الـ KYC.
  Future<dynamic> upload(String path, FormData formData) async {
    return _handle(() => _dio.post(path, data: formData));
  }

  /// تنزيل ملف ثنائي (PDF مثلًا) **بتوكن المصادقة**.
  ///
  /// endpoints التنزيل محمية بـ Sanctum ومبترجّعش الغلاف — بترجّع stream خام.
  /// فمينفعش تتفتح في المتصفح أو عبر `get()` (اللي بيحاول يفك الغلاف).
  /// بنستخدم الـ Dio نفسه عشان الـ AuthInterceptor يحقن الـ Bearer، مع نفس
  /// تحويل الأخطاء المستخدم في باقي الطلبات.
  Future<List<int>> downloadBytes(String path) async {
    try {
      final response = await _dio.get<List<int>>(
        path,
        options: Options(responseType: ResponseType.bytes),
      );
      return response.data ?? const <int>[];
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// GET مع **الحفاظ على الغلاف كامل** — استخدمه لما تحتاج `meta`
  /// (pagination / viewer / counts / unread_count).
  Future<ApiResponse<dynamic>> getEnvelope(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    return _handleEnvelope(() => _dio.get(path, queryParameters: query));
  }

  /// POST مع الحفاظ على الغلاف كامل.
  Future<ApiResponse<dynamic>> postEnvelope(
    String path, {
    dynamic body,
  }) async {
    return _handleEnvelope(() => _dio.post(path, data: body));
  }

  /// المنطق المشترك: يشغّل الطلب، يفكّ الـ envelope، يحوّل الأخطاء.
  Future<dynamic> _handle(Future<Response> Function() request) async {
    try {
      final response = await request();
      final body = response.data;
      // الـ envelope الموحّد: نرجّع جزء data لو موجود
      if (body is Map && body.containsKey('data')) {
        return body['data'];
      }
      return body;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// نفس المنطق بس من غير ما نرمي الـ meta.
  Future<ApiResponse<dynamic>> _handleEnvelope(
    Future<Response> Function() request,
  ) async {
    try {
      final response = await request();
      final body = response.data;

      if (body is Map) {
        return ApiResponse<dynamic>(
          data: body.containsKey('data') ? body['data'] : body,
          message: body['message'] as String?,
          meta: body['meta'] is Map
              ? Map<String, dynamic>.from(body['meta'] as Map)
              : const <String, dynamic>{},
        );
      }

      // ردود غير مغلّفة (زي /wilayas اللي بترجّع مصفوفة خام) — بدون meta.
      return ApiResponse<dynamic>(data: body);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Exception _mapDioError(DioException e) {
    // أخطاء الاتصال / المهلة
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionError) {
      return NetworkException();
    }

    final status = e.response?.statusCode;
    final data = e.response?.data;

    // الرسالة المعرّبة جاية من الـ API
    String message = 'حدث خطأ، حاول مجددًا';
    Map<String, List<String>>? errors;
    String? code;

    if (data is Map) {
      if (data['message'] is String) message = data['message'];
      // كود يتقري لو الباك بعته (BE-16) — بيخلّينا نفرّق بين أنواع الرفض
      // من غير ما نطابق نصوص مترجمة.
      if (data['code'] is String) code = data['code'] as String;
      if (data['errors'] is Map) {
        errors = (data['errors'] as Map).map(
          (k, v) => MapEntry(
            k.toString(),
            (v as List).map((e) => e.toString()).toList(),
          ),
        );
      }
    }

    if (status == 401) {
      return UnauthorizedException(message);
    }

    return ServerException(
      message: message,
      statusCode: status,
      errors: errors,
      code: code,
    );
  }
}
