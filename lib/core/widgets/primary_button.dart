import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

/// زرار أساسي معاد الاستخدام في كل الشاشات.
/// بيدعم حالة التحميل (loading) وأيقونة اختيارية.
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool outlined;

  /// لون الزرار — الافتراضي الأساسي، و`AppColors.danger` للإجراء اللي
  /// مالوش رجوع (حذف الحساب).
  final Color color;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.outlined = false,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bg = outlined ? AppColors.white : color;
    final fg = outlined ? color : AppColors.white;

    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          disabledBackgroundColor: outlined
              ? AppColors.white
              : const Color(0xFFB8C4C0),
          elevation: 0,
          side: outlined ? BorderSide(color: color) : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22.w,
                height: 22.w,
                child: CircularProgressIndicator(strokeWidth: 2.5, color: fg),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (icon != null) ...[
                    SizedBox(width: 8.w),
                    Icon(icon, size: 20.sp),
                  ],
                ],
              ),
      ),
    );
  }
}
