import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../constants/app_colors.dart';
import 'primary_button.dart';

/// مؤشر تحميل بسيط بلون التطبيق.
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }
}

/// عرض حالة الخطأ مع رسالة وزرار إعادة المحاولة.
class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorView({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline,
                size: 48.sp, color: AppColors.danger),
            SizedBox(height: 12.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp, color: AppColors.textSecondary),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 20.h),
              // عرض أدنى مش ثابت: الـ 160 الثابتة كانت بتقصّ النص لـ
              // «إعادة المحا…»، فالزرار دلوقتي بيكبر على قد النص.
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 160.w),
                child: IntrinsicWidth(
                  child: PrimaryButton(
                    label: AppLocalizations.of(context).retry,
                    icon: Icons.refresh,
                    onPressed: onRetry,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// عرض حالة القائمة الفارغة.
class EmptyView extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyView({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44.sp, color: AppColors.textHint),
          SizedBox(height: 10.h),
          Text(
            message,
            style:
                TextStyle(fontSize: 13.sp, color: AppColors.textHint),
          ),
        ],
      ),
    );
  }
}
