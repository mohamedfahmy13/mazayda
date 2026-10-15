import 'package:equatable/equatable.dart';
import 'auction.dart';

/// طعن قائم من نفس المستخدم على هذا المزاد.
class ViewerAppealRef extends Equatable {
  final String id;
  final String status; // PENDING | APPROVED | REJECTED
  final String? statusLabel; // نص جاهز مترجَم من السيرفر

  const ViewerAppealRef({
    required this.id,
    required this.status,
    this.statusLabel,
  });

  @override
  List<Object?> get props => [id, status];
}

/// سياق المستخدم الحالي بالنسبة لمزاد معيّن — من `meta.viewer`.
///
/// **بيرجع `null` للزائر** بس: مسار المزاد فيه مصادقة اختيارية (BE-15)،
/// فبيحلّ التوكن لو مبعوت وبيسيب الضيف يعدّي. `null` ممكن كذلك لو التوكن
/// منتهي أو مش توكن `access` — وساعتها بنرجع لأعلام الحساب من `/profile`.
///
/// ده **العقد الرسمي للتحكّم في الأزرار**: بنقرأ منه مباشرة بدل ما نعيد
/// اشتقاق الصلاحيات من الحالات الخام. ولو المستخدم وصل لرفض بالغلط، الرفض
/// بقى بكود يتقري (BE-16) فبنعرف نتصرّف بدل ما نطابق نص.
class AuctionViewer extends Equatable {
  final bool canBid;
  final bool isParticipant;
  final bool hasCommerceRegister;

  /// المزاد بيتطلّب سجل تجاري والمستخدم مالوش — بيمنع **أي** دفع على المزاد
  /// ده، بما فيه شراء دفتر الشروط (مش بس الكفالة).
  final bool commerceRegisterBlocked;

  final bool hasBookAccess;
  final bool bookPurchased;
  final bool depositPaid;
  final bool isWinner;
  final bool canAppeal;
  final ViewerAppealRef? existingAppeal;
  final bool hasFinalPayment;

  /// حساب موظّف (إدارة أو جهة) — المشاركة كلها متخصّه (تعديل العميل رقم 4).
  ///
  /// بيجي مع كل رد تفاصيل، فهو أدقّ من [ViewerAccountFlags.isStaff] اللي
  /// بيتقرا من كاش البروفايل: لو دور الحساب اتغيّر، الرد الجاي بيعكسه فورًا.
  final bool isStaff;

  /// دور الحساب زي ما السيرفر بيسمّيه (`CITIZEN`، `SUPER_ADMIN`…).
  final String? role;

  /// مشترك في العضوية المميّزة (تعديلات 24–29).
  final bool isPremium;

  const AuctionViewer({
    this.canBid = false,
    this.isParticipant = false,
    this.hasCommerceRegister = false,
    this.commerceRegisterBlocked = false,
    this.hasBookAccess = false,
    this.bookPurchased = false,
    this.depositPaid = false,
    this.isWinner = false,
    this.canAppeal = false,
    this.existingAppeal,
    this.hasFinalPayment = false,
    this.isStaff = false,
    this.role,
    this.isPremium = false,
  });

  @override
  List<Object?> get props => [
    canBid,
    isParticipant,
    commerceRegisterBlocked,
    hasBookAccess,
    isWinner,
    canAppeal,
    hasFinalPayment,
    isStaff,
    role,
    isPremium,
  ];
}

/// تفاصيل المزاد + سياق المستخدم — نتيجة `GET /auctions/{id}`.
class AuctionDetail extends Equatable {
  final Auction auction;

  /// null للزائر غير المسجّل.
  final AuctionViewer? viewer;

  const AuctionDetail({required this.auction, this.viewer});

  @override
  List<Object?> get props => [auction, viewer];
}

/// الخطوة التالية المتاحة للمستخدم على المزاد.
enum AuctionCta {
  login,
  needsCommerceRegister,
  needsKyc,
  buyBook,
  register,
  bid,
  finalPayment,
  finalPaymentDone,
  appeal,
  trackAppeal,

  /// مسجّل دخول لكن **سياق المستخدم غير متاح** من الـ API.
  /// بنعرض مدخل مشاركة عام والسيرفر هو اللي يفرض القيود الحقيقية.
  participate,

  none,
}

/// أعلام الحساب اللي بنحتاجها لما `meta.viewer` ما يجيش.
///
/// بعد BE-15 ده بقى مسار **استثنائي** مش الطبيعي: بيحصل لو التوكن انتهى
/// (والمصادقة الاختيارية عاملتنا ضيوف) قبل ما الـ interceptor يجدّده.
/// بتتقرا من `/profile` — مسار مصادَق فبيشتغل صح دايمًا.
class ViewerAccountFlags {
  final bool canBid;
  final bool isKycComplete;
  final bool hasCommerceRegister;
  final bool isBlacklisted;

