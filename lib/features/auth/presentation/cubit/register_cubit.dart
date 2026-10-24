import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/register_user.dart';
import '../auth_constants.dart';
import '../formz/auth_inputs.dart';

part 'register_cubit.freezed.dart';

enum RegisterStatus { idle, submitting, success, failure }

/// رقم التعريف وتاريخ الميلاد مش في الفورم ده (App Store 5.1.1: بيانات مش
/// لازمة لإنشاء الحساب) — بيتطلبوا في الـ KYC قبل أول مشاركة.
@freezed
abstract class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    @Default(NameInput.pure()) NameInput firstName,
    @Default(NameInput.pure()) NameInput lastName,
    @Default(PhoneInput.pure()) PhoneInput phone,
    @Default(EmailInput.pure()) EmailInput email,
    @Default(NewPasswordInput.pure()) NewPasswordInput password,
    @Default(ConfirmPasswordInput.pure()) ConfirmPasswordInput confirmPassword,
    @Default(RegisterStatus.idle) RegisterStatus status,
    @Default(false) bool isValid,
    String? userId, // عند النجاح → للـ OTP
    String? errorMessage,
    // أخطاء التحقق من السيرفر (مثلاً: البريد مستخدم بالفعل)
    Map<String, List<String>>? serverErrors,
  }) = _RegisterState;

  bool get canSubmit => isValid && status != RegisterStatus.submitting;
}

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUser _registerUser;
  RegisterCubit(this._registerUser) : super(const RegisterState());

  void _revalidate(RegisterState s) {
    final valid = Formz.validate([
      s.firstName,
      s.lastName,
      s.phone,
      s.email,
      s.password,
      s.confirmPassword,
    ]);
    emit(
      s.copyWith(
        isValid: valid,
        status: RegisterStatus.idle,
        errorMessage: null,
        serverErrors: null,
      ),
    );
  }

  void firstNameChanged(String v) =>
      _revalidate(state.copyWith(firstName: NameInput.dirty(v)));
  void lastNameChanged(String v) =>
      _revalidate(state.copyWith(lastName: NameInput.dirty(v)));
  void phoneChanged(String v) =>
      _revalidate(state.copyWith(phone: PhoneInput.dirty(v)));
  void emailChanged(String v) =>
      _revalidate(state.copyWith(email: EmailInput.dirty(v)));

  void passwordChanged(String v) {
    // عند تغيير كلمة المرور، نعيد التحقق من التأكيد أيضًا (لأن المرجع تغيّر)
    final confirm = ConfirmPasswordInput.dirty(
      password: v,
      value: state.confirmPassword.value,
    );
    _revalidate(
      state.copyWith(
        password: NewPasswordInput.dirty(v),
        confirmPassword: confirm,
      ),
    );
  }

  void confirmPasswordChanged(String v) => _revalidate(
    state.copyWith(
      confirmPassword: ConfirmPasswordInput.dirty(
        password: state.password.value,
        value: v,
      ),
    ),
  );

  Future<void> submit({
    String deviceName = AuthConstants.defaultDeviceName,
  }) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(
        status: RegisterStatus.submitting,
        errorMessage: null,
        serverErrors: null,
      ),
    );

    final result = await _registerUser(
      RegisterParams(
        firstNameAr: state.firstName.value,
        lastNameAr: state.lastName.value,
        phone: state.phone.value,
        email: state.email.value,
        password: state.password.value,
        passwordConfirmation: state.confirmPassword.value,
        deviceName: deviceName,
      ),
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: f.message,
          serverErrors: f is ServerFailure ? f.errors : null,
        ),
      ),
      (r) => emit(
        state.copyWith(status: RegisterStatus.success, userId: r.userId),
      ),
    );
  }
}
