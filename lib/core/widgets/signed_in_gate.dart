import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../constants/app_colors.dart';
import '../di/injection.dart';
import '../router/app_router.dart';
import '../session/session_manager.dart';
import 'primary_button.dart';

/// يفتح تسجيل الدخول فوق الشاشة الحالية — `true` لو المستخدم دخل فعلًا،
/// فالشاشة اللي طلبته تكمّل من مكانها (نفس المزايدة مثلًا).
Future<bool> openSignIn(BuildContext context) async =>
    await context.push<bool>(Routes.login) ?? false;

/// تبويب حساب (مزايداتي · الإشعارات · حسابي): المحتوى للمسجّل، وطلب تسجيل
/// دخول للضيف بدل ما التطبيق كله يتقفل ورا شاشة دخول (App Store 5.1.1).
///
/// [builder] بيتبني بس والمستخدم مسجّل — فالـ Cubit اللي جوّاه بيتعمل ويحمّل
/// من جديد بعد تسجيل الدخول، وبيتقفل مع الخروج.
class SignedInGate extends StatelessWidget {
  final WidgetBuilder builder;

  /// اسم التبويب في رأس طلب الدخول.
  final String title;
  final IconData icon;

  /// ليه الحساب مطلوب هنا تحديدًا.
  final String message;

  const SignedInGate({
    super.key,
    required this.builder,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final session = getIt<SessionManager>();
    return ListenableBuilder(
      listenable: session,
      builder: (context, _) => session.isSignedIn
          ? builder(context)
          : GuestPromptView(title: title, icon: icon, message: message),
    );
  }
}

/// طلب تسجيل الدخول اللي بيظهر للضيف مكان محتوى التبويب.
class GuestPromptView extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const GuestPromptView({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _GuestHeader(title: title, icon: icon),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 76.w,
                      height: 76.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.075),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lock_person_outlined,
                        size: 34.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    Gap(16.h),
                    Text(
                      t.guestPromptTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Gap(8.h),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        height: 1.6,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(22.h),
                    PrimaryButton(
                      label: t.loginButton,
                      icon: Icons.login_rounded,
                      onPressed: () => openSignIn(context),
                    ),
                    Gap(10.h),
                    // التبويب بيقلب لمحتواه لوحده بعد ما الحساب يتأكد —
                    // مش محتاجين نستنى نتيجة الشاشة.
                    PrimaryButton(
                      label: t.register,
                      outlined: true,
                      onPressed: () => context.push<bool>(Routes.register),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// نفس لغة رؤوس التبويبات (تدرّج + أيقونة ذهبي) عشان التبويب مايبانش فاضي.
class _GuestHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _GuestHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final topInset = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(18.w, topInset + 12.h, 18.w, 20.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              AppColors.primaryDeep,
              AppColors.primary,
              AppColors.primarySoft,
            ],
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
        ),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.14),
                ),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: AppColors.gold, size: 22.sp),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.appName,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.64),
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
