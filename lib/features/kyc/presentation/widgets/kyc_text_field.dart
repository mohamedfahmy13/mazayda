import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// حقل نصّي معنون مع رسالة خطأ اختيارية (يُستخدم لكل حقول فورم الـ KYC).
///
/// [readOnly] + [onTap] لحقل بيتملى من منتقي (تاريخ الميلاد).
class KycTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? hintText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;
  final IconData? suffixIcon;

  const KycTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.errorText,
    this.hintText,
    this.maxLength,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 6.h),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              errorText: errorText,
              hintText: hintText,
              suffixIcon: suffixIcon == null
                  ? null
                  : Icon(suffixIcon, size: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
