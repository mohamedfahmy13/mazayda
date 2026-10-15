import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/state_views.dart';
import '../../domain/entities/auction.dart';
import '../../domain/entities/auction_viewer.dart';
import '../cubit/auction_detail_cubit.dart';
import '../widgets/detail/detail_sections.dart';
import '../widgets/detail/media_gallery.dart';
import '../../../appeals/presentation/cubit/appeals_cubit.dart';
import '../../../appeals/presentation/widgets/new_appeal_sheet.dart';
import '../../../payments/presentation/pages/payment_flow.dart';
import '../../../payments/presentation/widgets/final_payment_sheet.dart';

/// ارتفاع صورة الغلاف في صفحة التفاصيل.
const _coverHeight = 200.0;

/// صفحة تفاصيل المزاد — بتاخد الـ id وتحمّل التفاصيل.
class AuctionDetailPage extends StatelessWidget {
  final String auctionId;
  const AuctionDetailPage({super.key, required this.auctionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuctionDetailCubit>()..load(auctionId),
      child: Scaffold(
        body: BlocBuilder<AuctionDetailCubit, AuctionDetailState>(
          builder: (context, state) {
            return switch (state) {
              AuctionDetailInitial() ||
              AuctionDetailLoading() => const _WithBackButton(
                child: LoadingView(),
              ),
              AuctionDetailError(:final message) => _WithBackButton(
                child: ErrorView(
                  message: message,
                  onRetry: () =>
                      context.read<AuctionDetailCubit>().load(auctionId),
                ),
              ),
              AuctionDetailUnavailable() => const _WithBackButton(
                child: _UnavailableView(),
              ),
              AuctionDetailLoaded(
                :final detail,
                :final isAuthenticated,
                :final account,
              ) =>
                _DetailContent(
                  detail: detail,
                  isAuthenticated: isAuthenticated,
                  account: account,
                ),
            };
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatefulWidget {
  final AuctionDetail detail;
  final bool isAuthenticated;
  final ViewerAccountFlags? account;

  const _DetailContent({
    required this.detail,
    required this.isAuthenticated,
    required this.account,
  });

  @override
  State<_DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<_DetailContent> {
  /// مؤقّت لقطة واحدة على لحظة إقفال المزاد.
  ///
  /// من غيره الزراير بتفضل على حالتها وقت التحميل: مستخدم قاعد على الصفحة
  /// وقت ما المزاد بيقفل كان يفضل شايف «شراء دفتر الشروط» شغّال لحد ما
  /// يقفل الشاشة ويفتحها. دلوقتي بنعيد القراءة من السيرفر في نفس اللحظة،
  /// فالزرار بيتغيّر لوحده (تعديل العميل رقم 3).
  Timer? _closingTimer;

  @override
  void initState() {
    super.initState();
    _scheduleClosing();
  }

  @override
  void didUpdateWidget(_DetailContent old) {
    super.didUpdateWidget(old);
    // السيرفر مدّد المزاد → وقت إقفال جديد، نعيد ضبط المؤقّت.
    if (old.detail.auction.endTime != widget.detail.auction.endTime) {
      _scheduleClosing();
    }
  }

  @override
  void dispose() {
    _closingTimer?.cancel();
    super.dispose();
  }

  void _scheduleClosing() {
    _closingTimer?.cancel();
    final auction = widget.detail.auction;
    final end = auction.endTime;
    if (end == null || auction.isEndedNow) return;

    // ثانية زيادة: نضمن إن السيرفر عدّى اللحظة قبل ما نسأله.
    final left = end.difference(DateTime.now()) + const Duration(seconds: 1);
    _closingTimer = Timer(left, () {
      if (!mounted) return;
      context.read<AuctionDetailCubit>().load(auction.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;
    final auction = detail.auction;
    // الخطوة التالية المتاحة — من meta.viewer لو موجود، وإلا من أعلام الحساب.
    final cta = ctaFor(
      auction,
      detail.viewer,
      isAuthenticated: widget.isAuthenticated,
      account: widget.account,
    );

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _DetailHeaderImage(auction: auction),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: _DetailInfo(auction: auction, viewer: detail.viewer),
                ),
              ],
            ),
          ),
          if (cta != AuctionCta.none)
            _DetailActionBar(auction: auction, cta: cta, viewer: detail.viewer),
        ],
      ),
    );
  }
}

/// رأس الصفحة: معرض الصور (أو صورة الغلاف) + زر الرجوع العائم.
class _DetailHeaderImage extends StatelessWidget {
  final Auction auction;
  const _DetailHeaderImage({required this.auction});

  @override
  Widget build(BuildContext context) {
    final photos = auction.photos;

    return Stack(
      children: [
        // فيه أكتر من صورة → معرض قابل للتمرير والتكبير، غير كده الغلاف.
        if (photos.isNotEmpty)
          MediaGallery(photos: photos, height: _coverHeight.h)
        else
          SizedBox(
            height: _coverHeight.h,
            width: double.infinity,
            child: AppImage(
              url: auction.coverPhotoUrl,
              height: _coverHeight.h,
              width: double.infinity,
              fit: BoxFit.cover,
              fallbackIcon: Icons.gavel,
            ),
          ),
        const _FloatingBackButton(),
      ],
    );
  }
}

/// رجوع للشاشة اللي قبل، أو للرئيسية لو الصفحة اتفتحت مباشرة (من إشعار
/// مثلًا) ومفيش حاجة نرجعلها.
void _leave(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(Routes.home);
  }
}

/// زر الرجوع العائم — لازم يكون جوّه `Stack`.
class _FloatingBackButton extends StatelessWidget {
  const _FloatingBackButton();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      // ننزل الزر أسفل شريط الحالة حتى لا يكون جزء منه خلفه (غير قابل للمس)
      top: MediaQuery.of(context).padding.top + 8.h,
      // `start` مش `right`: الرجوع بيقعد في أول الشاشة — يمين في
      // العربي وشمال في الفرنسي/الإنجليزي.
      start: 14.w,
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        child: IconButton(
          // Flutter بيقلب السهم لوحده حسب الاتجاه — شوف AppIcons.
          icon: const Icon(AppIcons.back, color: AppColors.primary),
          onPressed: () => _leave(context),
        ),
      ),
    );
  }
}

