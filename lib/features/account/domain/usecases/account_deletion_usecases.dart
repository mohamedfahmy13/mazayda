import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/account_deletion.dart';
import '../repositories/account_repository.dart';

/// فحص موانع الحذف قبل ما نعرض فورم التأكيد.
@injectable
class CheckAccountDeletion implements UseCase<AccountDeletionCheck, NoParams> {
  final AccountRepository repository;
  CheckAccountDeletion(this.repository);

  @override
  Future<Either<Failure, AccountDeletionCheck>> call(NoParams params) =>
      repository.checkDeletion();
}

/// الحذف النهائي — [password] كلمة السر الحالية.
@injectable
class DeleteAccount implements UseCase<AccountDeletionResult, String> {
  final AccountRepository repository;
  DeleteAccount(this.repository);

  @override
  Future<Either<Failure, AccountDeletionResult>> call(String password) =>
      repository.deleteAccount(password: password);
}
