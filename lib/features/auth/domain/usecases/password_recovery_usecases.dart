import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

part 'password_recovery_usecases.freezed.dart';

/// الخطوة 1 (مسار الرمز): إرسال رمز إعادة التعيين للبريد.
@injectable
class RequestPasswordReset implements UseCase<Unit, IdentifyAccountParams> {
  final AuthRepository repository;
  RequestPasswordReset(this.repository);

  @override
  Future<Either<Failure, Unit>> call(IdentifyAccountParams p) =>
      repository.requestPasswordReset(nin: p.nin, email: p.email);
}

/// الخطوة 2 (مسار الرمز): تأكيد الرمز وتعيين كلمة سر جديدة.
@injectable
class VerifyPasswordReset implements UseCase<Unit, VerifyPasswordResetParams> {
  final AuthRepository repository;
  VerifyPasswordReset(this.repository);

  @override
  Future<Either<Failure, Unit>> call(VerifyPasswordResetParams p) =>
      repository.verifyPasswordReset(
        nin: p.nin,
        email: p.email,
        otp: p.otp,
        password: p.password,
        passwordConfirmation: p.passwordConfirmation,
      );
}

/// الخطوة 1 (مسار السؤال السرّي): كشف مفتاح السؤال.
@injectable
class RevealSecretQuestion implements UseCase<String, IdentifyAccountParams> {
  final AuthRepository repository;
  RevealSecretQuestion(this.repository);

  @override
  Future<Either<Failure, String>> call(IdentifyAccountParams p) =>
      repository.revealSecretQuestion(nin: p.nin, email: p.email);
}

/// الخطوة 2 (مسار السؤال السرّي): التحقق من الإجابة وتعيين كلمة سر جديدة.
@injectable
class RecoverBySecret implements UseCase<Unit, RecoverBySecretParams> {
  final AuthRepository repository;
  RecoverBySecret(this.repository);

  @override
  Future<Either<Failure, Unit>> call(RecoverBySecretParams p) =>
      repository.recoverBySecret(
        nin: p.nin,
        email: p.email,
        secretAnswer: p.secretAnswer,
        password: p.password,
        passwordConfirmation: p.passwordConfirmation,
      );
}

/// تعريف الحساب — مشترك بين خطوتي البداية في المسارين.
///
/// [nin] `null` للحساب اللي اتعمل من غير رقم تعريف — البريد لوحده بيكفي.
@freezed
abstract class IdentifyAccountParams with _$IdentifyAccountParams {
  const factory IdentifyAccountParams({
    String? nin,
    required String email,
  }) = _IdentifyAccountParams;
}

@freezed
abstract class VerifyPasswordResetParams with _$VerifyPasswordResetParams {
  const factory VerifyPasswordResetParams({
    String? nin,
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) = _VerifyPasswordResetParams;
}

@freezed
abstract class RecoverBySecretParams with _$RecoverBySecretParams {
  const factory RecoverBySecretParams({
    String? nin,
    required String email,
    required String secretAnswer,
    required String password,
    required String passwordConfirmation,
  }) = _RecoverBySecretParams;
}
