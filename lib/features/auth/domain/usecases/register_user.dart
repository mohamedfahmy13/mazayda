import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entities.dart';
import '../repositories/auth_repository.dart';

part 'register_user.freezed.dart';

@injectable
class RegisterUser implements UseCase<RegisterResult, RegisterParams> {
  final AuthRepository repository;
  RegisterUser(this.repository);

  @override
  Future<Either<Failure, RegisterResult>> call(RegisterParams p) {
    return repository.register(
      firstNameAr: p.firstNameAr,
      lastNameAr: p.lastNameAr,
      phone: p.phone,
      email: p.email,
      password: p.password,
      passwordConfirmation: p.passwordConfirmation,
      deviceName: p.deviceName,
    );
  }
}

/// رقم التعريف وتاريخ الميلاد مش هنا عن قصد — بيتطلبوا في الـ KYC
/// (App Store 5.1.1).
@freezed
abstract class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    required String firstNameAr,
    required String lastNameAr,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String deviceName,
  }) = _RegisterParams;
}
