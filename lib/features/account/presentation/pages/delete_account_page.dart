import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/state_views.dart';
import '../cubit/account_deletion_cubit.dart';
import '../widgets/deletion_blockers_view.dart';
import '../widgets/deletion_confirm_form.dart';

/// حذف الحساب (App Store 5.1.1(v)) — الطلب كله من جوّه التطبيق، مش عن طريق
/// الدعم أو الإيميل.
///
/// الرحلة: فحص الموانع ← (موانع: رسايلها ومفيش زرار) أو (متاح: إيه اللي
/// هيتمسح وإيه اللي هيفضل + كلمة السر + تأكيد) ← حذف ← الرئيسية كضيف.
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountDeletionCubit>()..check(),
      child: const _DeleteAccountView(),
    );
  }
}

class _DeleteAccountView extends StatelessWidget {
  const _DeleteAccountView();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.deleteAccount)),
      body: BlocConsumer<AccountDeletionCubit, AccountDeletionState>(
        listenWhen: (_, state) => state is AccountDeletionDone,
        listener: (context, state) {
          final message = (state as AccountDeletionDone).message;
          // الرسالة على مستوى التطبيق، فبتفضل ظاهرة بعد ما الشاشة تتقفل.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message ?? t.deleteAccountDone),
              backgroundColor: AppColors.success,
            ),
          );
          // الحالة المحلية اتمسحت خلاص في الـ repository.
          context.go(Routes.home);
        },
        builder: (context, state) {
          final cubit = context.read<AccountDeletionCubit>();
          return switch (state) {
            DeletionChecking() || AccountDeletionDone() => const LoadingView(),
            DeletionCheckFailed(:final message) => ErrorView(
              message: message,
              onRetry: cubit.check,
            ),
            DeletionBlocked(:final blockers, :final message) =>
              DeletionBlockersView(blockers: blockers, message: message),
            DeletionReady() => DeletionConfirmForm(
              state: state,
              onDelete: cubit.delete,
            ),
          };
        },
      ),
    );
  }
}
