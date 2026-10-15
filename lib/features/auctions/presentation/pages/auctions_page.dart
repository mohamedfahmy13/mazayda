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
import '../../../../core/widgets/state_views.dart';
import '../cubit/auctions_cubit.dart';
import '../widgets/auction_card.dart';
import '../widgets/auction_filter_options.dart';
import '../widgets/auction_status_strip.dart';
import '../widgets/auction_context_bar.dart';
import '../widgets/auctions_list_states.dart';
import '../widgets/auction_filter_sheet.dart';
import '../widgets/auctions_home_header.dart';

/// مسافة من نهاية القائمة (بكسل) نبدأ عندها تحميل الصفحة التالية.
const _loadMoreThreshold = 240.0;

class AuctionsPage extends StatelessWidget {
  const AuctionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuctionsCubit>()..init(),
      child: const _AuctionsBody(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Body
// ═══════════════════════════════════════════════════════════════════════════

class _AuctionsBody extends StatefulWidget {
  const _AuctionsBody();

  @override
  State<_AuctionsBody> createState() => _AuctionsBodyState();
}

class _AuctionsBodyState extends State<_AuctionsBody> {
  final _searchCtrl = TextEditingController();
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  void _onScroll() {
    if (!mounted) return;
    final pos = _scroll.position;
    if (pos.pixels >= pos.maxScrollExtent - _loadMoreThreshold) {
      context.read<AuctionsCubit>().loadMore();
    }
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _openFilterSheet(AuctionsCubit cubit) async {
    final wilayas = await cubit.fetchWilayas();
    if (!mounted) return;
    final state = cubit.state;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AuctionFilterSheet(
        wilayas: wilayas,
        initialType: state.typeFilter,
        initialWilaya: state.wilaya,
        onApply: (type, wilaya) =>
            cubit.applyFilters(type: type, wilaya: wilaya),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuctionsCubit, AuctionsState>(
      // لو تم مسح البحث من الـ cubit (مسح الكل) نفرّغ حقل النص
      listenWhen: (p, c) => c.query.isEmpty && _searchCtrl.text.isNotEmpty,
      listener: (_, __) => _searchCtrl.clear(),
      builder: (context, state) {
        final t = AppLocalizations.of(context);
        final cubit = context.read<AuctionsCubit>();
        final hasSecondary = state.typeFilter != null || state.wilaya != null;
        final showContext = hasSecondary || state.query.isNotEmpty;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              AuctionsHomeHeader(
                searchController: _searchCtrl,
                hasSearchText: state.query.isNotEmpty,
                onSearchChanged: cubit.search,
                onClearSearch: () {
                  _searchCtrl.clear();
                  cubit.search('');
                },
                onNotificationsTap: () => context.go(Routes.notifications),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 0),
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(
                    color: AppColors.border.withValues(alpha: 0.8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.035),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: AuctionStatusStrip(
                  current: state.statusFilter,
                  filterCount: cubit.activeFilterCount,
                  onSelectStatus: cubit.setStatus,
                  onOpenFilters: () => _openFilterSheet(cubit),
                ),
              ),
              // — شريط السياق (نتائج + فلاتر نشطة) —
              AuctionContextBar(
                visible: showContext,
                count: state.auctions.length,
                hasMore: state.hasMore,
                typeLabel: state.typeFilter == null
                    ? null
                    : auctionTypeFilterLabel(state.typeFilter, t),
                wilayaLabel: state.wilaya?.nameFor(
                  Localizations.localeOf(context).languageCode,
                ),
                query: state.query,
                onClearType: () =>
                    cubit.applyFilters(type: null, wilaya: state.wilaya),
                onClearWilaya: () =>
                    cubit.applyFilters(type: state.typeFilter, wilaya: null),
                onClearAll: cubit.clearFilters,
              ),
              // — القائمة —
              Expanded(child: _buildBody(context, cubit, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    AuctionsCubit cubit,
    AuctionsState state,
  ) {
    if (state.loading && state.auctions.isEmpty) {
      return const AuctionsLoadingList();
    }
    if (state.error != null && state.auctions.isEmpty) {
      return ErrorView(message: state.error!, onRetry: cubit.refresh);
    }
    if (state.auctions.isEmpty) {
      return AuctionsNoResults(onReset: cubit.clearFilters);
    }
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: cubit.refresh,
      child: ListView.builder(
        controller: _scroll,
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
        itemCount: state.auctions.length + 2,
        itemBuilder: (_, i) {
          if (i == 0) {
            return _ResultsHeader(state: state);
          }
          if (i == state.auctions.length + 1) {
            return AuctionsListFooter(state: state);
          }
          final auctionIndex = i - 1;
          final a = state.auctions[auctionIndex];
          return AuctionCard(
            auction: a,
            onTap: () => context.push('${Routes.auctionDetail}/${a.id}'),
          ).staggeredEntrance(
            auctionIndex,
            duration: const Duration(milliseconds: 360),
            slideBegin: 0.045,
          );
        },
      ),
    );
  }
}

class _ResultsHeader extends StatelessWidget {
  final AuctionsState state;
  const _ResultsHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final label = auctionStatusFilterLabel(state.statusFilter, t);
    final count = '${state.auctions.length}${state.hasMore ? '+' : ''}';

    return Padding(
      padding: EdgeInsets.only(bottom: 11.h, top: 2.h),
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
                label,
                key: ValueKey(state.statusFilter),
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
              t.auctionsCount(count),
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
