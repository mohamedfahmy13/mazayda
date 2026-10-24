import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../session/session_manager.dart';
import 'token_storage.dart';

/// Interceptor بيضيف:
/// - Accept-Language: لغة التطبيق الحالية (رسايل وتسميات الـ API بنفس لغة الواجهة)
/// - Authorization: Bearer {access} للطلبات المحمية
/// وبيعالج 401 بمحاولة تجديد التوكن مرة واحدة ثم إعادة الطلب.
/// عند فشل التجديد نهائيًا: يمسح حالة الحساب ويرجّع التطبيق **ضيف** (مش شاشة
/// دخول إجبارية — App Store 5.1.1).
class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  final Dio _dio; // نفس الـ Dio لإعادة المحاولة
  final SessionManager _sessionManager;

  /// بيتقري مع كل طلب، فتغيير اللغة بيسري فورًا من غير إعادة بناء الـ Dio.
  final String Function() _languageCode;

  AuthInterceptor(
    this._tokenStorage,
    this._dio,
    this._sessionManager,
    this._languageCode,
  );

  bool _isRefreshing = false;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = _languageCode();

    // ما نضفش التوكن في طلبات الـ auth العامة
    // endpoints الضيف — ما نضفش عليها توكن (توكن قديم/منتهي ممكن يسبّب 401).
    final isAuthFree = options.path.contains('/auth/register') ||
        options.path.contains('/auth/login') ||
        options.path.contains('/auth/verify-otp') ||
        options.path.contains('/auth/resend-otp') ||
        options.path.contains('/auth/password/') ||
        options.path.contains('/auth/recover/');

    if (!isAuthFree) {
      final token = await _tokenStorage.accessToken;
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final is401 = err.response?.statusCode == 401;
    final isRefreshCall = err.requestOptions.path.contains('/auth/refresh');

    // 401 على طلب عادي → جرّب تجدّد التوكن مرة واحدة
    if (is401 && !isRefreshCall && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // أعد الطلب الأصلي بالتوكن الجديد
          final newToken = await _tokenStorage.accessToken;
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          final response = await _dio.fetch(err.requestOptions);
          _isRefreshing = false;
          return handler.resolve(response);
        } else {
          // مفيش refresh token صالح → الجلسة انتهت
          await _endSession();
        }
      } catch (_) {
        // فشل التجديد (مثلًا الـ refresh token نفسه منتهي) → الجلسة انتهت
        await _endSession();
      }
      _isRefreshing = false;
    }
    handler.next(err);
  }

  /// إنهاء الجلسة: مسح التوكنات وكاش الحساب + الرجوع لوضع الضيف.
  Future<void> _endSession() => _sessionManager.expire();

  Future<bool> _refreshToken() async {
    final refresh = await _tokenStorage.refreshToken;
    if (refresh == null) return false;

    // مهم: التجديد بيستخدم الـ REFRESH token كـ bearer (مش الـ access)
    final res = await Dio().post(
      '${ApiConstants.baseUrl}${ApiConstants.refresh}',
      options: Options(headers: {
        'Authorization': 'Bearer $refresh',
        'Accept': 'application/json',
      }),
    );

    // الردّ الحقيقي: data.tokens.{access_token, refresh_token, ...}
    // (نتسامح لو رجعوا في الجذر مباشرة زي ما بيعمل الـ datasource).
    final data = res.data is Map ? res.data['data'] : null;
    if (data is! Map) return false;

    final tokens = (data['tokens'] ?? data) as Map;
    final access = tokens['access_token'];
    if (access is! String || access.isEmpty) return false;

    await _tokenStorage.saveTokens(
      accessToken: access,
      refreshToken: (tokens['refresh_token'] as String?) ?? refresh,
    );
    return true;
  }
}
