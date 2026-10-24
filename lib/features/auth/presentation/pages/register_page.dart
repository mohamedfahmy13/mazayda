import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/arabic_numerals.dart';
import '../../../../core/widgets/primary_button.dart';
import '../auth_constants.dart';
import '../cubit/register_cubit.dart';
import '../formz/auth_input_errors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_page_shell.dart';
import '../../../../core/constants/app_icons.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state.status != RegisterStatus.success) return;
        // تأكيد البريد بيرجّع `true` لما الحساب يتفعّل، وساعتها بنرجع
        // بالنتيجة لمين فتحنا (اللوجين أو طلب الدخول في تبويب) — فالمستخدم
        // بيكمّل من نفس الشاشة اللي كان عليها.
        final verified = await context.push<bool>(
          '${Routes.otp}/${state.userId}',
        );
        if (verified == true && context.mounted) context.pop(true);
      },
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        final srv = state.serverErrors;
        final submitting = state.status == RegisterStatus.submitting;

        return AuthPageShell(
          title: t.register,
          subtitle: t.splashTagline,
          icon: Icons.person_add_alt_1_rounded,
          child: AutofillGroup(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 28.h),
              children: [
                AuthFormSectionTitle(
                  text: t.personalData,
                  icon: Icons.badge_outlined,
                ),
                Gap(10.h),
                // رقم التعريف وتاريخ الميلاد اتشالوا من هنا (App Store
                // 5.1.1) — بنقول للمستخدم إمتى هيتطلبوا عشان مايتفاجئش.
                _IdentityLaterNote(text: t.registerIdentityLaterHint),
                Gap(14.h),
                AppTextField(
                  label: t.firstName,
                  hint: t.firstName,
                  icon: Icons.person_outline_rounded,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  autofillHints: const [AutofillHints.givenName],
                  enabled: !submitting,
                  onChanged: cubit.firstNameChanged,
                  errorText:
                      state.firstName.errorText(t) ??
                      srv?['first_name_ar']?.first,
                ),
                AppTextField(
                  label: t.lastName,
                  hint: t.lastName,
                  icon: Icons.person_outline_rounded,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  autofillHints: const [AutofillHints.familyName],
                  enabled: !submitting,
                  onChanged: cubit.lastNameChanged,
                  errorText:
                      state.lastName.errorText(t) ??
                      srv?['last_name_ar']?.first,
                ),
                AppTextField(
                  label: t.phone,
                  hint: '05 / 06 / 07 ...',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  maxLength: AuthConstants.phoneLength,
                  inputFormatters: [AppInputFormatters.anyNumeralDigitsOnly],
                  enabled: !submitting,
                  onChanged: cubit.phoneChanged,
                  errorText: state.phone.errorText(t) ?? srv?['phone']?.first,
                ),
                AppTextField(
                  label: t.email,
                  hint: 'example@mail.com',
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  enabled: !submitting,
                  onChanged: cubit.emailChanged,
                  errorText: state.email.errorText(t) ?? srv?['email']?.first,
                ),
                Gap(9.h),
                AuthFormSectionTitle(
                  text: t.password,
                  icon: Icons.security_rounded,
                ),
                Gap(17.h),
                AppTextField(
                  label: t.password,
                  hint: '••••••••••••',
                  icon: Icons.lock_outline_rounded,
                  obscure: true,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.newPassword],
                  enabled: !submitting,
                  onChanged: cubit.passwordChanged,
                  errorText:
                      state.password.errorText(t) ?? srv?['password']?.first,
                ),
                AppTextField(
                  label: t.confirmPassword,
                  hint: '••••••••••••',
                  icon: Icons.lock_reset_rounded,
                  obscure: true,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                  enabled: !submitting,
                  onChanged: cubit.confirmPasswordChanged,
                  onSubmitted: (_) {
                    if (state.canSubmit) cubit.submit();
                  },
                  errorText: state.confirmPassword.errorText(t),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 220),
                  child: state.status == RegisterStatus.failure
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 13.h),
                          child: AuthErrorBanner(
                            message: state.errorMessage ?? t.errorGeneric,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                PrimaryButton(
                  label: t.nextVerify,
                  icon: AppIcons.forward,
                  isLoading: submitting,
                  onPressed: state.canSubmit ? cubit.submit : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _IdentityLaterNote extends StatelessWidget {
  final String text;
  const _IdentityLaterNote({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: AppColors.infoBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, size: 16.sp, color: AppColors.info),
          Gap(7.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 10.5.sp,
                height: 1.55,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
