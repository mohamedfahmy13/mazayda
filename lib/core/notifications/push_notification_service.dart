import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import '../constants/app_colors.dart';

/// حمولة `data` لإشعار Push — كل القيم نصوص (قيد FCM).
typedef PushData = Map<String, dynamic>;

/// يدير الـ Push notifications:
/// - يطلب الإذن ويجلب الـ FCM token (نرسله للسيرفر لربطه بالمستخدم).
/// - العرض والتطبيق مفتوح (foreground): أندرويد عبر flutter_local_notifications،
///   و iOS عبر عرض النظام نفسه (`setForegroundNotificationPresentationOptions`)
///   عشان مايظهرش الإشعار مرتين.
/// - الضغط على الإشعار في كل الحالات (مفتوح / خلفية / مقفول) → [onTap]
///   أو [takeLaunchTap] لو هو اللي شغّل التطبيق.
///
/// ⚠️ بتتهيّأ **بعد** `runApp` ومن غير await (شوف main.dart): أي حاجة هنا
/// بتستنى المستخدم أو النظام (ديالوج الإذن، `getInitialMessage`) لو كانت
/// قبل `runApp` الشاشة كانت بتفضل بيضا للأبد.
///
/// ⚠️ Firebase اختياري (شوف `_initFirebase` في main.dart): لو `google-services.json`
/// ناقص، التطبيق يكمل بدون Push. عشان كده **ممنوع** نلمس
/// `FirebaseMessaging.instance` في تعريف الحقول — الوصول له قبل
/// `Firebase.initializeApp` يرمي `[core/no-app]` وقت بناء الكائن، وده يكسر
/// كل الـ DI اللي معتمد عليه (DeviceRegistrar → AuthRepository → اللوجين).
/// بدلها نجيبه كسول ومحميّ، وكل العمليات تبقى no-op لو Firebase مش جاهز.
@lazySingleton
class PushNotificationService {
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();

  final _taps = StreamController<PushData>.broadcast();
  final _foreground = StreamController<RemoteMessage>.broadcast();

  /// الإشعار اللي المستخدم ضغط عليه وهو اللي شغّل التطبيق من الصفر —
  /// بيكتمل لما [init] يعرفه (أو `null`)، حتى لو [init] فشل أو اتخطّى.
  final _launchTap = Completer<PushData?>();
  bool _launchTapTaken = false;

  /// `Firebase.apps` آمنة للقراءة قبل التهيئة (ترجع قائمة فاضية).
  static bool get isAvailable => Firebase.apps.isNotEmpty;

  FirebaseMessaging? get _messaging =>
      isAvailable ? FirebaseMessaging.instance : null;

  // قناة أندرويد للإشعارات المهمة (مزايدة/فوز/دفع) — نفس الـ id المضبوط
  // في AndroidManifest كقناة افتراضية لإشعارات FCM والتطبيق في الخلفية.
  static const _channel = AndroidNotificationChannel(
    'mazayada_high',
    'إشعارات مزايدة',
    description: 'إشعارات المزادات والمزايدات والمدفوعات',
    importance: Importance.high,
  );

  /// أيقونة شريط الحالة (أبيض شفاف) — `res/drawable-*/ic_notification.png`.
  static const _androidIcon = 'ic_notification';

  /// ضغط على إشعار والتطبيق شغّال (مفتوح أو في الخلفية).
  Stream<PushData> get onTap => _taps.stream;

  /// رسالة وصلت والتطبيق مفتوح — للي عايز يحدّث بياناته (الصندوق مثلًا).
  Stream<RemoteMessage> get onForegroundMessage => _foreground.stream;

  /// الإشعار اللي شغّل التطبيق (لو فيه) — بيرجع مرة واحدة بس، وبيستنى
  /// [init] لو لسه ماخلصش.
  Future<PushData?> takeLaunchTap() async {
    if (_launchTapTaken) return null;
    _launchTapTaken = true;
    return _launchTap.future;
  }

  /// تهيئة محلية سريعة (من غير أي ديالوج) — تُستدعى مرة عند بدء التطبيق
  /// بعد Firebase.initializeApp. طلب الإذن منفصل في [requestPermission].
  Future<void> init() async {
    PushData? launchTap;
    try {
      launchTap = await _init();
    } finally {
      if (!_launchTap.isCompleted) _launchTap.complete(launchTap);
    }
  }

