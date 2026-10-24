import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/list_entrance_animation.dart';
import '../../../../core/widgets/signed_in_gate.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/app_notification.dart';
import '../cubit/notifications_cubit.dart';
import '../notification_destination.dart';
import '../widgets/notification_tile.dart';
import '../widgets/notifications_header.dart';
import '../widgets/notifications_list_states.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return SignedInGate(
      title: t.notifications,
      icon: Icons.notifications_none_rounded,
      message: t.guestNotificationsBody,
      builder: (_) => BlocProvider(
        create: (_) => getIt<NotificationsCubit>()..load(),
        child: const _NotificationsView(),
      ),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) => Column(
          children: [
            NotificationsHeader(
              unreadCount: state.unreadCount,
              totalCount: state.items.length,
              loading: state.loading,
              onMarkAllRead: context.read<NotificationsCubit>().markAllAsRead,
            ),
            Expanded(child: _NotificationsBody(state: state)),
          ],
        ),
      ),
    );
  }
}

class _NotificationsBody extends StatelessWidget {
  final NotificationsState state;

  const _NotificationsBody({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    if (state.loading) return const NotificationsLoadingList();
    if (state.error != null) {
      return ErrorView(message: state.error!, onRetry: cubit.load);
    }
    if (state.items.isEmpty) {
      return NotificationsEmptyState(onRefresh: cubit.load);
    }
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: cubit.load,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
        itemCount: state.items.length,
        itemBuilder: (_, i) {
          final n = state.items[i];
          final tile = NotificationTile(
            key: ValueKey(n.id),
            notification: n,
            onTap: () {
              cubit.markAsRead(n.id);
              _openDestination(context, n);
            },
          );

          if (MediaQuery.disableAnimationsOf(context)) return tile;
          return tile.staggeredEntrance(
            i,
            duration: const Duration(milliseconds: 340),
            slideBegin: 0.045,
          );
        },
      ),
    );
  }

  /// يفتح وجهة الإشعار **داخل التطبيق** (مش في المتصفح).
  /// مفيش وجهة معروفة → نكتفي بتعليمه كمقروء.
  void _openDestination(BuildContext context, AppNotification n) {
    final destination = n.destination;
    if (destination != null) context.push(destination);
  }
}