/// حالات ما قبل المحتوى (تحميل · خطأ · غير متاحة) مافيهاش صورة الغلاف اللي
/// شايلة زر الرجوع، فبنحطّه هنا عشان المستخدم مايتحبسش في الشاشة.
class _WithBackButton extends StatelessWidget {
  final Widget child;
  const _WithBackButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        const _FloatingBackButton(),
      ],
    );
  }
}

/// السيرفر رجّع 404 — مسودة أو مزايدة اتشالت (الملغية بقت بتفتح عادي).
class _UnavailableView extends StatelessWidget {
  const _UnavailableView();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.event_busy_outlined,
              size: 48.sp,
              color: AppColors.textHint,
            ),
            Gap(12.h),
            Text(
              t.adUnavailableTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Gap(6.h),
            Text(
              t.adUnavailableBody,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textSecondary,
              ),
            ),
            Gap(20.h),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 160.w),
              child: IntrinsicWidth(
                child: PrimaryButton(
                  label: t.goBack,
                  onPressed: () => _leave(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// كتلة المعلومات أسفل الصورة: الوسوم + العنوان + الموقع + الأسعار + الوصف.
class _DetailInfo extends StatelessWidget {
  final Auction auction;
  final AuctionViewer? viewer;
  const _DetailInfo({required this.auction, required this.viewer});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6.w,
          children: [
            // الملغية بقت بتفتح (رد الباك على MZ-MOB-01) — لازم تبان إنها
            // ملغية، لأن الصفحة من غير أزرار بس مش كفاية توضّح ده.
            if (auction.status == AuctionStatus.cancelled)
              _DetailTag(
                text: t.cancelled,
                fg: AppColors.danger,
                bg: AppColors.dangerBg,
              ),
            if (auction.category != null)
              _DetailTag(
                text: auction.category!.name,
                fg: AppColors.success,
                bg: AppColors.successBg,
              ),
            if (auction.entity != null)
              _DetailTag(
                text: auction.entity!.name,
                fg: AppColors.info,
                bg: AppColors.infoBg,
              ),
          ],
        ),
        Gap(8.h),
        Text(
          auction.title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        if (auction.assetLocation != null) ...[
          Gap(4.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 15.sp,
                color: AppColors.textSecondary,
              ),
              Gap(4.w),
              Expanded(
                child: Text(
                  auction.assetLocation!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
        Gap(14.h),
        Row(
          children: [
            Expanded(
              child: _DetailPriceCard(
                label: t.currentPrice,
                value: auction.currentPrice.formatted,
              ),
            ),
            Gap(10.w),
            Expanded(
              child: _DetailPriceCard(
                label: t.depositRequired,
                value: auction.depositAmount.formatted,
              ),
            ),
          ],
        ),
        if (auction.description != null) ...[
          Gap(16.h),
          Text(
            t.description,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          Gap(6.h),
          Text(
            auction.description!,
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),
        ],

        // أقسام التفاصيل — كل قسم بيخفي نفسه لو مفيش بيانات ليه،
        // فالمزادات البسيطة بتفضل صفحتها قصيرة.
        AuctionSessionSection(auction: auction),
        AuctionPricingSection(auction: auction),
        AuctionAssetSection(auction: auction),
        AuctionSpecsSection(auction: auction),
        AuctionScheduleSection(auction: auction),
        AuctionInspectionSection(auction: auction),
        AuctionLocationSection(auction: auction),
        AuctionLeaseSection(auction: auction),
        AuctionTermsSection(auction: auction),
        AuctionResultSection(auction: auction),
        AuctionDocumentsSection(auction: auction, viewer: viewer),
        Gap(8.h),
      ],
    );
  }
}

/// وسم الفئة / الجهة.
class _DetailTag extends StatelessWidget {
  final String text;
  final Color fg;
  final Color bg;
  const _DetailTag({required this.text, required this.fg, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: fg,
        ),
      ),
    );
  }
}

/// بطاقة سعر (السعر الحالي / مبلغ التأمين).
class _DetailPriceCard extends StatelessWidget {
  final String label;
  final String value;
  const _DetailPriceCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: AppColors.textSecondary),
          ),
          Gap(4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

/// الشريط السفلي — **سلّم أزرار** مقاد بـ `meta.viewer`.
///
/// بيعرض إجراء واحد صحيح حسب موقع المستخدم في الرحلة، بدل زرارين ثابتين
/// كانوا بيظهروا للكل ويوقعوا على 422 من السيرفر برسالة من غير كود يتقري.
class _DetailActionBar extends StatelessWidget {
  final Auction auction;
  final AuctionCta cta;
  final AuctionViewer? viewer;

  const _DetailActionBar({
    required this.auction,
    required this.cta,
    required this.viewer,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final (String label, IconData icon, VoidCallback? onPressed) = _action(
      context,
      t,
    );

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: PrimaryButton(label: label, icon: icon, onPressed: onPressed),
    );
  }

  (String, IconData, VoidCallback?) _action(
    BuildContext context,
    AppLocalizations t,
  ) => switch (cta) {
    AuctionCta.login => (
      t.ctaLogin,
      Icons.login,
      () => context.push(Routes.login),
    ),
    AuctionCta.needsKyc => (
      t.ctaNeedsKyc,
      Icons.verified_user_outlined,
      () => context.push(Routes.kyc),
    ),
    AuctionCta.needsCommerceRegister => (
      t.ctaNeedsCommerceRegister,
      Icons.store_outlined,
      () => context.push(Routes.commercialRegister),
    ),
    AuctionCta.buyBook => (
      t.ctaBuyBook,
      Icons.menu_book_outlined,
      () => _register(context),
    ),
    AuctionCta.register => (
      t.registerAndPay,
      Icons.app_registration,
      () => _register(context),
    ),
    // وضع محدود: مش عارفين هل شارك أو اشترى دفتر الشروط — بنبدأ المسار
    // والسيرفر بيرفض بالرسالة المناسبة لو الخطوة اتعملت قبل كده.
    AuctionCta.participate => (
      t.ctaParticipate,
      Icons.app_registration,
      () => _register(context),
    ),
    AuctionCta.bid => (
      t.bid,
      Icons.gavel,
      () => context.push(
        '${Routes.liveBidding}/${auction.id}',
        extra: {'title': auction.title},
      ),
    ),
    // نعرض تفصيل الرسوم والمهلة الأول — الفايز ما يدخلش بوابة دفع
    // من غير ما يعرف المبلغ المستحق وآخر أجل.
    AuctionCta.finalPayment => (
      t.ctaFinalPayment,
      Icons.payments_outlined,
      () => _openFinalPaymentSheet(context),
    ),
    // مدفوع بالفعل — زرار معطّل كتأكيد بصري.
    AuctionCta.finalPaymentDone => (
      t.ctaFinalPaymentDone,
      Icons.check_circle_outline,
      null,
    ),
    AuctionCta.appeal => (
      t.ctaAppeal,
      Icons.balance,
      () => _openAppealSheet(context),
    ),
    AuctionCta.trackAppeal => (
      viewer?.existingAppeal?.statusLabel ?? t.ctaTrackAppeal,
      Icons.balance,
      () => context.push(Routes.appeals),
    ),
    AuctionCta.none => ('', Icons.info_outline, null),
  };

  /// مسار التسجيل + إعادة تحميل المزاد لو حالته اتغيّرت.
  ///
  /// من غير إعادة التحميل الشاشة بتفضل بتعرض «سجّل وادفع» بعد دفعة ناجحة —
  /// حالة المزاد محمّلة مرة واحدة عند فتح الصفحة، فالمستخدم مكانش بيشوف
  /// النتيجة غير لما يقفل التطبيق ويفتحه.
  Future<void> _register(BuildContext context) async {
    final cubit = context.read<AuctionDetailCubit>();
    if (await PaymentFlow.startRegistration(context, auction)) {
      await cubit.load(auction.id);
    }
  }

  void _openFinalPaymentSheet(BuildContext context) {
    final cubit = context.read<AuctionDetailCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FinalPaymentSheet(
        auctionId: auction.id,
        onConfirm: () async {
          if (await PaymentFlow.startFinalPayment(context, auction.id)) {
            await cubit.load(auction.id);
          }
        },
      ),
    );
  }

  void _openAppealSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider(
        create: (_) => getIt<AppealsCubit>(),
        child: NewAppealSheet(auctionId: auction.id),
      ),
    );
  }
}
