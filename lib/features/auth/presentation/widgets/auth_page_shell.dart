import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/brand_mark.dart';
import '../../../../core/router/app_router.dart';

/// الهيكل البصري المشترك لشاشات الدخول والتسجيل والتحقق.
class AuthPageShell extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;
  final bool showBackButton;

  const AuthPageShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final topInset = MediaQuery.paddingOf(context).top;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    // ارتفاع الرأس بيتحدد بمحتواه، مش برقم ثابت: الثابت القديم
    // (`topInset + 190.h`) مع `Spacer` كان بيسيب شريط أخضر فاضي كبير بين
    // اسم المنصة وعنوان الصفحة.
    final hero = IntrinsicHeight(
      child: Stack(
        children: [
          PositionedDirectional(
            top: topInset - 22.h,
            end: -50.w,
            child: Container(
              width: 154.w,
              height: 154.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.065),
                  width: 29.w,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: -58.h,
            start: -58.w,
            child: Container(
              width: 142.w,
              height: 142.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gold.withValues(alpha: 0.075),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.w, topInset + 12.h, 18.w, 22.h),
            child: Column(
              children: [
                Row(
                  children: [
                    if (showBackButton) ...[
                      _BackButton(
                        // مفيش حاجة نرجعلها (تحويل من الـ router) → المزايدات
                        // كضيف؛ الدخول نفسه مش بوابة للتطبيق.
                        onTap: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go(Routes.home);
                          }
                        },
                      ),
                      Gap(9.w),
                    ],
                    const BrandMark(size: 40, radius: 13),
                    Gap(9.w),
                    Expanded(
                      child: Text(
                        t.appName,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                // عنوان الصفحة على نفس حافة صفّ العلامة اللي فوقه — قبل
                // كده كان فيه `Gap(13.w)` زيادة بيزحلقه لجوّه لوحده.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // أيقونة الصفحة: كانت بتتبعت من كل شاشة وماتتعرضش
                    // خالص. هنا بقت الفرق البصري بين «دخول» و«إنشاء
                    // حساب» و«تأكيد البريد».

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            // سطرين: فيه عناوين أطول («استرجاع البريد
                            // الإلكتروني») كانت بتتقص بسطر واحد.
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 21.sp,
                              height: 1.25,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.25,
                            ),
                          ),
                          Gap(3.h),
                          Text(
                            subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white.withValues(alpha: 0.62),
                              fontSize: 10.5.sp,
                              height: 1.45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final form = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 24,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.primaryDeep,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                AppColors.primaryDeep,
                AppColors.primary,
                AppColors.primarySoft,
              ],
            ),
          ),
          child: Column(
            children: [
              reduceMotion
                  ? hero
                  : hero
                        .animate()
                        .fadeIn(duration: 350.ms)
                        .slideY(
                          begin: -0.035,
                          end: 0,
                          duration: 470.ms,
                          curve: Curves.easeOutCubic,
                        ),
              Expanded(
                child: reduceMotion
                    ? form
                    : form
                          .animate()
                          .fadeIn(delay: 100.ms, duration: 360.ms)
                          .slideY(
                            begin: 0.06,
                            end: 0,
                            delay: 100.ms,
                            duration: 500.ms,
                            curve: Curves.easeOutCubic,
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white.withValues(alpha: 0.10),
      borderRadius: BorderRadius.circular(13.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(13.r),
        child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Icon(AppIcons.back, size: 20.sp, color: AppColors.white),
        ),
      ),
    );
  }
}

/// عنوان قسم صغير داخل نماذج المصادقة.
class AuthFormSectionTitle extends StatelessWidget {
  final String text;
  final IconData icon;

  const AuthFormSectionTitle({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.075),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, size: 17.sp, color: AppColors.primary),
        ),
        Gap(8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class AuthErrorBanner extends StatelessWidget {
  final String message;

  const AuthErrorBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: AppColors.dangerBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.danger.withValues(alpha: 0.12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 17.sp,
            color: AppColors.danger,
          ),
          Gap(7.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 10.5.sp,
                height: 1.5,
                fontWeight: FontWeight.w600,
                color: AppColors.danger,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
