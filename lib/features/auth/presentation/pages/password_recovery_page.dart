import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/arabic_numerals.dart';
import '../../../../core/widgets/primary_button.dart';
import '../auth_constants.dart';
import '../cubit/password_recovery_cubit.dart';
import '../formz/auth_input_errors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/otp_code_field.dart';

/// نص السؤال السرّي من مفتاحه — المفاتيح هي نفسها في `lang/*/auth.php`.
String secretQuestionLabel(String? key, AppLocalizations t) => switch (key) {
  'mother_maiden' => t.secretQMotherMaiden,
  'first_school' => t.secretQFirstSchool,
  'birth_city' => t.secretQBirthCity,
  'pet_name' => t.secretQPetName,
  'fav_teacher' => t.secretQFavTeacher,
  _ => '',
};

/// شاشة استرجاع الحساب — بمسارين: رمز على البريد، أو السؤال السرّي.
class PasswordRecoveryPage extends StatelessWidget {
  final RecoveryMode mode;
  const PasswordRecoveryPage({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PasswordRecoveryCubit>()..setMode(mode),
      child: const _RecoveryView(),
    );
  }
}

class _RecoveryView extends StatelessWidget {
  const _RecoveryView();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocConsumer<PasswordRecoveryCubit, PasswordRecoveryState>(
      listenWhen: (a, b) =>
          a.step != b.step || (b.errorMessage != null && a.errorMessage != b.errorMessage),
      listener: (context, state) {
        if (state.step == RecoveryStep.done) {
          // السيرفر بطّل كل الجلسات — نرجّع المستخدم لتسجيل الدخول.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.recoveryDone),
              backgroundColor: AppColors.success,
            ),
          );
          context.go(Routes.login);
        } else if (state.errorMessage != null && state.serverErrors == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.danger,
            ),
          );
        }
      },
      builder: (context, state) {
        final isOtp = state.mode == RecoveryMode.otp;
        return Scaffold(
          appBar: AppBar(
            title: Text(isOtp ? t.forgotPasswordTitle : t.recoverAccountTitle),
            leading: state.step == RecoveryStep.complete
                ? IconButton(
                    icon: const Icon(AppIcons.back),
                    onPressed:
                        context.read<PasswordRecoveryCubit>().backToIdentify,
                  )
                : null,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child:
                (state.step == RecoveryStep.identify
                        ? _IdentifyStep(state: state)
                        : _CompleteStep(state: state))
                    .animate()
                    .fadeIn(duration: 250.ms),
          ),
        );
      },
    );
  }
}

/// الخطوة 1 — تعريف الحساب برقم التعريف والبريد.
class _IdentifyStep extends StatelessWidget {
  final PasswordRecoveryState state;
  const _IdentifyStep({required this.state});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cubit = context.read<PasswordRecoveryCubit>();
    final srv = state.serverErrors;
    final isOtp = state.mode == RecoveryMode.otp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Hint(isOtp ? t.forgotPasswordHint : t.recoverAccountHint),
        Gap(16.h),
        AppTextField(
          label: t.email,
          hint: 'example@mail.com',
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
          onChanged: cubit.emailChanged,
          errorText: state.email.errorText(t) ?? srv?['email']?.first,
        ),
        // اختياري: الحساب اللي اتعمل من غير رقم تعريف بيتعرّف بالبريد بس،
        // واللي عنده رقم لازم يكتبه (البريد لوحده مابيطابقش الحساب ده).
        AppTextField(
          label: t.ninOptional,
          hint: t.ninHint,
          icon: Icons.badge_outlined,
          keyboardType: TextInputType.number,
          maxLength: AuthConstants.ninLength,
          inputFormatters: [AppInputFormatters.anyNumeralDigitsOnly],
          onChanged: cubit.ninChanged,
          errorText: state.nin.errorText(t) ?? srv?['nin']?.first,
        ),
        _Hint(t.recoveryNinOptionalHint),
        Gap(12.h),
        PrimaryButton(
          label: isOtp ? t.sendCode : t.showQuestion,
          isLoading: state.isSubmitting,
          onPressed: state.canIdentify ? cubit.submitIdentify : null,
        ),
      ],
    );
  }
}

/// الخطوة 2 — إثبات الملكية (رمز أو إجابة) + كلمة سر جديدة.
class _CompleteStep extends StatelessWidget {
  final PasswordRecoveryState state;
  const _CompleteStep({required this.state});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final cubit = context.read<PasswordRecoveryCubit>();
    final srv = state.serverErrors;
    final isOtp = state.mode == RecoveryMode.otp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isOtp) ...[
          // ما بنقولش «أُرسل لحسابك» — السيرفر بينجح حتى لو الحساب مش موجود.
          _Hint(t.codeSentHint(state.email.value)),
          Gap(16.h),
          Text(
            t.otpCode,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          Gap(8.h),
          OtpCodeField(onChanged: cubit.otpChanged),
          if (srv?['otp']?.isNotEmpty ?? false) ...[
            Gap(6.h),
            _FieldError(srv!['otp']!.first),
          ],
        ] else ...[
          _QuestionCard(
            question: secretQuestionLabel(state.questionKey, t),
          ),
          Gap(14.h),
          AppTextField(
            label: t.secretAnswer,
            icon: Icons.vpn_key_outlined,
            onChanged: cubit.secretAnswerChanged,
            errorText: srv?['secret_answer']?.first,
          ),
          // المقارنة في السيرفر بـ Hash::check — حسّاسة للحروف والمسافات.
          _Hint(t.secretAnswerHint),
        ],
        Gap(16.h),
        AppTextField(
          label: t.newPassword,
          hint: '••••••••',
          icon: Icons.lock_outline,
          obscure: true,
          onChanged: cubit.passwordChanged,
          errorText: state.password.errorText(t) ?? srv?['password']?.first,
        ),
        AppTextField(
          label: t.confirmPassword,
          hint: '••••••••',
          icon: Icons.lock_outline,
          obscure: true,
          onChanged: cubit.confirmPasswordChanged,
          errorText: state.confirmPassword.errorText(t),
        ),
        Gap(12.h),
        PrimaryButton(
          label: t.setNewPassword,
          isLoading: state.isSubmitting,
          onPressed: state.canComplete ? cubit.submitComplete : null,
        ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final String question;
  const _QuestionCard({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.infoBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.help_outline, size: 19.sp, color: AppColors.info),
          Gap(9.w),
          Expanded(
            child: Text(
              question,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  final String text;
  const _Hint(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(top: 6.h),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11.sp,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
    ),
  );
}

class _FieldError extends StatelessWidget {
  final String text;
  const _FieldError(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(fontSize: 11.sp, color: AppColors.danger),
  );
}
