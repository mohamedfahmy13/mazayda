import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/constants/app_colors.dart';

/// كارت شرح في شاشة حذف الحساب: أيقونة + عنوان + نص، بلون الحالة.
class DeletionInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final Color tone;
  final Color background;

  const DeletionInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.tone = AppColors.primary,
    this.background = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: tone.withValues(alpha: 0.14)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20.sp, color: tone),
          Gap(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: tone,
                  ),
                ),
                Gap(4.h),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 12.sp,
                    height: 1.6,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
