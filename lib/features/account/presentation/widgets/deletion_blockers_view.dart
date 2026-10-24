import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/account_deletion.dart';
import 'deletion_info_card.dart';

/// الحذف مقفول دلوقتي — بنعرض الموانع بنص السيرفر ومفيش زرار حذف أصلًا.
class DeletionBlockersView extends StatelessWidget {
  final List<DeletionBlocker> blockers;

  /// رسالة الرفض العامة — بتتعرض لو السيرفر مابعتش تفاصيل.
  final String? message;

  const DeletionBlockersView({super.key, required this.blockers, this.message});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final items = blockers.isNotEmpty
        ? blockers
        : [DeletionBlocker(code: '', message: message ?? t.errorGeneric)];

    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        DeletionInfoCard(
          icon: Icons.block_outlined,
          tone: AppColors.warning,
          background: AppColors.warningBg,
          title: t.deleteAccountBlockedTitle,
          body: t.deleteAccountBlockedHint,
        ),
        Gap(14.h),
        for (final (i, blocker) in items.indexed) ...[
          if (i > 0) Gap(10.h),
          _BlockerTile(blocker: blocker),
        ],
      ],
    );
  }
}

class _BlockerTile extends StatelessWidget {
  final DeletionBlocker blocker;
  const _BlockerTile({required this.blocker});

  /// الكود للأيقونة بس — النص من السيرفر.
  IconData get _icon => switch (blocker.code) {
    DeletionBlockerCode.activeParticipation => Icons.gavel_outlined,
    DeletionBlockerCode.unsettledWin => Icons.payments_outlined,
    DeletionBlockerCode.openAppeal => Icons.balance_outlined,
    DeletionBlockerCode.pendingPayment => Icons.hourglass_top_outlined,
    DeletionBlockerCode.staffAccount => Icons.admin_panel_settings_outlined,
    _ => Icons.info_outline,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: AppColors.warningBg,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(_icon, size: 18.sp, color: AppColors.warning),
          ),
          Gap(10.w),
          Expanded(
            child: Text(
              blocker.message,
              style: TextStyle(
                fontSize: 12.5.sp,
                height: 1.6,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
