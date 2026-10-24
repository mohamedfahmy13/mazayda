/// ثوابت الـ API — مأخوذة من Postman collection الفعلية (نسخة محدّثة: 53 endpoint)
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://mazayada.findosystem.com';
  static const String apiPrefix = '/api/v1';

  // مهلات الاتصال (بالملي ثانية)
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // ===== Realtime (Reverb — بروتوكول Pusher) =====
  // ⚠️ **مفيش مفاتيح hardcoded.** الإعدادات بتتقرا وقت التشغيل من
  // `GET /ping → data.realtime` (BE-14)، فتغيير البيئة مايحتاجش إصدار جديد.
  // راجع `core/realtime/realtime_config.dart`.

  /// قناة المزاد العامة — «السعر اتحرك».
  static String auctionChannel(String auctionId) => 'auction.$auctionId';

  /// قناة المستخدم الخاصة على مزاد — «عرضك إنت اللي اتغلب» (BE-10).
  /// لازم البادئة `private-` لأن Pusher/Reverb بيميّزوا القنوات بالبادئة.
  static String personalAuctionChannel(String auctionId, String userId) =>
      'private-auction.$auctionId.user.$userId';

  // أسماء الأحداث المتوقّعة من الخادم (Laravel broadcasting)
  static const String evtNewBid = 'bid.placed';
  static const String evtPriceUpdate = 'price.updated';

  /// حدث القناة الخاصة (BE-10) — حمولته `{type, auction_id, timestamp, …}`.
  static const String evtPersonalAuction = 'auction.personal';

  // ⚠️ auth القنوات الخاصة — لاحظ أنه بدون /v1 (المسار /api/broadcasting/auth).
  // بيتأكّد بالتوكن مش بالجلسة، والباك بيرجّعه في `realtime.auth_endpoint`.
  static const String broadcastingAuth = '/api/broadcasting/auth';

  // ===== Auth =====
  static const String register = '$apiPrefix/auth/register';
  static const String login = '$apiPrefix/auth/login';
  static const String verifyOtp = '$apiPrefix/auth/verify-otp';
  static const String resendOtp = '$apiPrefix/auth/resend-otp';
  static const String refresh = '$apiPrefix/auth/refresh';
  static const String me = '$apiPrefix/auth/me';
  static const String logout = '$apiPrefix/auth/logout';
  // استرجاع كلمة السر (خطوتان: طلب رمز ثم التحقق وتعيين كلمة جديدة)
  static const String passwordRequest = '$apiPrefix/auth/password/request';
  static const String passwordVerify = '$apiPrefix/auth/password/verify';
  // الاسترجاع بالسؤال السري (خطوتان: كشف السؤال ثم التحقق من الإجابة)
  static const String recoverReveal = '$apiPrefix/auth/recover/reveal';
  static const String recoverVerify = '$apiPrefix/auth/recover/verify';
  // استرجاع البريد الإلكتروني المفقود (تعديل العميل رقم 1) — مسار **غير
  // مصادَق**: المواطن فقد بريده فمش قادر يسجّل دخول ولا يستقبل رمز.
  // الرفع multipart (صورة سيلفي مع بطاقة الهوية)، والطلب بيراجَع يدويًا.
  static const String emailRecovery = '$apiPrefix/auth/email-recovery';
  static const String emailRecoveryStatus =
      '$apiPrefix/auth/email-recovery/status';

  // ===== Auctions (تصفّح عام للقراءة فقط) =====
  static const String auctions = '$apiPrefix/auctions';
  static const String auctionSearch =
      '$apiPrefix/auctions/search'; // ?q (حد أدنى حرفان)
  static const String auctionFilters =
      '$apiPrefix/auctions/filters'; // ?wilaya (اختياري)
  static String auctionDetail(String id) => '$apiPrefix/auctions/$id';
  static String auctionBids(String id) =>
      '$apiPrefix/auctions/$id/bids'; // ?limit
  static String auctionPrice(String id) => '$apiPrefix/auctions/$id/price';
  static String auctionQuestions(String id) =>
      '$apiPrefix/auctions/$id/questions';

  // ===== Auction registration / participation =====
  // ⚠️ استبدل acknowledge-book القديم — buy-book الآن عملية دفع تُرجع redirect_url
  static String buyBook(String id) => '$apiPrefix/auctions/$id/buy-book';
  static String registerInAuction(String id) =>
      '$apiPrefix/auctions/$id/register';
  static String placeBid(String id) => '$apiPrefix/auctions/$id/bid';

  // ===== Payments =====
  static String paymentStatus(String ref) => '$apiPrefix/payments/$ref/status';
  static const String paymentCallback =
      '$apiPrefix/payments/callback'; // ?ref&decision
  // الدفع النهائي للفائز: معاينة الرسوم (قراءة فقط) ثم بدء الدفع
  static String finalPaymentPreview(String id) =>
      '$apiPrefix/auctions/$id/final-payment/preview';
  static String finalPayment(String id) =>
      '$apiPrefix/auctions/$id/final-payment';

  // ===== Auction Q&A =====
  static String askQuestion(String id) => '$apiPrefix/auctions/$id/questions';

  // ===== Appeals (الطعون) =====
  static const String appeals = '$apiPrefix/appeals';
  static String appealDetail(String id) => '$apiPrefix/appeals/$id';
  static String submitAppeal(String auctionId) =>
      '$apiPrefix/auctions/$auctionId/appeals';

  // ===== Dashboard =====
  static const String dashboard = '$apiPrefix/dashboard';
  // التبويبات مناظير مش تقسيم حصري، و`all` هو الشامل (BE-3).
  static const String myAuctions =
      '$apiPrefix/my-auctions'; // ?tab=all|active|won|lost|upcoming

  // ===== Geographic =====
  static const String wilayas = '$apiPrefix/wilayas';
  static String communes(int wilayaId) =>
      '$apiPrefix/wilayas/$wilayaId/communes';

  // ===== KYC =====
  static const String kyc = '$apiPrefix/kyc';
  static String kycUpload(String type) => '$apiPrefix/kyc/upload/$type';
  static const String kycSubmit = '$apiPrefix/kyc/submit';
  static String kycDocument(String type) => '$apiPrefix/kyc/document/$type';

  // ===== Commercial Register (السجل التجاري) — بوابة موازية للـ KYC =====
  static const String commercialRegister = '$apiPrefix/commercial-register';
  static String commercialRegisterDocument(String type) =>
      '$apiPrefix/commercial-register/document/$type'; // register | tax-card

  // ===== Notifications =====
  static const String notifications = '$apiPrefix/notifications';
  static const String notificationsUnreadCount =
      '$apiPrefix/notifications/unread-count';
  static const String readAll = '$apiPrefix/notifications/read-all';
  static String markNotificationRead(String id) =>
      '$apiPrefix/notifications/$id/read';

  // ===== Premium subscription (تعديلات العميل 24 · 25 · 26) =====
  // GET بيرجّع الاشتراك الحالي + الباقات في نداء واحد،
  // POST بيبدأ الدفع (بيرجّع redirect_url + ref زي باقي المدفوعات)،
  // DELETE بيوقف التجديد التلقائي من غير ما يلغي المدة المدفوعة.
  static const String subscription = '$apiPrefix/subscription';

  // ===== تفضيلات الإشعارات (تعديلات العميل 27 · 28 · 30) =====
  // GET + PUT على نفس المسار: القنوات + أنواع المزايدات المفضّلة.
  static const String notificationPreferences =
      '$apiPrefix/preferences/notifications';

  // ===== Profile =====
  static const String profile = '$apiPrefix/profile'; // GET + PUT

  // ===== حذف الحساب (App Store 5.1.1(v)) =====
  // الفحص الأول (هل فيه موانع؟) وبعدين DELETE بكلمة السر الحالية.
  static const String accountDeletionCheck =
      '$apiPrefix/account/deletion-check';
  static const String account = '$apiPrefix/account'; // DELETE {password}

  // ===== Documents (مكتبة وثائق المستخدم) =====
  static const String documents =
      '$apiPrefix/documents'; // ?search&type[]&preset&...
  static const String documentsSummary = '$apiPrefix/documents/summary';
  static String document(String id) => '$apiPrefix/documents/$id/download';

  // ===== Financial Reports (تقاريري المالية) =====
  static const String reportsSummary = '$apiPrefix/reports/summary';
  static const String reportsTransactions = '$apiPrefix/reports/transactions';

  // ===== Documents — خيارات الفلاتر مقيّدة بوثائق المستخدم (BE-4) =====
  static const String documentsFilters = '$apiPrefix/documents/filters';

  // ===== Devices (Push) — BE-11 =====
  // POST للتسجيل (idempotent) و DELETE لفكّ الربط، والاتنين بيرجّعوا 204.
  static const String devices = '$apiPrefix/devices';
  static const String devicesStatus = '$apiPrefix/devices/status';

  // ===== Document verification (قارئ QR) — BE-9 =====
  // نسخة JSON من صفحة /verify: `?doc=&sig=` → {valid, document}.
  // وثيقة مجهولة أو توقيع غلط = 200 مع valid:false (مش 404).
  static const String verifyDocument = '$apiPrefix/verify';

  // ===== System =====
  static const String ping = '$apiPrefix/ping';
}