  /// حساب موظّف (إدارة / جهة) مش مواطن — المشاركة كلها متخصّه.
  final bool isStaff;

  const ViewerAccountFlags({
    this.canBid = false,
    this.isKycComplete = false,
    this.hasCommerceRegister = false,
    this.isBlacklisted = false,
    this.isStaff = false,
  });
}

/// سلّم الأزرار — أول شرط يتحقّق هو اللي بيتعرض (نفس ترتيب الويب).
/// دالة نقية عشان تفضل قابلة للاختبار ومستقلة عن الواجهة.
///
/// **مهم:** حالة تسجيل الدخول بتتحدد من [isAuthenticated] (حالة التطبيق)
/// **مش** من `viewer == null`. بعد BE-15 الـ viewer بقى بيتعبّى للمستخدم
/// المسجّل، بس المصادقة على المسار **اختيارية**: توكن منتهي أو غلط بيعدّي
/// كضيف من غير 401. فلو اعتمدنا على `viewer == null` كنا هنرمي مستخدم
/// موثّق على شاشة تسجيل الدخول بمجرد انتهاء صلاحية توكنه.
AuctionCta ctaFor(
  Auction auction,
  AuctionViewer? viewer, {
  required bool isAuthenticated,
  ViewerAccountFlags? account,
}) {
  // الملغية (أو المسودة) مالهاش أي إجراء، ولا حتى «سجّل دخولك». الشرط ده
  // أول حاجة لأن وقت الإقفال ممكن يكون لسه جاي فـ`isEndedNow` مش هيلقطها.
  if (auction.status == AuctionStatus.cancelled ||
      auction.status == AuctionStatus.draft) {
    return AuctionCta.none;
  }

  if (!isAuthenticated) return AuctionCta.login;

  // شراء دفتر الشروط والمشاركة عمومًا **للمواطن بس** — حساب الإدارة أو
  // الجهة بيتفرّج ومابيشاركش (تعديل العميل رقم 4).
  //
  // `viewer.isStaff` بيجي مع الرد نفسه فهو الأحدث؛ `account` احتياطي لما
  // الـ viewer يغيب أصلًا.
  if ((viewer?.isStaff ?? false) || (account?.isStaff ?? false)) {
    return AuctionCta.none;
  }

  // `isEndedNow` مش `hasEnded`: بيحسب عدّاد الإقفال كمان فالزرار بيتقفل
  // لحظة انتهاء الوقت مش عند إعادة التحميل الجاية (تعديل العميل رقم 3).
  final ended = auction.isEndedNow;

  // ===== سياق المستخدم متاح: السلّم الكامل والدقيق =====
  if (viewer != null) {
    if (viewer.commerceRegisterBlocked) {
      return AuctionCta.needsCommerceRegister;
    }
    if (!viewer.canBid) return AuctionCta.needsKyc;

    if (ended) {
      if (viewer.isWinner) {
        return viewer.hasFinalPayment
            ? AuctionCta.finalPaymentDone
            : AuctionCta.finalPayment;
      }
      if (viewer.existingAppeal != null) return AuctionCta.trackAppeal;
      if (viewer.canAppeal) return AuctionCta.appeal;
      return AuctionCta.none;
    }

    // البيع مقفول (انتهى الوقت أو المزاد اتلغي) ومالوش دفتر → مفيش طريق
    // للمشاركة خلاص، فمانعرضش زرار هيترفض بـ`book_sales_closed`.
    if (!viewer.hasBookAccess) {
      return auction.isBookPurchaseClosed
          ? AuctionCta.none
          : AuctionCta.buyBook;
    }
    if (!viewer.isParticipant) return AuctionCta.register;
    if (auction.isBiddable) return AuctionCta.bid;
    return AuctionCta.none;
  }

  // ===== وضع محدود: مسجّل دخول بس من غير سياق للمزاد =====
  // بنطبّق بوابات الحساب اللي نعرفها من البروفايل، والباقي (هل شارك؟ هل
  // اشترى دفتر الشروط؟) بيفرضه السيرفر عند أول محاولة.
  if (account != null) {
    if (account.isBlacklisted || !account.canBid) return AuctionCta.needsKyc;
    if (auction.requiresCommerceRegister && !account.hasCommerceRegister) {
      return AuctionCta.needsCommerceRegister;
    }
  }

  if (ended) return AuctionCta.none;
  return AuctionCta.participate;
}
