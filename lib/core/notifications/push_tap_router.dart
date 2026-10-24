import 'dart:async';

import 'package:go_router/go_router.dart';
import '../../features/notifications/data/models/notification_model.dart';
import '../../features/notifications/domain/usecases/notifications_usecases.dart';
import '../../features/notifications/presentation/notification_destination.dart';
import '../router/app_router.dart';
import 'push_notification_service.dart';

/// يحوّل الضغط على إشعار Push لتنقّل داخل التطبيق.
///
/// - نفس توجيه الصندوق ([NotificationDestinationX]) — إشعار المزاد يفتح
///   المزاد، والطعن يفتح الطعون… ولو مفيش وجهة معروفة يفتح تبويب الإشعارات.
/// - **مابيتنقلش وإحنا في الـ splash أو شاشات الدخول**: الضغط اللي شغّل
///   التطبيق بيستنى لحد ما الـ splash يتأكد من الجلسة ويدخل الـ shell، وإلا
///   الـ splash كان هيعمل `go(home)` فوق الوجهة ويمسحها. ولو الجلسة منتهية
///   بيفضل مستني لحد ما المستخدم يسجّل دخول.
/// - بيعلّم الإشعار كمقروء على السيرفر لو الحمولة فيها معرّفه.
class PushTapRouter {
  final GoRouter _router;
  final PushNotificationService _push;
  final MarkNotificationRead _markRead;

  StreamSubscription<PushData>? _sub;
  PushData? _pending;
  bool _disposed = false;

  PushTapRouter(this._router, this._push, this._markRead);

  /// المسارات اللي لسه مفيهاش جلسة جاهزة.
  static const _preSessionPaths = {
    Routes.splash,
    Routes.login,
    Routes.register,
    Routes.forgotPassword,
    Routes.recoverAccount,
    Routes.recoverEmail,
  };

  void start() {
    _sub = _push.onTap.listen(_handle);
    _router.routerDelegate.addListener(_flushPending);
    // الخدمة بتتهيّأ بعد runApp، فالضغط اللي شغّل التطبيق ممكن يوصل بعد
    // أول frame — بيتحط في _pending لحد ما الجلسة تجهز.
    _push.takeLaunchTap().then((launch) {
      if (launch != null && !_disposed) _handle(launch);
    });
  }

  void dispose() {
    _disposed = true;
    _sub?.cancel();
    _router.routerDelegate.removeListener(_flushPending);
  }

  bool get _ready {
    final config = _router.routerDelegate.currentConfiguration;
    // الشاشة المعروضة فعلًا: الدخول بقى بيتفتح push فوق المزايدات (وضع
    // الضيف)، والـ `uri` بيفضل على أساس الـ stack تحته.
    final path = config.lastOrNull?.matchedLocation ?? config.uri.path;
    // فاضي = الـ router لسه ماحلّش أول مسار.
    return path.isNotEmpty &&
        !_preSessionPaths.contains(path) &&
        !path.startsWith(Routes.otp);
  }

  void _handle(PushData data) {
    _pending = data;
    _flushPending();
  }

  void _flushPending() {
    final data = _pending;
    if (data == null || !_ready) return;
    _pending = null;

    final n = NotificationModel.fromPushData(data).toEntity();
    if (n.id.isNotEmpty) _markRead(n.id);

    // microtask: ممكن نكون جوّه إشعار من الـ routerDelegate نفسه (لحظة دخول
    // الـ shell)، والتنقّل من جوّاه إعادة دخول.
    final destination = n.destination;
    scheduleMicrotask(() {
      if (destination != null) {
        _router.push(destination);
      } else {
        _router.go(Routes.notifications);
      }
    });
  }
}
