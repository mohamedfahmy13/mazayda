import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/account_deletion.dart';

/// عقد الـ account repository — حذف الحساب من جوّه التطبيق (App Store 5.1.1(v)).
abstract class AccountRepository {
  /// هل الحذف متاح دلوقتي، ولو لأ إيه اللي مانعه.
  Future<Either<Failure, AccountDeletionCheck>> checkDeletion();

  /// حذف نهائي بعد إعادة إدخال كلمة السر. عند النجاح الحالة المحلية كلها
  /// بتتمسح والتطبيق بيرجع ضيف.
  Future<Either<Failure, AccountDeletionResult>> deleteAccount({
    required String password,
  });
}
