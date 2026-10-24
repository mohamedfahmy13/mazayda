import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/password_recovery_usecases.dart';
import '../auth_constants.dart';
import '../formz/auth_inputs.dart';

part 'password_recovery_cubit.freezed.dart';

/// مسار الاسترجاع.
enum RecoveryMode {
  /// رمز يُرسل على البريد.
  otp,

  /// السؤال السرّي المخزّن في الحساب.
  secretQuestion,
}

/// خطوة الشاشة.
enum RecoveryStep { identify, complete, done }

enum RecoveryStatus { idle, submitting, failure }

@freezed
abstract class PasswordRecoveryState with _$PasswordRecoveryState {
  const PasswordRecoveryState._();

  const factory PasswordRecoveryState({
    required RecoveryMode mode,
    @Default(RecoveryStep.identify) RecoveryStep step,
    @Default(RecoveryStatus.idle) RecoveryStatus status,
    /// اختياري — الحساب اللي اتعمل من غير رقم تعريف بيتعرّف بالبريد بس.
    @Default(OptionalNinInput.pure()) OptionalNinInput nin,
    @Default(EmailInput.pure()) EmailInput email,
    @Default('') String otp,
    @Default('') String secretAnswer,
    @Default(NewPasswordInput.pure()) NewPasswordInput password,
    @Default(ConfirmPasswordInput.pure()) ConfirmPasswordInput confirmPassword,

    /// مفتاح السؤال السرّي الراجع من السيرفر (مثال: mother_maiden).
    String? questionKey,

    String? errorMessage,
    Map<String, List<String>>? serverErrors,
  }) = _PasswordRecoveryState;

  bool get isSubmitting => status == RecoveryStatus.submitting;

  bool get canIdentify =>
      Formz.validate([nin, email]) && !isSubmitting;

  bool get _credentialValid => mode == RecoveryMode.otp
      ? otp.length == AuthConstants.otpLength
      : secretAnswer.trim().isNotEmpty;

  bool get canComplete =>
      _credentialValid &&
      Formz.validate([password, confirmPassword]) &&
      !isSubmitting;
}

/// يغطّي مساري استرجاع الحساب — الرمز البريدي والسؤال السرّي.
/// الاتنين بنفس البنية: تعريف الحساب ← تعيين كلمة سر جديدة.
@injectable
class PasswordRecoveryCubit extends Cubit<PasswordRecoveryState> {
  final RequestPasswordReset _requestReset;
  final VerifyPasswordReset _verifyReset;
  final RevealSecretQuestion _revealQuestion;
  final RecoverBySecret _recoverBySecret;

  PasswordRecoveryCubit(
    this._requestReset,
    this._verifyReset,
    this._revealQuestion,
    this._recoverBySecret,
  ) : super(const PasswordRecoveryState(mode: RecoveryMode.otp));

  void setMode(RecoveryMode mode) =>
      emit(PasswordRecoveryState(mode: mode));

  void ninChanged(String v) => emit(
    state.copyWith(nin: OptionalNinInput.dirty(v), status: RecoveryStatus.idle),
  );

  void emailChanged(String v) => emit(
    state.copyWith(email: EmailInput.dirty(v), status: RecoveryStatus.idle),
  );

  void otpChanged(String v) =>
      emit(state.copyWith(otp: v, status: RecoveryStatus.idle));

  void secretAnswerChanged(String v) =>
      emit(state.copyWith(secretAnswer: v, status: RecoveryStatus.idle));

  void passwordChanged(String v) => emit(
    state.copyWith(
      password: NewPasswordInput.dirty(v),
      confirmPassword: ConfirmPasswordInput.dirty(
        password: v,
        value: state.confirmPassword.value,
      ),
      status: RecoveryStatus.idle,
    ),
  );

  void confirmPasswordChanged(String v) => emit(
    state.copyWith(
      confirmPassword: ConfirmPasswordInput.dirty(
        password: state.password.value,
        value: v,
      ),
      status: RecoveryStatus.idle,
    ),
  );

  void backToIdentify() => emit(
    state.copyWith(
      step: RecoveryStep.identify,
      status: RecoveryStatus.idle,
      errorMessage: null,
      serverErrors: null,
    ),
  );

  /// الخطوة 1 — تعريف الحساب.
  Future<void> submitIdentify() async {
    if (!state.canIdentify) return;
    _startSubmit();

    final params = IdentifyAccountParams(
      nin: state.nin.valueOrNull,
      email: state.email.value,
    );

    if (state.mode == RecoveryMode.otp) {
      final res = await _requestReset(params);
      if (isClosed) return;
      res.fold(
        _fail,
        // ⚠️ الباك بيرجّع نجاح دايمًا حتى لو الحساب مش موجود (حماية من
        // استكشاف الحسابات) — فبننتقل للخطوة 2 من غير ما ندّعي إن الحساب موجود.
        (_) => emit(
          state.copyWith(step: RecoveryStep.complete, status: RecoveryStatus.idle),
        ),
      );
    } else {
      final res = await _revealQuestion(params);
      if (isClosed) return;
      // على عكس مسار الرمز، ده بيرجّع 422 لو الحساب مش متاح للاسترجاع.
      res.fold(
        _fail,
        (key) => emit(
          state.copyWith(
            step: RecoveryStep.complete,
            status: RecoveryStatus.idle,
            questionKey: key,
          ),
        ),
      );
    }
  }

  /// الخطوة 2 — تعيين كلمة السر الجديدة.
  Future<void> submitComplete() async {
    if (!state.canComplete) return;
    _startSubmit();

    final res = state.mode == RecoveryMode.otp
        ? await _verifyReset(
            VerifyPasswordResetParams(
              nin: state.nin.valueOrNull,
              email: state.email.value,
              otp: state.otp,
              password: state.password.value,
              passwordConfirmation: state.confirmPassword.value,
            ),
          )
        : await _recoverBySecret(
            RecoverBySecretParams(
              nin: state.nin.valueOrNull,
              email: state.email.value,
              secretAnswer: state.secretAnswer,
              password: state.password.value,
              passwordConfirmation: state.confirmPassword.value,
            ),
          );

    if (isClosed) return;
    res.fold(
      _fail,
      // السيرفر بيبطّل كل الجلسات — الواجهة بتوجّه لتسجيل الدخول.
      (_) => emit(
        state.copyWith(step: RecoveryStep.done, status: RecoveryStatus.idle),
      ),
    );
  }

  void _startSubmit() => emit(
    state.copyWith(
      status: RecoveryStatus.submitting,
      errorMessage: null,
      serverErrors: null,
    ),
  );

  void _fail(Failure f) => emit(
    state.copyWith(
      status: RecoveryStatus.failure,
      errorMessage: f.message,
      serverErrors: f is ServerFailure ? f.errors : null,
    ),
  );
}
