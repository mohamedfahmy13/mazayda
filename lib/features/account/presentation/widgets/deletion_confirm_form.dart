import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/arabic_numerals.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../auth/presentation/widgets/app_text_field.dart';
import '../../../auth/presentation/widgets/auth_page_shell.dart';
import '../cubit/account_deletion_cubit.dart';
import 'deletion_info_card.dart';

/// الحذف متاح: إيه اللي هيتمسح، إيه اللي هيفضل من غير بيانات شخصية، وكلمة
/// السر + تأكيد قبل الطلب — النقط اللي مراجعة App Store بتدوّر عليها.
class DeletionConfirmForm extends StatefulWidget {
  final DeletionReady state;
  final ValueChanged<String> onDelete;

  const DeletionConfirmForm({
    super.key,
    required this.state,
    required this.onDelete,
  });

  @override
  State<DeletionConfirmForm> createState() => _DeletionConfirmFormState();
}

class _DeletionConfirmFormState extends State<DeletionConfirmForm> {
  final _password = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  /// نفس تحويل الدخول: كلمة السر اتحفظت بأرقام لاتينية حتى لو اتكتبت عربي.
  String get _passwordValue => toLatinDigits(_password.text);

  Future<void> _confirm() async {
    final t = AppLocalizations.of(context);
    FocusScope.of(context).unfocus();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.deleteAccountConfirmTitle),
        content: Text(t.deleteAccountConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: Text(t.deleteAccountConfirmAction),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) widget.onDelete(_passwordValue);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final state = widget.state;

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.all(16.w),
      children: [
        DeletionInfoCard(
          icon: Icons.warning_amber_rounded,
          tone: AppColors.danger,
          background: AppColors.dangerBg,
          title: t.deleteAccountWarningTitle,
          body: t.deleteAccountIntro,
        ),
        Gap(12.h),
        DeletionInfoCard(
          icon: Icons.delete_sweep_outlined,
          title: t.deleteAccountDeletedTitle,
          body: t.deleteAccountDeletedBody,
        ),
        Gap(12.h),
        DeletionInfoCard(
          icon: Icons.gavel_outlined,
          title: t.deleteAccountKeptTitle,
          body: t.deleteAccountKeptBody,
        ),
        Gap(12.h),
        Text(
          t.deleteAccountReRegisterNote,
          style: TextStyle(
            fontSize: 11.sp,
            height: 1.6,
            color: AppColors.textSecondary,
          ),
        ),
        Gap(20.h),
        AppTextField(
          label: t.deleteAccountPasswordLabel,
          hint: '••••••••••••',
          icon: Icons.lock_outline_rounded,
          controller: _password,
          obscure: true,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.password],
          enabled: !state.deleting,
          // الزرار بيتفعّل بمجرد ما فيه كلمة سر.
          onChanged: (_) => setState(() {}),
          errorText: state.passwordError,
        ),
        if (state.error != null) ...[
          AuthErrorBanner(message: state.error!),
          Gap(12.h),
        ],
        PrimaryButton(
          label: t.deleteAccountSubmit,
          icon: Icons.delete_forever_outlined,
          color: AppColors.danger,
          isLoading: state.deleting,
          onPressed: _password.text.isEmpty ? null : _confirm,
        ),
      ],
    );
  }
}
