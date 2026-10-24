import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';

/// مدخل حذف الحساب — تحت تسجيل الخروج مباشرة، أخفّ منه بصريًا عشان
/// مايتضغطش بالغلط، بس ظاهر من غير قوائم فرعية (App Store 5.1.1(v)).
class ProfileDeleteAccountButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ProfileDeleteAccountButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Center(
      child: TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(foregroundColor: AppColors.danger),
        icon: Icon(Icons.delete_forever_outlined, size: 17.sp),
        label: Text(
          t.deleteAccount,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