  /// طلب إذن الإشعارات (iOS + Android 13+) — بيستنى قرار المستخدم، فما
  /// يتعملّوش await في مسار الإقلاع.
  Future<void> requestPermission() async {
    try {
      await _messaging?.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      debugPrint('⚠️ تعذّر طلب إذن الإشعارات: $e');
    }
  }

  Future<PushData?> _init() async {
    final fcm = _messaging;
    if (fcm == null) {
      debugPrint('⚠️ Firebase غير مُهيّأ — تم تخطّي تهيئة الإشعارات.');
      return null;
    }

    // 1) iOS: النظام يعرض الإشعار حتى والتطبيق مفتوح.
    await fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // 2) إعداد العرض المحلي (أندرويد foreground) + الضغط عليه
    await _local.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(_androidIcon),
        // الإذن بيتطلب من FCM في [requestPermission] — مانطلبوش هنا.
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
      onDidReceiveNotificationResponse: (r) {
        final data = _decode(r.payload);
        if (data != null) _taps.add(data);
      },
    );
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);

    // 3) الرسائل والتطبيق مفتوح
    FirebaseMessaging.onMessage.listen((message) {
      _foreground.add(message);
      if (!Platform.isIOS) _showLocal(message);
    });

    // 4) الضغط والتطبيق في الخلفية
    FirebaseMessaging.onMessageOpenedApp.listen((m) => _taps.add(m.data));

    // 5) الضغط شغّل التطبيق من الصفر — إشعار FCM، أو إشعار محلي اتعرض
    //    قبل ما التطبيق يتقفل.
    //    مهلة احتياطية: على iOS مع UIScene كان `getInitialMessage` بيعلّق
    //    للأبد (firebase_messaging < 16.1) — ماينفعش يوقّف باقي التهيئة.
    final initial = await fcm.getInitialMessage().timeout(
      const Duration(seconds: 3),
      onTimeout: () => null,
    );
    if (initial != null) return initial.data;
    final details = await _local.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      return _decode(details!.notificationResponse?.payload);
    }
    return null;
  }

  /// الـ FCM token — أرسله لـ backend لربطه بحساب المستخدم.
  /// يرجّع `null` لو Firebase مش مُهيّأ أو التوكن مش متاح لسه
  /// (DeviceRegistrar بيتعامل مع ده عادي).
  Future<String?> getToken() async {
    final fcm = _messaging;
    if (fcm == null) return null;
    try {
      // iOS: FCM مايقدرش يطلّع توكن قبل ما APNs يدّي توكن الجهاز، وده بياخد
      // لحظات بعد الإقلاع — من غير الانتظار `getToken` بيرمي
      // `apns-token-not-set`. على المحاكي أو من غير إذن ممكن مايجيش خالص.
      if (Platform.isIOS && !await _waitForApnsToken(fcm)) return null;
      return await fcm.getToken();
    } catch (e) {
      debugPrint('⚠️ تعذّر جلب FCM token: $e');
      return null;
    }
  }

  /// FCM بيدوّر التوكن من نفسه (إعادة تثبيت، مسح بيانات، ترقية…).
  ///
  /// التوكن القديم بيبقى ميّت والإشعارات بتتوقف بصمت، فلازم نعيد التسجيل
  /// مع كل تدوير. `null` لو Firebase مش مُهيّأ.
  Stream<String>? get onTokenRefresh => _messaging?.onTokenRefresh;

  Future<bool> _waitForApnsToken(FirebaseMessaging fcm) async {
    for (var i = 0; i < 10; i++) {
      if (await fcm.getAPNSToken() != null) return true;
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
    return false;
  }

  /// عرض إشعار محلي من رسالة FCM واردة (أندرويد foreground).
  void _showLocal(RemoteMessage message) {
    final n = message.notification;
    if (n == null) return;
    _local.show(
      (message.messageId ?? '${n.title}${n.body}').hashCode,
      n.title,
      n.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          icon: _androidIcon,
          color: AppColors.primary,
          // النص الطويل يبان كامل لما الإشعار يتفتح.
          styleInformation: BigTextStyleInformation(n.body ?? ''),
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  static PushData? _decode(String? payload) {
    if (payload == null || payload.isEmpty) return null;
    try {
      final v = jsonDecode(payload);
      return v is Map ? Map<String, dynamic>.from(v) : null;
    } catch (_) {
      return null;
    }
  }
}
