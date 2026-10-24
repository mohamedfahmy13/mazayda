import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/brand_mark.dart';
import '../../../../core/router/app_router.dart';

/// مدة الـ splash — الجلسة بتتقرا في main قبل runApp، فمفيش حاجة نستناها.
const _minimumSplashDuration = Duration(milliseconds: 1350);

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _decide();
  }

  /// الرئيسية دايمًا، بجلسة أو من غيرها: الضيف بيتصفّح المزايدات وبيسجّل
  /// دخول بس لما يحب يشارك (App Store 5.1.1 — مفيش لوحة دخول إجبارية).
  Future<void> _decide() async {
    await Future<void>.delayed(_minimumSplashDuration);
    if (!mounted) return;
    context.go(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primaryDeep,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryDeep,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [Color(0xFF123B2D), AppColors.primary, Color(0xFF1D4B3B)],
              stops: [0, 0.56, 1],
            ),
          ),
          child: Stack(
            children: [
              _SplashOrnaments(reduceMotion: reduceMotion),
              // `Positioned.fill` مش SafeArea لوحدها: الـ`Stack` بيدّي
              // العناصر غير الموضوعة قيودًا مرنة، فالعمود كان بيتقلّص على
              // عرض أعرض عنصر جوّاه وبعدين يترصّ في أول الشاشة
              // (`AlignmentDirectional.topStart` = **يمين** في العربي).
              // بالملء بقى العمود بعرض الشاشة والتوسيط بيشتغل صح.
              Positioned.fill(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        const Spacer(flex: 4),
                        _BrandMark(reduceMotion: reduceMotion),
                        Gap(27.h),
                        _AnimatedSplashChild(
                          reduceMotion: reduceMotion,
                          delay: 260.ms,
                          child: Text(
                            t.appName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32.sp,
                              height: 1.15,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Gap(9.h),
                        _AnimatedSplashChild(
                          reduceMotion: reduceMotion,
                          delay: 420.ms,
                          slideBegin: 0.12,
                          child: Text(
                            t.splashTagline,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              height: 1.65,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white.withValues(alpha: 0.68),
                            ),
                          ),
                        ),
                        const Spacer(flex: 5),
                        _SplashLoader(reduceMotion: reduceMotion),
                        Gap(22.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  final bool reduceMotion;

  const _BrandMark({required this.reduceMotion});

  @override
  Widget build(BuildContext context) {
    Widget orbit = SizedBox(
      width: 136.w,
      height: 136.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 132.w,
            height: 132.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 9.w,
              height: 9.w,
              decoration: BoxDecoration(
                color: AppColors.gold,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withValues(alpha: 0.55),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (!reduceMotion) {
      orbit = orbit
          .animate(onPlay: (controller) => controller.repeat())
          .rotate(duration: 6000.ms, curve: Curves.linear);
    }

    final mark = SizedBox(
      width: 150.w,
      height: 150.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          orbit,
          Container(
            width: 108.w,
            height: 108.w,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(32.r),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.13),
                  blurRadius: 30,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: const Center(
              // لوحة بيضا صريحة زي التصميم الأصلي، والنسخة الملوّنة من
              // الشعار هي المناسبة فوقها.
              child: BrandMark(
                size: 76,
                radius: 24,
                onDarkSurface: false,
                background: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );

    if (reduceMotion) return mark;
    return mark
        .animate()
        .fadeIn(duration: 420.ms)
        .scale(
          begin: const Offset(0.72, 0.72),
          end: const Offset(1, 1),
          duration: 650.ms,
          curve: Curves.easeOutBack,
        )
        .shimmer(
          delay: 620.ms,
          duration: 780.ms,
          color: AppColors.white.withValues(alpha: 0.18),
        );
  }
}

class _AnimatedSplashChild extends StatelessWidget {
  final Widget child;
  final bool reduceMotion;
  final Duration delay;
  final double slideBegin;

  const _AnimatedSplashChild({
    required this.child,
    required this.reduceMotion,
    required this.delay,
    this.slideBegin = 0.18,
  });

  @override
  Widget build(BuildContext context) {
    if (reduceMotion) return child;
    return child
        .animate()
        .fadeIn(delay: delay, duration: 430.ms)
        .slideY(
          begin: slideBegin,
          end: 0,
          delay: delay,
          duration: 520.ms,
          curve: Curves.easeOutCubic,
        );
  }
}

class _SplashLoader extends StatelessWidget {
  final bool reduceMotion;

  const _SplashLoader({required this.reduceMotion});

  @override
  Widget build(BuildContext context) {
    if (reduceMotion) {
      return Container(
        width: 64.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(3.r),
        ),
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          width: 34.w,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      );
    }

    final loader = SizedBox(
      width: 64.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.r),
        child: LinearProgressIndicator(
          minHeight: 3.h,
          backgroundColor: AppColors.white.withValues(alpha: 0.12),
          color: AppColors.gold,
        ),
      ),
    );

    return loader.animate().fadeIn(delay: 620.ms, duration: 300.ms);
  }
}

class _SplashOrnaments extends StatelessWidget {
  final bool reduceMotion;

  const _SplashOrnaments({required this.reduceMotion});

  @override
  Widget build(BuildContext context) {
    Widget upper = Container(
      width: 245.w,
      height: 245.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.gold.withValues(alpha: 0.075),
          width: 46.w,
        ),
      ),
    );

    Widget lower = Container(
      width: 280.w,
      height: 280.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.045),
          width: 58.w,
        ),
      ),
    );

    if (!reduceMotion) {
      upper = upper
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .moveY(begin: -7, end: 7, duration: 3600.ms, curve: Curves.easeInOut);
      lower = lower
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .moveY(begin: 8, end: -8, duration: 4200.ms, curve: Curves.easeInOut);
    }

    return Stack(
      children: [
        PositionedDirectional(top: -86.h, start: -92.w, child: upper),
        PositionedDirectional(bottom: -112.h, end: -92.w, child: lower),
      ],
    );
  }
}
