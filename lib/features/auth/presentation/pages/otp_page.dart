import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/primary_button.dart';
import '../auth_constants.dart';
import '../cubit/otp_cubit.dart';
import '../widgets/auth_page_shell.dart';
import '../widgets/otp_code_field.dart';

class OtpPage extends StatelessWidget {
  final String userId;

  const OtpPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OtpCubit>()..startCooldown(),
      child: _OtpView(userId: userId),
    );
  }
}

class _OtpView extends StatefulWidget {
  final String userId;

  const _OtpView({required this.userId});

  @override
  State<_OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<_OtpView> {
  String _code = '';

  bool get _isComplete => _code.length == AuthConstants.otpLength;

  void _verify() {
    FocusScope.of(context).unfocus();
    context.read<OtpCubit>().verify(userId: widget.userId, otp: _code);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is! OtpVerified) return;
        // `true` بيرجع بالسلسلة (التسجيل ← اللوجين ← الشاشة اللي طلبت
        // الدخول)، فالمستخدم بيكمّل من مكانه. مفيش حاجة تحتنا (رابط
        // مباشر) → الرئيسية.
        if (context.canPop()) {
          context.pop(true);
        } else {
          context.go(Routes.home);
        }
      },
      builder: (context, state) {
        final cooldown = state is OtpInitial ? state.cooldown : 0;
        final isVerifying = state is OtpVerifying;

        return AuthPageShell(
          title: t.verifyEmailTitle,
          subtitle: t.otpHint,
          icon: Icons.mark_email_read_outlined,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(18.w, 23.h, 18.w, 26.h),
            children: [
              AuthFormSectionTitle(
                text: t.otpCode,
                icon: Icons.password_rounded,
              ),
              Gap(22.h),
              OtpCodeField(
                length: AuthConstants.otpLength,
                enabled: !isVerifying,
                onChanged: (code) {
                  if (state is OtpError) {
                    context.read<OtpCubit>().clearError();
                  }
                  setState(() => _code = code);
                },
              ),
              Gap(18.h),
              _ResendControl(userId: widget.userId, cooldown: cooldown),
              Gap(16.h),
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                child: state is OtpError
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: AuthErrorBanner(message: state.message),
                      )
                    : const SizedBox.shrink(),
              ),
              PrimaryButton(
                label: t.confirm,
                icon: Icons.verified_outlined,
                isLoading: isVerifying,
                onPressed: _isComplete && !isVerifying ? _verify : null,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ResendControl extends StatelessWidget {
  final String userId;
  final int cooldown;

  const _ResendControl({required this.userId, required this.cooldown});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    if (cooldown > 0) {
      final minutes = cooldown ~/ 60;
      final seconds = (cooldown % 60).toString().padLeft(2, '0');
      final progress = cooldown / AuthConstants.resendCooldownSeconds;

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 29.w,
              height: 29.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progress.clamp(0, 1),
                    strokeWidth: 2.4,
                    backgroundColor: AppColors.border,
                    color: AppColors.primary,
                  ),
                  Icon(
                    Icons.schedule_rounded,
                    size: 13.sp,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            Gap(9.w),
            Expanded(
              child: Text(
                t.resendInTimer('$minutes:$seconds'),
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: () => context.read<OtpCubit>().resend(userId),
      icon: Icon(Icons.refresh_rounded, size: 17.sp),
      label: Text(t.resendCode),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: EdgeInsets.symmetric(vertical: 11.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
    );
  }
}
