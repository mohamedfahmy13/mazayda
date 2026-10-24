import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../network/token_storage.dart';
import 'account_cache.dart';

/// مصدر الحقيقة الوحيد لـ«مسجّل دخول ولا ضيف».
///
/// التطبيق بيتصفّح من غير حساب (App Store 5.1.1): الضيف بيشوف المزايدات
/// وتفاصيلها، والحساب مطلوب بس للمشاركة ولشاشات الحساب. الحالة دي بيسمعها:
/// - `SignedInGate` — تبويبات الحساب بتقلب بين المحتوى وطلب تسجيل الدخول.
/// - `SessionExitRouter` — بيطلّع المستخدم من شاشات الحساب لما الجلسة تخلص.
///
/// الفائدة المعمارية زي ما هي: طبقة الـ network مابتعرفش حاجة عن الـ navigation.
@lazySingleton
class SessionManager extends ChangeNotifier {
  final TokenStorage _tokens;
  final AccountCache _accountCache;

  SessionManager(this._tokens, this._accountCache);

  bool _signedIn = false;
  final _expiredController = StreamController<void>.broadcast();

  bool get isSignedIn => _signedIn;

  /// الجلسة **خلصت لوحدها** (التجديد فشل) — مش خروج بإيد المستخدم.
  Stream<void> get onSessionExpired => _expiredController.stream;

  /// قراءة الجلسة المحفوظة — مرة واحدة في main قبل runApp، عشان الـ router
  /// والتبويبات يقروا الحالة متزامن من أول frame.
  Future<void> restore() async => _set(await _tokens.hasTokens);

  /// بعد حفظ التوكنات (login / verify-otp).
  void signedIn() => _set(true);

  /// خروج متعمّد (logout · حذف الحساب · إعادة تعيين كلمة السر): بيمسح كل
  /// حالة الحساب المحلية وبيرجّع التطبيق لوضع الضيف.
  Future<void> end() async {
    await _tokens.clear();
    await _accountCache.clear();
    _set(false);
  }

  /// من الـ AuthInterceptor لما التجديد يفشل نهائيًا: نفس [end]، وبنبلّغ
  /// الواجهة مرة واحدة إن الجلسة انتهت. الضيف من الأول مالوش جلسة تنتهي.
  Future<void> expire() async {
    if (!_signedIn) return _tokens.clear();
    // بنقلب الحالة قبل المسح عشان أي 401 تاني جاي في نفس اللحظة يلاقينا
    // ضيوف ومايبعتش التنبيه مرتين.
    _set(false);
    await _tokens.clear();
    await _accountCache.clear();
    if (!_expiredController.isClosed) _expiredController.add(null);
  }

  void _set(bool value) {
    if (_signedIn == value) return;
    _signedIn = value;
    notifyListeners();
  }

  @disposeMethod
  @override
  void dispose() {
    _expiredController.close();
    super.dispose();
  }
}
