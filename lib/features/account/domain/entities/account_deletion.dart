import 'package:equatable/equatable.dart';

/// أكواد موانع الحذف — مطابقة لـ `AccountDeletionService::blockers()` في الباك.
/// للمنطق والأيقونات بس؛ النص المعروض هو [DeletionBlocker.message].
class DeletionBlockerCode {
  DeletionBlockerCode._();

  /// مسجّل في مزاد لسه مخلصش (PUBLISHED / ACTIVE / EXTENDED).
  static const activeParticipation = 'active_participation';

  /// فايز بمزاد ودفعته النهائية لسه ماتأكدتش.
  static const unsettledWin = 'unsettled_win';

  /// طعن لسه بيتعالج.
  static const openAppeal = 'open_appeal';

  /// دفعة بدأت من أقل من ساعة ولسه ماتأكدتش — بيخلص لوحده.
  static const pendingPayment = 'pending_payment';

  /// حساب موظّف أو جهة — مابيتحذفش ذاتيًا أبدًا.
  static const staffAccount = 'staff_account';
}

/// سبب بيمنع حذف الحساب دلوقتي.
class DeletionBlocker extends Equatable {
  final String code;

  /// مترجم من السيرفر — بيتعرض زي ما هو.
  final String message;

  const DeletionBlocker({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}

/// نتيجة `GET /account/deletion-check`.
class AccountDeletionCheck extends Equatable {
  final bool canDelete;
  final List<DeletionBlocker> blockers;

  const AccountDeletionCheck({
    required this.canDelete,
    this.blockers = const [],
  });

  @override
  List<Object?> get props => [canDelete, blockers];
}

/// نتيجة طلب الحذف. الرفض بسبب موانع **مش خطأ**: هو إجابة بتتعرض للمستخدم
/// (ممكن مانع يظهر بين الفحص والتأكيد، زي دفعة لسه بادئة).
sealed class AccountDeletionResult extends Equatable {
  const AccountDeletionResult();
}

/// الحساب اتحذف (anonymized) وكل التوكنات اتبطّلت على السيرفر.
final class AccountDeleted extends AccountDeletionResult {
  /// رسالة النجاح المترجمة من السيرفر.
  final String? message;

  const AccountDeleted({this.message});

  @override
  List<Object?> get props => [message];
}

/// السيرفر رفض (`ACCOUNT_DELETION_BLOCKED`) — بنفس شكل موانع الفحص.
final class AccountDeletionBlocked extends AccountDeletionResult {
  final List<DeletionBlocker> blockers;
  final String? message;

  const AccountDeletionBlocked({required this.blockers, this.message});

  @override
  List<Object?> get props => [blockers, message];
}
