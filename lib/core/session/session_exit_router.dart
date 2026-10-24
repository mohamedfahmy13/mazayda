import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../router/app_router.dart';
import 'session_manager.dart';

/// بيحرّك الـ router لما الجلسة تخلص — نظير `PushTapRouter`.
///
/// - المستخدم واقف على شاشة حساب (KYC · الوثائق · حذف الحساب…) والجلسة
///   خلصت → الرئيسية كضيف. التبويبات مش محتاجة ده: `SignedInGate` بيقلبها
///   لطلب تسجيل الدخول لوحده.
/// - الجلسة **انتهت لوحدها** (التجديد فشل) → رسالة مرة واحدة فيها زرار
///   تسجيل الدخول، بدل شاشة دخول إجبارية (App Store 5.1.1).
class SessionExitRouter {
  final GoRouter _router;
  final SessionManager _session;
  final GlobalKey<ScaffoldMessengerState> _messenger;

  StreamSubscription<void>? _expiredSub;

  SessionExitRouter(this._router, this._session, this._messenger);

  void start() {
    _session.addListener(_onSessionChanged);
    _expiredSub = _session.onSessionExpired.listen((_) => _tellExpired());
  }

  void dispose() {
    _session.removeListener(_onSessionChanged);
    _expiredSub?.cancel();
  }

  /// المسار المعروض فعلًا — `uri` بيفضل على أساس الـ stack لما شاشة
  /// تتعمل لها push، فبنقرا آخر match.
  String get _visiblePath =>
      _router.routerDelegate.currentConfiguration.lastOrNull?.matchedLocation ??
      '';

  void _onSessionChanged() {
    if (_session.isSignedIn || !Routes.requiresAccount(_visiblePath)) return;
    // microtask: الإشعار طالع من نص عملية (حذف الحساب مثلًا)، والتنقّل من
    // جوّاه إعادة دخول.
    scheduleMicrotask(() => _router.go(Routes.home));
  }

  void _tellExpired() {
    final messenger = _messenger.currentState;
    final context = _messenger.currentContext;
    if (messenger == null || context == null) return;

    final t = AppLocalizations.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(t.sessionExpiredNotice),
        action: SnackBarAction(
          label: t.loginButton,
          onPressed: () => _router.push(Routes.login),
        ),
      ),
    );
  }
}
