import 'dart:io' show Platform;

import 'package:injectable/injectable.dart';
import '../constants/api_constants.dart';
import '../network/api_client.dart';
import '../network/token_storage.dart';
import '../session/session_manager.dart';
import 'push_notification_service.dart';

/// حالة الـ Push للمستخدم الحالي — `GET /devices/status` (BE-11).
///
/// بتفرّق بين «السيرفر مافيهوش مزوّد Push مضبوط» و«المستخدم مسجّلش أجهزة».
typedef DevicePushStatus = ({bool pushEnabled, int devices});

/// يربط جهاز المستخدم بحسابه على السيرفر عشان الـ Push توصله.
///
/// العقد (BE-11):
/// - `POST /devices` **idempotent** — بنناديه كل مرة التطبيق يفتح وكل مرة
///   الـ FCM token يتجدّد، مش مرة واحدة بعد اللوجين.
/// - **التوكن هو الهوية** (unique عالميًا): لو نفس الجهاز سجّل دخول بحساب
///   تاني، السيرفر بيحوّل الصف للحساب الجديد.
/// - `DELETE /devices` لازم يتنادى **قبل** مسح التوكنات (محتاج مصادقة).
///
/// كل العمليات هنا **بتبلع الأخطاء بهدوء** — الإشعارات ميزة إضافية،
/// ماينفعش تفشّل تسجيل دخول أو خروج.
@lazySingleton
class DeviceRegistrar {
  final ApiClient _client;
  final PushNotificationService _push;
  final TokenStorage _tokenStorage;

  DeviceRegistrar(
    this._client,
    this._push,
    this._tokenStorage,
    SessionManager session,
  ) {
    // الجلسة خلصت (خروج · حذف حساب · انتهاء) → التسجيل الجاي لازم يتبعت
    // تاني حتى بنفس التوكن، عشان السيرفر يربط الجهاز بالحساب الجديد. حذف
    // الحساب مثلًا مابيناديش [unregister] لأن السيرفر شال الأجهزة بنفسه.
    session.addListener(() {
      if (!session.isSignedIn) _lastSentToken = null;
    });
  }

  static String get _platform => Platform.isIOS ? 'ios' : 'android';

  /// آخر توكن بعتناه بنجاح — بنستخدمه عشان ما نكرّرش نفس النداء في نفس
  /// الجلسة (التسجيل idempotent على السيرفر، بس مفيش داعي لطلب زيادة).
  String? _lastSentToken;

  /// يسجّل الجهاز الحالي.
  ///
  /// بيتنادى بعد نجاح تسجيل الدخول/التحقق، وكل مرة التطبيق يقلع وفيه جلسة
  /// شغّالة، ومع كل تجديد للـ FCM token.
  Future<void> register({String? locale}) async {
    await _safely(() async {
      final token = await _push.getToken();
      if (token == null || token.isEmpty) return;
      if (token == _lastSentToken) return;

      await _client.post(
        ApiConstants.devices,
        body: {
          'token': token,
          'platform': _platform,
          if (locale != null) 'locale': locale,
        },
      );
      _lastSentToken = token;
    });
  }

  /// يسجّل الجهاز **بس لو فيه جلسة** — للنداء عند إقلاع التطبيق، ساعتها
  /// إحنا مش عارفين لو المستخدم داخل أصلًا.
  Future<void> registerIfAuthenticated({String? locale}) async {
    await _safely(() async {
      if (!await _tokenStorage.hasTokens) return;
      await register(locale: locale);
    });
  }

  /// يبدأ متابعة تدوير الـ FCM token.
  ///
  /// بيتنادى مرة واحدة عند الإقلاع. من غيره، أول مرة FCM يدوّر التوكن
  /// (إعادة تثبيت، مسح بيانات التطبيق، ترقية النظام) الإشعارات بتتوقف
  /// **بصمت** لحد ما المستخدم يعمل logout/login.
  void watchTokenRefresh({String? locale}) {
    final stream = _push.onTokenRefresh;
    if (stream == null) return; // Firebase مش مُهيّأ

    stream.listen((token) async {
      // التوكن الجديد لازم يتبعت من الأول — القديم بقى ميّت.
      _lastSentToken = null;
      await registerIfAuthenticated(locale: locale);
    });
  }

  /// يلغي تسجيل الجهاز — **لازم يتنادى قبل مسح التوكنات** لأنه يحتاج مصادقة.
  Future<void> unregister() async {
    await _safely(() async {
      final token = await _push.getToken();
      if (token == null || token.isEmpty) return;
      await _client.delete(ApiConstants.devices, body: {'token': token});
      _lastSentToken = null;
    });
  }

  /// حالة الـ Push على السيرفر — `null` لو النداء فشل.
  ///
  /// `pushEnabled: false` معناها إن السيرفر لسه مامضبوطش عليه مزوّد Push
  /// (`PUSH_DRIVER=log`)، فالتسجيل شغّال بس مفيش توصيل فعلي.
  Future<DevicePushStatus?> status() async {
    try {
      final data = await _client.get(ApiConstants.devicesStatus);
      if (data is! Map) return null;
      return (
        pushEnabled: data['push_enabled'] == true,
        devices: (data['devices'] as num?)?.toInt() ?? 0,
      );
    } catch (_) {
      return null;
    }
  }

  /// تشغيل عملية وتجاهل أي فشل.
  Future<void> _safely(Future<void> Function() action) async {
    try {
      await action();
    } catch (_) {
      // متعمّد: الإشعارات ميزة إضافية، مش شرط لاستخدام التطبيق.
    }
  }
}
