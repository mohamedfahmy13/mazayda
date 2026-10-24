import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/list_entrance_animation.dart';
import '../../../../core/widgets/signed_in_gate.dart';
import '../../../../core/widgets/state_views.dart';
import '../cubit/my_auctions_cubit.dart';
import '../widgets/my_auction_card.dart';
import '../widgets/my_auction_labels.dart';
import '../widgets/my_auction_tab_bar.dart';
import '../widgets/my_auctions_header.dart';
import '../widgets/my_auctions_list_states.dart';

class MyAuctionsPage extends StatelessWidget {
  const MyAuctionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return SignedInGate(
      title: t.navMyAuctions,
      icon: Icons.account_balance_wallet_outlined,
      message: t.guestMyAuctionsBody,
      builder: (_) => BlocProvider(
        create: (_) => getIt<MyAuctionsCubit>()..load(),
        child: const _MyAuctionsView(),
      ),
    );
  }
}

class _MyAuctionsView extends StatelessWidget {
  const _MyAuctionsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<MyAuctionsCubit, MyAuctionsState>(
        builder: (context, state) {
          return Column(
            children: [
              MyAuctionsHeader(
                counts: state.counts,
                onNotificationsTap: () => context.go(Routes.notifications),
              ),
              MyAuctionTabBar(
                selected: state.tab,
                counts: state.counts,
                onSelect: context.read<MyAuctionsCubit>().changeTab,
              ),
              Expanded(child: _Content(state: state)),
            ],
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final MyAuctionsState state;

  const _Content({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyAuctionsCubit>();
    if (state.loading) return const MyAuctionsLoadingList();
    if (state.error != null) {
      return ErrorView(message: state.error!, onRetry: cubit.load);
    }
    if (state.items.isEmpty) {
      return MyAuctionsEmptyState(
        tab: state.tab,
        onBrowseAuctions: () => context.go(Routes.home),
      );
    }
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: cubit.load,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
        itemCount: state.items.length + 1,
        itemBuilder: (_, i) {
          if (i == 0) return _ResultsHeader(state: state);

          final itemIndex = i - 1;
          final item = state.items[itemIndex];
          final card = MyAuctionCard(
            item: item,
            tab: state.tab,
            onTap: () => context.push('${Routes.auctionDetail}/${item.id}'),
          );

          if (MediaQuery.disableAnimationsOf(context)) return card;
          return card.staggeredEntrance(
            itemIndex,
            duration: const Duration(milliseconds: 360),
            slideBegin: 0.045,
          );
        },
      ),
    );
  }
}

class _ResultsHeader extends StatelessWidget {
  final MyAuctionsState state;

  const _ResultsHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 11.h, top: 1.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 22.h,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          Gap(8.w),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: Text(
                state.tab.label(t),
                key: ValueKey(state.tab),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.075),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              AppLocalizations.of(
                context,
              ).auctionsCount('${state.items.length}'),
              style: TextStyle(
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
