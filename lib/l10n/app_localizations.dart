import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'مزايدة'**
  String get appName;

  /// No description provided for @navHome.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get navHome;

  /// No description provided for @navMyAuctions.
  ///
  /// In ar, this message translates to:
  /// **'مزايداتي'**
  String get navMyAuctions;

  /// No description provided for @navPayments.
  ///
  /// In ar, this message translates to:
  /// **'المدفوعات'**
  String get navPayments;

  /// No description provided for @navProfile.
  ///
  /// In ar, this message translates to:
  /// **'حسابي'**
  String get navProfile;

  /// No description provided for @splashTagline.
  ///
  /// In ar, this message translates to:
  /// **'المنصة الوطنية للمزادات الحكومية'**
  String get splashTagline;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @loginButton.
  ///
  /// In ar, this message translates to:
  /// **'دخول'**
  String get loginButton;

  /// No description provided for @register.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get register;

  /// No description provided for @noAccountRegister.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟ إنشاء حساب'**
  String get noAccountRegister;

  /// No description provided for @ninOrEmail.
  ///
  /// In ar, this message translates to:
  /// **'رقم التعريف أو البريد'**
  String get ninOrEmail;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// No description provided for @showPassword.
  ///
  /// In ar, this message translates to:
  /// **'إظهار كلمة المرور'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In ar, this message translates to:
  /// **'إخفاء كلمة المرور'**
  String get hidePassword;

  /// No description provided for @birthDate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الميلاد'**
  String get birthDate;

  /// No description provided for @selectBirthDate.
  ///
  /// In ar, this message translates to:
  /// **'اختر تاريخ الميلاد'**
  String get selectBirthDate;

  /// No description provided for @nin.
  ///
  /// In ar, this message translates to:
  /// **'رقم التعريف الوطني (NIN)'**
  String get nin;

  /// No description provided for @ninHint.
  ///
  /// In ar, this message translates to:
  /// **'18 رقم'**
  String get ninHint;

  /// No description provided for @firstName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In ar, this message translates to:
  /// **'اللقب'**
  String get lastName;

  /// No description provided for @phone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @nextVerify.
  ///
  /// In ar, this message translates to:
  /// **'التالي — التحقق'**
  String get nextVerify;

  /// No description provided for @verifyEmailTitle.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد البريد الإلكتروني'**
  String get verifyEmailTitle;

  /// No description provided for @otpHint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل الرمز المكوّن من 6 أرقام المرسل إلى بريدك'**
  String get otpHint;

  /// No description provided for @confirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد'**
  String get confirm;

  /// No description provided for @resendCode.
  ///
  /// In ar, this message translates to:
  /// **'إعادة إرسال الرمز'**
  String get resendCode;

  /// No description provided for @resendIn.
  ///
  /// In ar, this message translates to:
  /// **'إعادة الإرسال خلال {seconds} ثانية'**
  String resendIn(int seconds);

  /// No description provided for @resendInTimer.
  ///
  /// In ar, this message translates to:
  /// **'إعادة الإرسال خلال {time}'**
  String resendInTimer(String time);

  /// No description provided for @activeAuctions.
  ///
  /// In ar, this message translates to:
  /// **'المزادات النشطة'**
  String get activeAuctions;

  /// No description provided for @noAuctions.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مزادات حاليًا'**
  String get noAuctions;

  /// No description provided for @currentPrice.
  ///
  /// In ar, this message translates to:
  /// **'السعر الحالي'**
  String get currentPrice;

  /// No description provided for @openingPrice.
  ///
  /// In ar, this message translates to:
  /// **'السعر الافتتاحي'**
  String get openingPrice;

  /// No description provided for @highestBid.
  ///
  /// In ar, this message translates to:
  /// **'أعلى مزايدة'**
  String get highestBid;

  /// No description provided for @depositRequired.
  ///
  /// In ar, this message translates to:
  /// **'التأمين المطلوب'**
  String get depositRequired;

  /// No description provided for @bidders.
  ///
  /// In ar, this message translates to:
  /// **'{count} مزايد'**
  String bidders(int count);

  /// No description provided for @live.
  ///
  /// In ar, this message translates to:
  /// **'مباشر'**
  String get live;

  /// No description provided for @comingSoon.
  ///
  /// In ar, this message translates to:
  /// **'قريبًا'**
  String get comingSoon;

  /// No description provided for @active.
  ///
  /// In ar, this message translates to:
  /// **'نشط'**
  String get active;

  /// No description provided for @ended.
  ///
  /// In ar, this message translates to:
  /// **'منتهٍ'**
  String get ended;

  /// No description provided for @cancelled.
  ///
  /// In ar, this message translates to:
  /// **'ملغى'**
  String get cancelled;

  /// No description provided for @description.
  ///
  /// In ar, this message translates to:
  /// **'الوصف'**
  String get description;

  /// No description provided for @auctionsTitle.
  ///
  /// In ar, this message translates to:
  /// **'المزادات'**
  String get auctionsTitle;

  /// No description provided for @searchAuctionHint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن مزاد...'**
  String get searchAuctionHint;

  /// No description provided for @filter.
  ///
  /// In ar, this message translates to:
  /// **'تصفية'**
  String get filter;

  /// No description provided for @filterAll.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get filterAll;

  /// No description provided for @filterStatusActive.
  ///
  /// In ar, this message translates to:
  /// **'نشط'**
  String get filterStatusActive;

  /// No description provided for @filterStatusUpcoming.
  ///
  /// In ar, this message translates to:
  /// **'قادم'**
  String get filterStatusUpcoming;

  /// No description provided for @filterStatusExtended.
  ///
  /// In ar, this message translates to:
  /// **'مُمدّد'**
  String get filterStatusExtended;

  /// No description provided for @filterStatusClosed.
  ///
  /// In ar, this message translates to:
  /// **'مُغلق'**
  String get filterStatusClosed;

  /// No description provided for @auctionsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count} مزاد'**
  String auctionsCount(String count);

  /// No description provided for @clearAll.
  ///
  /// In ar, this message translates to:
  /// **'مسح الكل'**
  String get clearAll;

  /// No description provided for @noMoreResults.
  ///
  /// In ar, this message translates to:
  /// **'— لا مزيد من النتائج —'**
  String get noMoreResults;

  /// No description provided for @noMatchingAuctions.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مزادات مطابقة'**
  String get noMatchingAuctions;

  /// No description provided for @tryAdjustingFilters.
  ///
  /// In ar, this message translates to:
  /// **'جرّب تعديل البحث أو الفلاتر'**
  String get tryAdjustingFilters;

  /// No description provided for @resetFilters.
  ///
  /// In ar, this message translates to:
  /// **'إعادة تعيين الفلاتر'**
  String get resetFilters;

  /// No description provided for @filterAuctions.
  ///
  /// In ar, this message translates to:
  /// **'تصفية المزادات'**
  String get filterAuctions;

  /// No description provided for @type.
  ///
  /// In ar, this message translates to:
  /// **'النوع'**
  String get type;

  /// No description provided for @wilaya.
  ///
  /// In ar, this message translates to:
  /// **'الولاية'**
  String get wilaya;

  /// No description provided for @clearSelection.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء التحديد'**
  String get clearSelection;

  /// No description provided for @searchWilayaHint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن ولاية...'**
  String get searchWilayaHint;

  /// No description provided for @wilayasLoadError.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر تحميل الولايات'**
  String get wilayasLoadError;

  /// No description provided for @noWilayaMatch.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد ولاية بهذا الاسم'**
  String get noWilayaMatch;

  /// No description provided for @reset.
  ///
  /// In ar, this message translates to:
  /// **'إعادة تعيين'**
  String get reset;

  /// No description provided for @showResults.
  ///
  /// In ar, this message translates to:
  /// **'عرض النتائج'**
  String get showResults;

  /// No description provided for @registerAndPay.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل ودفع'**
  String get registerAndPay;

  /// No description provided for @bid.
  ///
  /// In ar, this message translates to:
  /// **'مزايدة'**
  String get bid;

  /// No description provided for @liveBidding.
  ///
  /// In ar, this message translates to:
  /// **'المزاد المباشر'**
  String get liveBidding;

  /// No description provided for @bidHistory.
  ///
  /// In ar, this message translates to:
  /// **'سجل المزايدات'**
  String get bidHistory;

  /// No description provided for @noBidsYet.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مزايدات بعد'**
  String get noBidsYet;

  /// No description provided for @youAreHighest.
  ///
  /// In ar, this message translates to:
  /// **'أنت صاحب أعلى مزايدة'**
  String get youAreHighest;

  /// No description provided for @placeBidAmount.
  ///
  /// In ar, this message translates to:
  /// **'زايد بـ {amount}'**
  String placeBidAmount(String amount);

  /// No description provided for @currentHighestBid.
  ///
  /// In ar, this message translates to:
  /// **'أعلى مزايدة حالية'**
  String get currentHighestBid;

  /// No description provided for @currencyDzd.
  ///
  /// In ar, this message translates to:
  /// **'دج'**
  String get currencyDzd;

  /// No description provided for @bidsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count} مزايدة'**
  String bidsCount(int count);

  /// No description provided for @kycTitle.
  ///
  /// In ar, this message translates to:
  /// **'التحقق من الهوية (KYC)'**
  String get kycTitle;

  /// No description provided for @kycWarning.
  ///
  /// In ar, this message translates to:
  /// **'أكمل النموذج خلال 30 يومًا وإلا سيُعلَّق الحساب'**
  String get kycWarning;

  /// No description provided for @requiredDocuments.
  ///
  /// In ar, this message translates to:
  /// **'المستندات المطلوبة'**
  String get requiredDocuments;

  /// No description provided for @personalData.
  ///
  /// In ar, this message translates to:
  /// **'البيانات الشخصية'**
  String get personalData;

  /// No description provided for @finishVerification.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء التحقق'**
  String get finishVerification;

  /// No description provided for @uploadDocsFirst.
  ///
  /// In ar, this message translates to:
  /// **'ارفع المستندات الثلاثة المطلوبة أولًا'**
  String get uploadDocsFirst;

  /// No description provided for @kycSubmitted.
  ///
  /// In ar, this message translates to:
  /// **'تم إرسال طلبك للمراجعة'**
  String get kycSubmitted;

  /// No description provided for @kycDocIdFront.
  ///
  /// In ar, this message translates to:
  /// **'بطاقة الهوية (الوجه)'**
  String get kycDocIdFront;

  /// No description provided for @kycDocIdBack.
  ///
  /// In ar, this message translates to:
  /// **'بطاقة الهوية (الظهر)'**
  String get kycDocIdBack;

  /// No description provided for @kycDocSelfie.
  ///
  /// In ar, this message translates to:
  /// **'سيلفي مع البطاقة'**
  String get kycDocSelfie;

  /// No description provided for @kycDocBiometric.
  ///
  /// In ar, this message translates to:
  /// **'الصورة البيومترية'**
  String get kycDocBiometric;

  /// No description provided for @kycStatusPending.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار الإكمال'**
  String get kycStatusPending;

  /// No description provided for @kycStatusUnderReview.
  ///
  /// In ar, this message translates to:
  /// **'قيد المراجعة'**
  String get kycStatusUnderReview;

  /// No description provided for @kycStatusVerified.
  ///
  /// In ar, this message translates to:
  /// **'موثّق'**
  String get kycStatusVerified;

  /// No description provided for @kycStatusRejected.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض'**
  String get kycStatusRejected;

  /// No description provided for @kycStatusLabel.
  ///
  /// In ar, this message translates to:
  /// **'الحالة: {status}'**
  String kycStatusLabel(String status);

  /// No description provided for @firstNameFr.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالفرنسية'**
  String get firstNameFr;

  /// No description provided for @lastNameFr.
  ///
  /// In ar, this message translates to:
  /// **'اللقب بالفرنسية'**
  String get lastNameFr;

  /// No description provided for @fatherName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الأب'**
  String get fatherName;

  /// No description provided for @motherName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الأم'**
  String get motherName;

  /// No description provided for @motherSurname.
  ///
  /// In ar, this message translates to:
  /// **'لقب الأم'**
  String get motherSurname;

  /// No description provided for @expectedIncome.
  ///
  /// In ar, this message translates to:
  /// **'الدخل الشهري المتوقع'**
  String get expectedIncome;

  /// No description provided for @idNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم بطاقة الهوية'**
  String get idNumber;

  /// No description provided for @commune.
  ///
  /// In ar, this message translates to:
  /// **'البلدية'**
  String get commune;

  /// No description provided for @myAuctionsAll.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get myAuctionsAll;

  /// No description provided for @myAuctionsActive.
  ///
  /// In ar, this message translates to:
  /// **'نشطة'**
  String get myAuctionsActive;

  /// No description provided for @myAuctionsWon.
  ///
  /// In ar, this message translates to:
  /// **'رابحة'**
  String get myAuctionsWon;

  /// No description provided for @myAuctionsLost.
  ///
  /// In ar, this message translates to:
  /// **'خاسرة'**
  String get myAuctionsLost;

  /// No description provided for @myAuctionsUpcoming.
  ///
  /// In ar, this message translates to:
  /// **'قادمة'**
  String get myAuctionsUpcoming;

  /// No description provided for @myAuctionsStatusAwaitingPayment.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار الدفع'**
  String get myAuctionsStatusAwaitingPayment;

  /// No description provided for @myAuctionsStatusCompleted.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل'**
  String get myAuctionsStatusCompleted;

  /// No description provided for @myAuctionsStatusRefund.
  ///
  /// In ar, this message translates to:
  /// **'تم استرداد التأمين'**
  String get myAuctionsStatusRefund;

  /// No description provided for @myAuctionsStatusUpcoming.
  ///
  /// In ar, this message translates to:
  /// **'لم يبدأ بعد'**
  String get myAuctionsStatusUpcoming;

  /// No description provided for @myAuctionsStatusLive.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ الآن'**
  String get myAuctionsStatusLive;

  /// No description provided for @myAuctionsStatusEnded.
  ///
  /// In ar, this message translates to:
  /// **'انتهى — بانتظار النتيجة'**
  String get myAuctionsStatusEnded;

  /// No description provided for @myAuctionsStatusParticipating.
  ///
  /// In ar, this message translates to:
  /// **'مشارِك'**
  String get myAuctionsStatusParticipating;

  /// No description provided for @myAuctionsStatusWinning.
  ///
  /// In ar, this message translates to:
  /// **'أنت الأعلى'**
  String get myAuctionsStatusWinning;

  /// No description provided for @myAuctionsStatusOutbid.
  ///
  /// In ar, this message translates to:
  /// **'تم تجاوزك'**
  String get myAuctionsStatusOutbid;

  /// No description provided for @myAuctionsStatusWon.
  ///
  /// In ar, this message translates to:
  /// **'فزت بالمزاد'**
  String get myAuctionsStatusWon;

  /// No description provided for @myAuctionsStatusLost.
  ///
  /// In ar, this message translates to:
  /// **'لم تفز'**
  String get myAuctionsStatusLost;

  /// No description provided for @myAuctionsPriceCurrentBid.
  ///
  /// In ar, this message translates to:
  /// **'مزايدتك الحالية'**
  String get myAuctionsPriceCurrentBid;

  /// No description provided for @myAuctionsPriceKnockdown.
  ///
  /// In ar, this message translates to:
  /// **'سعر الرسو'**
  String get myAuctionsPriceKnockdown;

  /// No description provided for @myAuctionsPriceFinal.
  ///
  /// In ar, this message translates to:
  /// **'السعر النهائي'**
  String get myAuctionsPriceFinal;

  /// No description provided for @myAuctionsEmptyAll.
  ///
  /// In ar, this message translates to:
  /// **'لم تشارك في أي مزاد بعد'**
  String get myAuctionsEmptyAll;

  /// No description provided for @myAuctionsEmptyActive.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مزادات نشطة'**
  String get myAuctionsEmptyActive;

  /// No description provided for @myAuctionsEmptyWon.
  ///
  /// In ar, this message translates to:
  /// **'لم تربح أي مزاد بعد'**
  String get myAuctionsEmptyWon;

  /// No description provided for @myAuctionsEmptyLost.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مزادات خاسرة'**
  String get myAuctionsEmptyLost;

  /// No description provided for @myAuctionsEmptyUpcoming.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مزادات قادمة'**
  String get myAuctionsEmptyUpcoming;

  /// No description provided for @myAuctionsMyBid.
  ///
  /// In ar, this message translates to:
  /// **'أعلى مزايدة لك'**
  String get myAuctionsMyBid;

  /// No description provided for @myAuctionsDepositPaid.
  ///
  /// In ar, this message translates to:
  /// **'الكفالة مدفوعة'**
  String get myAuctionsDepositPaid;

  /// No description provided for @myAuctionsFinalPaymentDue.
  ///
  /// In ar, this message translates to:
  /// **'الدفع النهائي مطلوب'**
  String get myAuctionsFinalPaymentDue;

  /// No description provided for @myAuctionsFinalPaymentPending.
  ///
  /// In ar, this message translates to:
  /// **'الدفع النهائي قيد المعالجة'**
  String get myAuctionsFinalPaymentPending;

  /// No description provided for @myAuctionsFinalPaymentDone.
  ///
  /// In ar, this message translates to:
  /// **'الدفع النهائي مكتمل'**
  String get myAuctionsFinalPaymentDone;

  /// No description provided for @myAuctionsFinalPaymentFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل الدفع النهائي'**
  String get myAuctionsFinalPaymentFailed;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// No description provided for @markAllRead.
  ///
  /// In ar, this message translates to:
  /// **'تعليم الكل'**
  String get markAllRead;

  /// No description provided for @noNotifications.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد إشعارات'**
  String get noNotifications;

  /// No description provided for @timeNow.
  ///
  /// In ar, this message translates to:
  /// **'الآن'**
  String get timeNow;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In ar, this message translates to:
  /// **'منذ {minutes} دقيقة'**
  String timeMinutesAgo(int minutes);

  /// No description provided for @timeHoursAgo.
  ///
  /// In ar, this message translates to:
  /// **'منذ {hours} ساعة'**
  String timeHoursAgo(int hours);

  /// No description provided for @timeDaysAgo.
  ///
  /// In ar, this message translates to:
  /// **'منذ {days} يوم'**
  String timeDaysAgo(int days);

  /// No description provided for @profile.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profile;

  /// No description provided for @verifiedKyc.
  ///
  /// In ar, this message translates to:
  /// **'موثّق — KYC مكتمل'**
  String get verifiedKyc;

  /// No description provided for @kycBadgeRejected.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض — أعد التحقق'**
  String get kycBadgeRejected;

  /// No description provided for @kycBadgeComplete.
  ///
  /// In ar, this message translates to:
  /// **'أكمل التحقق من الهوية'**
  String get kycBadgeComplete;

  /// No description provided for @changePassword.
  ///
  /// In ar, this message translates to:
  /// **'تغيير كلمة المرور'**
  String get changePassword;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @privacy.
  ///
  /// In ar, this message translates to:
  /// **'الخصوصية'**
  String get privacy;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get edit;

  /// No description provided for @profession.
  ///
  /// In ar, this message translates to:
  /// **'المهنة'**
  String get profession;

  /// No description provided for @address.
  ///
  /// In ar, this message translates to:
  /// **'العنوان'**
  String get address;

  /// No description provided for @postalCode.
  ///
  /// In ar, this message translates to:
  /// **'الرمز البريدي'**
  String get postalCode;

  /// No description provided for @languageArabic.
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @languageFrench.
  ///
  /// In ar, this message translates to:
  /// **'الفرنسية'**
  String get languageFrench;

  /// No description provided for @languageEnglish.
  ///
  /// In ar, this message translates to:
  /// **'الإنجليزية'**
  String get languageEnglish;

  /// No description provided for @chooseLanguage.
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة'**
  String get chooseLanguage;

  /// No description provided for @retry.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get retry;

  /// No description provided for @goBack.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get goBack;

  /// No description provided for @errorGeneric.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ، حاول مجددًا'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In ar, this message translates to:
  /// **'تحقق من اتصالك بالإنترنت'**
  String get errorNetwork;

  /// No description provided for @paymentSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم الدفع بنجاح'**
  String get paymentSuccess;

  /// No description provided for @paymentCancelled.
  ///
  /// In ar, this message translates to:
  /// **'تم إلغاء الدفع'**
  String get paymentCancelled;

  /// No description provided for @paymentAlreadyDone.
  ///
  /// In ar, this message translates to:
  /// **'أنت مسجّل بالفعل في هذا المزاد — يمكنك المزايدة'**
  String get paymentAlreadyDone;

  /// No description provided for @paymentNotConfirmed.
  ///
  /// In ar, this message translates to:
  /// **'لم يصلنا تأكيد الدفع بعد. إن كنت قد دفعت، انتظر قليلًا ثم أعد المحاولة.'**
  String get paymentNotConfirmed;

  /// No description provided for @paymentBookNotConfirmed.
  ///
  /// In ar, this message translates to:
  /// **'لم يصلنا تأكيد شراء دفتر الشروط بعد. إن كنت قد دفعت، انتظر قليلًا ثم أعد المحاولة.'**
  String get paymentBookNotConfirmed;

  /// No description provided for @securePayment.
  ///
  /// In ar, this message translates to:
  /// **'الدفع الآمن'**
  String get securePayment;

  /// No description provided for @paymentPageFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر فتح صفحة الدفع'**
  String get paymentPageFailed;

  /// No description provided for @valRequired.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get valRequired;

  /// No description provided for @valEmailInvalid.
  ///
  /// In ar, this message translates to:
  /// **'بريد إلكتروني غير صالح'**
  String get valEmailInvalid;

  /// No description provided for @valPasswordShort.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور 12 حرفًا على الأقل'**
  String get valPasswordShort;

  /// No description provided for @valPasswordMixedCase.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تحتوي على حرف كبير وآخر صغير'**
  String get valPasswordMixedCase;

  /// No description provided for @valPasswordNumber.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تحتوي على رقم واحد على الأقل'**
  String get valPasswordNumber;

  /// No description provided for @valPasswordSymbol.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن تحتوي على رمز واحد على الأقل'**
  String get valPasswordSymbol;

  /// No description provided for @valBirthDateUnder18.
  ///
  /// In ar, this message translates to:
  /// **'يجب ألا يقل عمرك عن 18 سنة'**
  String get valBirthDateUnder18;

  /// No description provided for @valPasswordMismatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمتا المرور غير متطابقتين'**
  String get valPasswordMismatch;

  /// No description provided for @valNinInvalid.
  ///
  /// In ar, this message translates to:
  /// **'رقم التعريف يجب أن يكون 18 رقمًا'**
  String get valNinInvalid;

  /// No description provided for @valPhoneInvalid.
  ///
  /// In ar, this message translates to:
  /// **'رقم هاتف غير صالح (10 أرقام تبدأ بـ 0)'**
  String get valPhoneInvalid;

  /// No description provided for @valNameShort.
  ///
  /// In ar, this message translates to:
  /// **'الاسم قصير جدًا'**
  String get valNameShort;

  /// No description provided for @offlineBanner.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اتصال بالإنترنت'**
  String get offlineBanner;

  /// No description provided for @backOnline.
  ///
  /// In ar, this message translates to:
  /// **'تم استعادة الاتصال'**
  String get backOnline;

  /// No description provided for @appealsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الاعتراضات'**
  String get appealsTitle;

  /// No description provided for @appealsEmpty.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد اعتراضات'**
  String get appealsEmpty;

  /// No description provided for @appealSubmitted.
  ///
  /// In ar, this message translates to:
  /// **'تم إرسال اعتراضك'**
  String get appealSubmitted;

  /// No description provided for @newAppeal.
  ///
  /// In ar, this message translates to:
  /// **'تقديم اعتراض جديد'**
  String get newAppeal;

  /// No description provided for @newAppealTitle.
  ///
  /// In ar, this message translates to:
  /// **'اعتراض جديد'**
  String get newAppealTitle;

  /// No description provided for @appealSubject.
  ///
  /// In ar, this message translates to:
  /// **'الموضوع'**
  String get appealSubject;

  /// No description provided for @appealSubjectHint.
  ///
  /// In ar, this message translates to:
  /// **'مثال: اعتراض على نتيجة المزاد'**
  String get appealSubjectHint;

  /// No description provided for @appealReason.
  ///
  /// In ar, this message translates to:
  /// **'السبب التفصيلي'**
  String get appealReason;

  /// No description provided for @appealReasonHint.
  ///
  /// In ar, this message translates to:
  /// **'اشرح سبب الاعتراض بالتفصيل...'**
  String get appealReasonHint;

  /// No description provided for @submitAppeal.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الاعتراض'**
  String get submitAppeal;

  /// No description provided for @appealStatusPending.
  ///
  /// In ar, this message translates to:
  /// **'قيد المراجعة'**
  String get appealStatusPending;

  /// No description provided for @appealStatusApproved.
  ///
  /// In ar, this message translates to:
  /// **'مقبول'**
  String get appealStatusApproved;

  /// No description provided for @appealStatusRejected.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض'**
  String get appealStatusRejected;

  /// No description provided for @appealFileFromAuction.
  ///
  /// In ar, this message translates to:
  /// **'يُقدَّم الطعن من صفحة المزاد بعد إغلاقه — افتح المزاد الذي شاركت فيه ثم اختر «تقديم طعن».'**
  String get appealFileFromAuction;

  /// No description provided for @ctaLogin.
  ///
  /// In ar, this message translates to:
  /// **'سجّل الدخول للمشاركة'**
  String get ctaLogin;

  /// No description provided for @ctaParticipate.
  ///
  /// In ar, this message translates to:
  /// **'المشاركة في المزاد'**
  String get ctaParticipate;

  /// No description provided for @ctaNeedsKyc.
  ///
  /// In ar, this message translates to:
  /// **'أكمل توثيق حسابك'**
  String get ctaNeedsKyc;

  /// No description provided for @ctaNeedsCommerceRegister.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب سجلاً تجاريًا'**
  String get ctaNeedsCommerceRegister;

  /// No description provided for @ctaCommerceRegisterHint.
  ///
  /// In ar, this message translates to:
  /// **'هذا المزاد يتطلب سجلاً تجاريًا ساريًا قبل أي دفع. أضِفه من المنصّة ثم عُد للتطبيق.'**
  String get ctaCommerceRegisterHint;

  /// No description provided for @ctaBuyBook.
  ///
  /// In ar, this message translates to:
  /// **'شراء دفتر الشروط'**
  String get ctaBuyBook;

  /// No description provided for @ctaFinalPayment.
  ///
  /// In ar, this message translates to:
  /// **'إتمام الدفع النهائي'**
  String get ctaFinalPayment;

  /// No description provided for @ctaFinalPaymentDone.
  ///
  /// In ar, this message translates to:
  /// **'تم الدفع النهائي'**
  String get ctaFinalPaymentDone;

  /// No description provided for @ctaAppeal.
  ///
  /// In ar, this message translates to:
  /// **'تقديم طعن'**
  String get ctaAppeal;

  /// No description provided for @ctaTrackAppeal.
  ///
  /// In ar, this message translates to:
  /// **'متابعة الطعن'**
  String get ctaTrackAppeal;

  /// No description provided for @crTitle.
  ///
  /// In ar, this message translates to:
  /// **'السجل التجاري'**
  String get crTitle;

  /// No description provided for @crIntro.
  ///
  /// In ar, this message translates to:
  /// **'بعض المزادات تشترط سجلاً تجاريًا ساريًا للمشاركة. قدّم بياناتك ونسخة من السجل والبطاقة الجبائية للمراجعة.'**
  String get crIntro;

  /// No description provided for @crStatusNone.
  ///
  /// In ar, this message translates to:
  /// **'لم تقدّم سجلاً بعد'**
  String get crStatusNone;

  /// No description provided for @crStatusPending.
  ///
  /// In ar, this message translates to:
  /// **'قيد المراجعة'**
  String get crStatusPending;

  /// No description provided for @crStatusApproved.
  ///
  /// In ar, this message translates to:
  /// **'معتمد'**
  String get crStatusApproved;

  /// No description provided for @crStatusRejected.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض'**
  String get crStatusRejected;

  /// No description provided for @crApprovedNote.
  ///
  /// In ar, this message translates to:
  /// **'سجلك معتمد — يمكنك المشاركة في المزادات التي تشترط سجلاً تجاريًا.'**
  String get crApprovedNote;

  /// No description provided for @crPendingNote.
  ///
  /// In ar, this message translates to:
  /// **'طلبك قيد المراجعة. يمكنك تعديل البيانات وإعادة الإرسال قبل صدور القرار.'**
  String get crPendingNote;

  /// No description provided for @crRejectedNote.
  ///
  /// In ar, this message translates to:
  /// **'تم رفض الطلب. صحّح البيانات وأعد الإرسال.'**
  String get crRejectedNote;

  /// No description provided for @crCompanyName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الشركة'**
  String get crCompanyName;

  /// No description provided for @crCompanyNameHint.
  ///
  /// In ar, this message translates to:
  /// **'مثال: ذ.م.م مزايدة للتجارة'**
  String get crCompanyNameHint;

  /// No description provided for @crRegisterNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم السجل التجاري'**
  String get crRegisterNumber;

  /// No description provided for @crRegisterNumberHint.
  ///
  /// In ar, this message translates to:
  /// **'مثال: 16/00-1234567 B 19'**
  String get crRegisterNumberHint;

  /// No description provided for @crRegisterNumberIncomplete.
  ///
  /// In ar, this message translates to:
  /// **'رقم السجل غير مكتمل'**
  String get crRegisterNumberIncomplete;

  /// No description provided for @crTaxNumber.
  ///
  /// In ar, this message translates to:
  /// **'الرقم الجبائي'**
  String get crTaxNumber;

  /// No description provided for @crTaxNumberHint.
  ///
  /// In ar, this message translates to:
  /// **'15 رقمًا — مثال: 000116001234567'**
  String get crTaxNumberHint;

  /// No description provided for @crTaxNumberDigitsOnly.
  ///
  /// In ar, this message translates to:
  /// **'الرقم الجبائي أرقام فقط'**
  String get crTaxNumberDigitsOnly;

  /// No description provided for @crTaxNumberLength.
  ///
  /// In ar, this message translates to:
  /// **'الرقم الجبائي يتكوّن من {count} رقمًا'**
  String crTaxNumberLength(int count);

  /// No description provided for @crActivityType.
  ///
  /// In ar, this message translates to:
  /// **'نوع النشاط'**
  String get crActivityType;

  /// No description provided for @crActivityTypeHint.
  ///
  /// In ar, this message translates to:
  /// **'مثال: تجارة السيارات'**
  String get crActivityTypeHint;

  /// No description provided for @crStartDate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ إصدار السجل'**
  String get crStartDate;

  /// No description provided for @crStartDateHint.
  ///
  /// In ar, this message translates to:
  /// **'اختر تاريخ الإصدار'**
  String get crStartDateHint;

  /// No description provided for @crStartDateNotFuture.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الإصدار لا يمكن أن يكون في المستقبل'**
  String get crStartDateNotFuture;

  /// No description provided for @crSectionCompany.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الشركة'**
  String get crSectionCompany;

  /// No description provided for @crSectionDocuments.
  ///
  /// In ar, this message translates to:
  /// **'المستندات المطلوبة'**
  String get crSectionDocuments;

  /// No description provided for @crProgress.
  ///
  /// In ar, this message translates to:
  /// **'{done} من {total} مكتملة'**
  String crProgress(int done, int total);

  /// No description provided for @crFixErrors.
  ///
  /// In ar, this message translates to:
  /// **'راجع الحقول المعلّمة بالأحمر'**
  String get crFixErrors;

  /// No description provided for @crDocumentsNote.
  ///
  /// In ar, this message translates to:
  /// **'صيغ مقبولة: PDF أو صورة (JPG/PNG) — بحد أقصى 2 ميغابايت.'**
  String get crDocumentsNote;

  /// No description provided for @crFileTooLarge.
  ///
  /// In ar, this message translates to:
  /// **'حجم الملف يتجاوز 2 ميغابايت'**
  String get crFileTooLarge;

  /// No description provided for @crRegisterDocument.
  ///
  /// In ar, this message translates to:
  /// **'نسخة السجل التجاري'**
  String get crRegisterDocument;

  /// No description provided for @crTaxCardDocument.
  ///
  /// In ar, this message translates to:
  /// **'نسخة البطاقة الجبائية'**
  String get crTaxCardDocument;

  /// No description provided for @crDocumentSelected.
  ///
  /// In ar, this message translates to:
  /// **'تم اختيار ملف جديد'**
  String get crDocumentSelected;

  /// No description provided for @crDocumentOnFile.
  ///
  /// In ar, this message translates to:
  /// **'نسخة محفوظة لدى المنصّة'**
  String get crDocumentOnFile;

  /// No description provided for @crDocumentMissing.
  ///
  /// In ar, this message translates to:
  /// **'مطلوب'**
  String get crDocumentMissing;

  /// No description provided for @crCapture.
  ///
  /// In ar, this message translates to:
  /// **'تصوير'**
  String get crCapture;

  /// No description provided for @crFromGallery.
  ///
  /// In ar, this message translates to:
  /// **'من المعرض'**
  String get crFromGallery;

  /// No description provided for @crFromFiles.
  ///
  /// In ar, this message translates to:
  /// **'ملف PDF'**
  String get crFromFiles;

  /// No description provided for @crSubmit.
  ///
  /// In ar, this message translates to:
  /// **'إرسال للمراجعة'**
  String get crSubmit;

  /// No description provided for @crResubmit.
  ///
  /// In ar, this message translates to:
  /// **'إعادة الإرسال'**
  String get crResubmit;

  /// No description provided for @crSubmitted.
  ///
  /// In ar, this message translates to:
  /// **'تم إرسال السجل للمراجعة'**
  String get crSubmitted;

  /// No description provided for @valTooLong.
  ///
  /// In ar, this message translates to:
  /// **'النص أطول من المسموح'**
  String get valTooLong;

  /// No description provided for @valTooShort.
  ///
  /// In ar, this message translates to:
  /// **'النص أقصر من المطلوب'**
  String get valTooShort;

  /// No description provided for @fpTitle.
  ///
  /// In ar, this message translates to:
  /// **'تفصيل الدفع النهائي'**
  String get fpTitle;

  /// No description provided for @fpConfirmedDeposit.
  ///
  /// In ar, this message translates to:
  /// **'الكفالة المدفوعة (تُخصم)'**
  String get fpConfirmedDeposit;

  /// No description provided for @fpAmountDue.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ المستحق'**
  String get fpAmountDue;

  /// No description provided for @fpCustomsImmediate.
  ///
  /// In ar, this message translates to:
  /// **'الدفعة الفورية (20% جمركي)'**
  String get fpCustomsImmediate;

  /// No description provided for @fpDeadline.
  ///
  /// In ar, this message translates to:
  /// **'آخر أجل للدفع: {date} (خلال {days} يومًا)'**
  String fpDeadline(String date, int days);

  /// No description provided for @fpAlreadyPaid.
  ///
  /// In ar, this message translates to:
  /// **'تم الدفع النهائي بالفعل'**
  String get fpAlreadyPaid;

  /// No description provided for @fpPay.
  ///
  /// In ar, this message translates to:
  /// **'إتمام الدفع'**
  String get fpPay;

  /// No description provided for @assetClassMovable.
  ///
  /// In ar, this message translates to:
  /// **'منقول'**
  String get assetClassMovable;

  /// No description provided for @assetClassRealEstate.
  ///
  /// In ar, this message translates to:
  /// **'عقار'**
  String get assetClassRealEstate;

  /// No description provided for @assetClassCustoms.
  ///
  /// In ar, this message translates to:
  /// **'بضائع جمركية'**
  String get assetClassCustoms;

  /// No description provided for @conditionNew.
  ///
  /// In ar, this message translates to:
  /// **'جديد'**
  String get conditionNew;

  /// No description provided for @conditionGood.
  ///
  /// In ar, this message translates to:
  /// **'جيد'**
  String get conditionGood;

  /// No description provided for @conditionFair.
  ///
  /// In ar, this message translates to:
  /// **'مقبول'**
  String get conditionFair;

  /// No description provided for @conditionPoor.
  ///
  /// In ar, this message translates to:
  /// **'ضعيف'**
  String get conditionPoor;

  /// No description provided for @conditionScrap.
  ///
  /// In ar, this message translates to:
  /// **'خردة'**
  String get conditionScrap;

  /// No description provided for @auctionTypeSale.
  ///
  /// In ar, this message translates to:
  /// **'بيع'**
  String get auctionTypeSale;

  /// No description provided for @auctionTypeLease.
  ///
  /// In ar, this message translates to:
  /// **'إيجار'**
  String get auctionTypeLease;

  /// No description provided for @adSpecifications.
  ///
  /// In ar, this message translates to:
  /// **'المواصفات'**
  String get adSpecifications;

  /// No description provided for @adPricing.
  ///
  /// In ar, this message translates to:
  /// **'الأسعار والرسوم'**
  String get adPricing;

  /// No description provided for @adBookPrice.
  ///
  /// In ar, this message translates to:
  /// **'دفتر شروط'**
  String get adBookPrice;

  /// No description provided for @adAssetInfo.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الأصل'**
  String get adAssetInfo;

  /// No description provided for @adAuctionType.
  ///
  /// In ar, this message translates to:
  /// **'نوع المزاد'**
  String get adAuctionType;

  /// No description provided for @adAssetClass.
  ///
  /// In ar, this message translates to:
  /// **'صنف الأصل'**
  String get adAssetClass;

  /// No description provided for @adCondition.
  ///
  /// In ar, this message translates to:
  /// **'الحالة'**
  String get adCondition;

  /// No description provided for @adUnitCount.
  ///
  /// In ar, this message translates to:
  /// **'عدد الوحدات'**
  String get adUnitCount;

  /// No description provided for @adRequiresCr.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب سجلاً تجاريًا'**
  String get adRequiresCr;

  /// No description provided for @adRequiresNewspaper.
  ///
  /// In ar, this message translates to:
  /// **'إعلان في الجريدة'**
  String get adRequiresNewspaper;

  /// No description provided for @adYes.
  ///
  /// In ar, this message translates to:
  /// **'نعم'**
  String get adYes;

  /// No description provided for @adSchedule.
  ///
  /// In ar, this message translates to:
  /// **'التوقيت'**
  String get adSchedule;

  /// No description provided for @adStartTime.
  ///
  /// In ar, this message translates to:
  /// **'بداية المزاد'**
  String get adStartTime;

  /// No description provided for @adEndTime.
  ///
  /// In ar, this message translates to:
  /// **'نهاية المزاد'**
  String get adEndTime;

  /// No description provided for @adExtensions.
  ///
  /// In ar, this message translates to:
  /// **'التمديدات'**
  String get adExtensions;

  /// No description provided for @adLocation.
  ///
  /// In ar, this message translates to:
  /// **'الموقع'**
  String get adLocation;

  /// No description provided for @adCommune.
  ///
  /// In ar, this message translates to:
  /// **'البلدية'**
  String get adCommune;

  /// No description provided for @adMayor.
  ///
  /// In ar, this message translates to:
  /// **'رئيس البلدية'**
  String get adMayor;

  /// No description provided for @adOpenMap.
  ///
  /// In ar, this message translates to:
  /// **'فتح في الخرائط'**
  String get adOpenMap;

  /// No description provided for @adInspection.
  ///
  /// In ar, this message translates to:
  /// **'المعاينة'**
  String get adInspection;

  /// No description provided for @adInspectionState.
  ///
  /// In ar, this message translates to:
  /// **'حالة المعاينة'**
  String get adInspectionState;

  /// No description provided for @adInspectionOpen.
  ///
  /// In ar, this message translates to:
  /// **'متاحة الآن'**
  String get adInspectionOpen;

  /// No description provided for @adInspectionClosed.
  ///
  /// In ar, this message translates to:
  /// **'مغلقة'**
  String get adInspectionClosed;

  /// No description provided for @adFrom.
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get adFrom;

  /// No description provided for @adTo.
  ///
  /// In ar, this message translates to:
  /// **'إلى'**
  String get adTo;

  /// No description provided for @adInspectionPlace.
  ///
  /// In ar, this message translates to:
  /// **'مكان المعاينة'**
  String get adInspectionPlace;

  /// No description provided for @adLease.
  ///
  /// In ar, this message translates to:
  /// **'شروط الإيجار'**
  String get adLease;

  /// No description provided for @adLeaseDuration.
  ///
  /// In ar, this message translates to:
  /// **'مدة الإيجار (سنوات)'**
  String get adLeaseDuration;

  /// No description provided for @adLeaseRenewals.
  ///
  /// In ar, this message translates to:
  /// **'عدد التجديدات'**
  String get adLeaseRenewals;

  /// No description provided for @adTerms.
  ///
  /// In ar, this message translates to:
  /// **'الشروط'**
  String get adTerms;

  /// No description provided for @adConditionTerms.
  ///
  /// In ar, this message translates to:
  /// **'شروط المشاركة'**
  String get adConditionTerms;

  /// No description provided for @adAwardTerms.
  ///
  /// In ar, this message translates to:
  /// **'شروط الترسية'**
  String get adAwardTerms;

  /// No description provided for @adResult.
  ///
  /// In ar, this message translates to:
  /// **'نتيجة المزاد'**
  String get adResult;

  /// No description provided for @adWinner.
  ///
  /// In ar, this message translates to:
  /// **'الفائز'**
  String get adWinner;

  /// No description provided for @adNoWinner.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد فائز'**
  String get adNoWinner;

  /// No description provided for @adFinalPrice.
  ///
  /// In ar, this message translates to:
  /// **'السعر النهائي'**
  String get adFinalPrice;

  /// No description provided for @adAppealWindow.
  ///
  /// In ar, this message translates to:
  /// **'مهلة الطعن'**
  String get adAppealWindow;

  /// No description provided for @adAppealOpen.
  ///
  /// In ar, this message translates to:
  /// **'مفتوحة ({days} يومًا)'**
  String adAppealOpen(int days);

  /// No description provided for @adAppealClosed.
  ///
  /// In ar, this message translates to:
  /// **'منتهية'**
  String get adAppealClosed;

  /// No description provided for @kycFileTooLarge.
  ///
  /// In ar, this message translates to:
  /// **'حجم الملف يتجاوز {maxKb} كيلوبايت — جرّب صورة أصغر'**
  String kycFileTooLarge(int maxKb);

  /// No description provided for @docsTitle.
  ///
  /// In ar, this message translates to:
  /// **'وثائقي'**
  String get docsTitle;

  /// No description provided for @docsSearchHint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث باسم المزاد أو الوثيقة'**
  String get docsSearchHint;

  /// No description provided for @docsTotal.
  ///
  /// In ar, this message translates to:
  /// **'الإجمالي'**
  String get docsTotal;

  /// No description provided for @docsBooks.
  ///
  /// In ar, this message translates to:
  /// **'دفاتر'**
  String get docsBooks;

  /// No description provided for @docsAwards.
  ///
  /// In ar, this message translates to:
  /// **'ترسيات'**
  String get docsAwards;

  /// No description provided for @docsReceipts.
  ///
  /// In ar, this message translates to:
  /// **'إيصالات'**
  String get docsReceipts;

  /// No description provided for @docsFilters.
  ///
  /// In ar, this message translates to:
  /// **'تصفية الوثائق'**
  String get docsFilters;

  /// No description provided for @docsType.
  ///
  /// In ar, this message translates to:
  /// **'نوع الوثيقة'**
  String get docsType;

  /// No description provided for @docsPeriod.
  ///
  /// In ar, this message translates to:
  /// **'الفترة'**
  String get docsPeriod;

  /// No description provided for @docsCategory.
  ///
  /// In ar, this message translates to:
  /// **'الفئة'**
  String get docsCategory;

  /// No description provided for @docsEntity.
  ///
  /// In ar, this message translates to:
  /// **'الجهة'**
  String get docsEntity;

  /// No description provided for @docsSort.
  ///
  /// In ar, this message translates to:
  /// **'الترتيب'**
  String get docsSort;

  /// No description provided for @docsApply.
  ///
  /// In ar, this message translates to:
  /// **'تطبيق'**
  String get docsApply;

  /// No description provided for @docsClearFilters.
  ///
  /// In ar, this message translates to:
  /// **'مسح الكل'**
  String get docsClearFilters;

  /// No description provided for @docTypeConditionBook.
  ///
  /// In ar, this message translates to:
  /// **'دفتر الشروط'**
  String get docTypeConditionBook;

  /// No description provided for @docTypeAward.
  ///
  /// In ar, this message translates to:
  /// **'وثيقة الترسية'**
  String get docTypeAward;

  /// No description provided for @docTypeReceipt.
  ///
  /// In ar, this message translates to:
  /// **'إيصال دفع'**
  String get docTypeReceipt;

  /// No description provided for @docTypeDelivery.
  ///
  /// In ar, this message translates to:
  /// **'محضر تسليم'**
  String get docTypeDelivery;

  /// No description provided for @docsPresetAll.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get docsPresetAll;

  /// No description provided for @docsPresetToday.
  ///
  /// In ar, this message translates to:
  /// **'اليوم'**
  String get docsPresetToday;

  /// No description provided for @docsPreset7d.
  ///
  /// In ar, this message translates to:
  /// **'آخر 7 أيام'**
  String get docsPreset7d;

  /// No description provided for @docsPreset30d.
  ///
  /// In ar, this message translates to:
  /// **'آخر 30 يومًا'**
  String get docsPreset30d;

  /// No description provided for @docsPresetMonth.
  ///
  /// In ar, this message translates to:
  /// **'هذا الشهر'**
  String get docsPresetMonth;

  /// No description provided for @docsPresetYear.
  ///
  /// In ar, this message translates to:
  /// **'هذه السنة'**
  String get docsPresetYear;

  /// No description provided for @docsSortRecent.
  ///
  /// In ar, this message translates to:
  /// **'الأحدث'**
  String get docsSortRecent;

  /// No description provided for @docsSortOldest.
  ///
  /// In ar, this message translates to:
  /// **'الأقدم'**
  String get docsSortOldest;

  /// No description provided for @docsSortAuction.
  ///
  /// In ar, this message translates to:
  /// **'حسب المزاد'**
  String get docsSortAuction;

  /// No description provided for @docsEmpty.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد وثائق بعد — ستظهر هنا وثائق المزادات التي تشارك فيها'**
  String get docsEmpty;

  /// No description provided for @docsNoResults.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد وثائق مطابقة للتصفية'**
  String get docsNoResults;

  /// No description provided for @docsVerify.
  ///
  /// In ar, this message translates to:
  /// **'تحقّق'**
  String get docsVerify;

  /// No description provided for @docsCannotOpen.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر فتح الملف — لا يوجد تطبيق لعرض PDF'**
  String get docsCannotOpen;

  /// No description provided for @docsDownloadForbidden.
  ///
  /// In ar, this message translates to:
  /// **'لا تملك صلاحية تحميل هذه الوثيقة'**
  String get docsDownloadForbidden;

  /// No description provided for @docsDownloadUnavailable.
  ///
  /// In ar, this message translates to:
  /// **'ملف الوثيقة غير متاح حاليًا'**
  String get docsDownloadUnavailable;

  /// No description provided for @adAwardDocument.
  ///
  /// In ar, this message translates to:
  /// **'وثيقة الترسية'**
  String get adAwardDocument;

  /// No description provided for @adDownloadAward.
  ///
  /// In ar, this message translates to:
  /// **'تحميل وثيقة الترسية'**
  String get adDownloadAward;

  /// No description provided for @forgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In ar, this message translates to:
  /// **'إعادة تعيين كلمة المرور'**
  String get forgotPasswordTitle;

  /// No description provided for @recoverAccountTitle.
  ///
  /// In ar, this message translates to:
  /// **'الاسترجاع بالسؤال السرّي'**
  String get recoverAccountTitle;

  /// No description provided for @recoverWithSecret.
  ///
  /// In ar, this message translates to:
  /// **'الاسترجاع بالسؤال السرّي'**
  String get recoverWithSecret;

  /// No description provided for @forgotPasswordHint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم التعريف الوطني والبريد المسجّل، وسنرسل رمزًا لإعادة التعيين.'**
  String get forgotPasswordHint;

  /// No description provided for @recoverAccountHint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم التعريف الوطني والبريد المسجّل لعرض سؤالك السرّي.'**
  String get recoverAccountHint;

  /// No description provided for @sendCode.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الرمز'**
  String get sendCode;

  /// No description provided for @showQuestion.
  ///
  /// In ar, this message translates to:
  /// **'عرض السؤال'**
  String get showQuestion;

  /// No description provided for @codeSentHint.
  ///
  /// In ar, this message translates to:
  /// **'إذا كان الحساب مسجّلاً بالبريد {email}، فقد أُرسل إليه رمز مكوّن من 6 أرقام.'**
  String codeSentHint(String email);

  /// No description provided for @otpCode.
  ///
  /// In ar, this message translates to:
  /// **'رمز التحقق'**
  String get otpCode;

  /// No description provided for @secretAnswer.
  ///
  /// In ar, this message translates to:
  /// **'الإجابة السرّية'**
  String get secretAnswer;

  /// No description provided for @secretAnswerHint.
  ///
  /// In ar, this message translates to:
  /// **'الإجابة حسّاسة للحروف الكبيرة والصغيرة والمسافات — اكتبها كما سجّلتها تمامًا.'**
  String get secretAnswerHint;

  /// No description provided for @newPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الجديدة'**
  String get newPassword;

  /// No description provided for @setNewPassword.
  ///
  /// In ar, this message translates to:
  /// **'تعيين كلمة المرور'**
  String get setNewPassword;

  /// No description provided for @recoveryDone.
  ///
  /// In ar, this message translates to:
  /// **'تم تغيير كلمة المرور — سجّل الدخول بكلمتك الجديدة'**
  String get recoveryDone;

  /// No description provided for @secretQMotherMaiden.
  ///
  /// In ar, this message translates to:
  /// **'ما هو الاسم العائلي لوالدتك؟'**
  String get secretQMotherMaiden;

  /// No description provided for @secretQFirstSchool.
  ///
  /// In ar, this message translates to:
  /// **'ما اسم أول مدرسة التحقت بها؟'**
  String get secretQFirstSchool;

  /// No description provided for @secretQBirthCity.
  ///
  /// In ar, this message translates to:
  /// **'في أي مدينة وُلدت؟'**
  String get secretQBirthCity;

  /// No description provided for @secretQPetName.
  ///
  /// In ar, this message translates to:
  /// **'ما اسم أول حيوان أليف لديك؟'**
  String get secretQPetName;

  /// No description provided for @secretQFavTeacher.
  ///
  /// In ar, this message translates to:
  /// **'من هو معلّمك المفضّل؟'**
  String get secretQFavTeacher;

  /// No description provided for @bidsSoFar.
  ///
  /// In ar, this message translates to:
  /// **'{count} عرض حتى الآن'**
  String bidsSoFar(int count);

  /// No description provided for @unitDays.
  ///
  /// In ar, this message translates to:
  /// **'يوم'**
  String get unitDays;

  /// No description provided for @unitHours.
  ///
  /// In ar, this message translates to:
  /// **'ساعة'**
  String get unitHours;

  /// No description provided for @unitMinutes.
  ///
  /// In ar, this message translates to:
  /// **'دقيقة'**
  String get unitMinutes;

  /// No description provided for @unitSeconds.
  ///
  /// In ar, this message translates to:
  /// **'ثانية'**
  String get unitSeconds;

  /// No description provided for @bidAmountHint.
  ///
  /// In ar, this message translates to:
  /// **'مبلغ العرض ({currency})'**
  String bidAmountHint(String currency);

  /// No description provided for @minBidHint.
  ///
  /// In ar, this message translates to:
  /// **'الحد الأدنى للمزايدة: {amount}'**
  String minBidHint(String amount);

  /// No description provided for @submitYourBid.
  ///
  /// In ar, this message translates to:
  /// **'قدّم عرضك'**
  String get submitYourBid;

  /// No description provided for @bidBelowMinimum.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ أقل من الحد الأدنى للمزايدة'**
  String get bidBelowMinimum;

  /// No description provided for @biddingClosed.
  ///
  /// In ar, this message translates to:
  /// **'أُغلق باب المزايدة'**
  String get biddingClosed;

  /// No description provided for @ackTitle.
  ///
  /// In ar, this message translates to:
  /// **'التسجيل في المزاد'**
  String get ackTitle;

  /// No description provided for @ackSubtitleHasBook.
  ///
  /// In ar, this message translates to:
  /// **'أقرّ بشروط المشاركة لبدء التسجيل عبر بوابة الدفع الآمنة'**
  String get ackSubtitleHasBook;

  /// No description provided for @ackSubtitleNeedsBook.
  ///
  /// In ar, this message translates to:
  /// **'شراء دفتر الشروط شرط للتسجيل — ستُفتح بوابتا دفع متتاليتان: الدفتر ثم التسجيل'**
  String get ackSubtitleNeedsBook;

  /// No description provided for @ackDepositRow.
  ///
  /// In ar, this message translates to:
  /// **'الكفالة (قابلة للاسترداد)'**
  String get ackDepositRow;

  /// No description provided for @ackBookRow.
  ///
  /// In ar, this message translates to:
  /// **'دفتر الشروط (غير مسترد)'**
  String get ackBookRow;

  /// No description provided for @ackAgree.
  ///
  /// In ar, this message translates to:
  /// **'أقرّ بأنني قرأت دفتر الشروط وأوافق على شروط المشاركة'**
  String get ackAgree;

  /// No description provided for @ackContinue.
  ///
  /// In ar, this message translates to:
  /// **'المتابعة للدفع'**
  String get ackContinue;

  /// No description provided for @ackGatewayNote.
  ///
  /// In ar, this message translates to:
  /// **'سيتم فتح بوابة الدفع الآمنة (CIBWeb)'**
  String get ackGatewayNote;

  /// No description provided for @minBidSectorHint.
  ///
  /// In ar, this message translates to:
  /// **'الحد الأدنى للمزايدة {amount} (نسبة القطاع {percent}٪)'**
  String minBidSectorHint(String amount, String percent);

  /// No description provided for @bidBelowSectorMinimum.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكن تقديم عرض أقل من {amount} — نسبة الزيادة المحددة لهذا القطاع {percent}٪'**
  String bidBelowSectorMinimum(String amount, String percent);

  /// No description provided for @adSession.
  ///
  /// In ar, this message translates to:
  /// **'جلسة المزايدة'**
  String get adSession;

  /// No description provided for @adSessionNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجلسة'**
  String get adSessionNumber;

  /// No description provided for @sessionRound.
  ///
  /// In ar, this message translates to:
  /// **'الجلسة رقم {round}'**
  String sessionRound(int round);

  /// No description provided for @adSessionCode.
  ///
  /// In ar, this message translates to:
  /// **'المرجع'**
  String get adSessionCode;

  /// No description provided for @adRescheduleCount.
  ///
  /// In ar, this message translates to:
  /// **'مرات إعادة الجدولة'**
  String get adRescheduleCount;

  /// No description provided for @adReduction.
  ///
  /// In ar, this message translates to:
  /// **'الخفض المطبّق على السعر الافتتاحي'**
  String get adReduction;

  /// No description provided for @percentValue.
  ///
  /// In ar, this message translates to:
  /// **'{percent}٪'**
  String percentValue(String percent);

  /// No description provided for @adOriginalOpeningPrice.
  ///
  /// In ar, this message translates to:
  /// **'السعر الافتتاحي الأصلي'**
  String get adOriginalOpeningPrice;

  /// No description provided for @adSessionHistory.
  ///
  /// In ar, this message translates to:
  /// **'سجل الجلسات السابقة'**
  String get adSessionHistory;

  /// No description provided for @adSector.
  ///
  /// In ar, this message translates to:
  /// **'القطاع'**
  String get adSector;

  /// No description provided for @adSectorIncrement.
  ///
  /// In ar, this message translates to:
  /// **'أقل نسبة زيادة للقطاع'**
  String get adSectorIncrement;

  /// No description provided for @adMinBid.
  ///
  /// In ar, this message translates to:
  /// **'أقل مزايدة مقبولة'**
  String get adMinBid;

  /// No description provided for @auctionFeatured.
  ///
  /// In ar, this message translates to:
  /// **'مميّزة'**
  String get auctionFeatured;

  /// No description provided for @sessionRescheduledBanner.
  ///
  /// In ar, this message translates to:
  /// **'أُعيدت جدولة هذه المزايدة {count, plural, =1{مرة واحدة} =2{مرتين} other{{count} مرات}} — السعر الافتتاحي الحالي بعد الخفض'**
  String sessionRescheduledBanner(int count);

  /// No description provided for @lostEmailLink.
  ///
  /// In ar, this message translates to:
  /// **'فقدت بريدك الإلكتروني؟'**
  String get lostEmailLink;

  /// No description provided for @lostEmailTitle.
  ///
  /// In ar, this message translates to:
  /// **'استرجاع البريد الإلكتروني'**
  String get lostEmailTitle;

  /// No description provided for @lostEmailHint.
  ///
  /// In ar, this message translates to:
  /// **'إن فقدت الوصول إلى بريدك الإلكتروني، أدخل بياناتك وأرفق صورة سيلفي وأنت تحمل بطاقة الهوية. تراجع الجهة المختصة الطلب وتعتمد البريد الجديد.'**
  String get lostEmailHint;

  /// No description provided for @lostEmailNewEmail.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني الجديد'**
  String get lostEmailNewEmail;

  /// No description provided for @lostEmailSelfie.
  ///
  /// In ar, this message translates to:
  /// **'صورة سيلفي مع بطاقة الهوية'**
  String get lostEmailSelfie;

  /// No description provided for @lostEmailSelfieHint.
  ///
  /// In ar, this message translates to:
  /// **'أمسك بطاقة الهوية بجوار وجهك، واحرص على وضوح الصورة والبيانات'**
  String get lostEmailSelfieHint;

  /// No description provided for @lostEmailRetake.
  ///
  /// In ar, this message translates to:
  /// **'إعادة التقاط الصورة'**
  String get lostEmailRetake;

  /// No description provided for @lostEmailSubmit.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الطلب للمراجعة'**
  String get lostEmailSubmit;

  /// No description provided for @lostEmailSubmittedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تم إرسال طلبك'**
  String get lostEmailSubmittedTitle;

  /// No description provided for @lostEmailSubmittedBody.
  ///
  /// In ar, this message translates to:
  /// **'طلبك قيد المراجعة لدى الجهة المختصة. ستتمكن من تسجيل الدخول بالبريد الجديد فور اعتماده.'**
  String get lostEmailSubmittedBody;

  /// No description provided for @lostEmailApprovedBody.
  ///
  /// In ar, this message translates to:
  /// **'تم اعتماد بريدك الجديد. يمكنك الآن تسجيل الدخول به.'**
  String get lostEmailApprovedBody;

  /// No description provided for @lostEmailRejectedBody.
  ///
  /// In ar, this message translates to:
  /// **'تم رفض الطلب. راجع السبب أدناه وأعد الإرسال بعد تصحيح البيانات.'**
  String get lostEmailRejectedBody;

  /// No description provided for @lostEmailRejectionReason.
  ///
  /// In ar, this message translates to:
  /// **'سبب الرفض'**
  String get lostEmailRejectionReason;

  /// No description provided for @lostEmailRefreshStatus.
  ///
  /// In ar, this message translates to:
  /// **'تحديث الحالة'**
  String get lostEmailRefreshStatus;

  /// No description provided for @lostEmailResubmit.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الطلب وإعادة الإرسال'**
  String get lostEmailResubmit;

  /// No description provided for @lostEmailRequestRef.
  ///
  /// In ar, this message translates to:
  /// **'رقم الطلب'**
  String get lostEmailRequestRef;

  /// No description provided for @lostEmailSubmittedAt.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ التقديم'**
  String get lostEmailSubmittedAt;

  /// No description provided for @lostEmailSelfieRequired.
  ///
  /// In ar, this message translates to:
  /// **'صورة السيلفي مع بطاقة الهوية مطلوبة'**
  String get lostEmailSelfieRequired;

  /// No description provided for @lostEmailImageTooLarge.
  ///
  /// In ar, this message translates to:
  /// **'حجم الصورة يتجاوز {max} كيلوبايت — التقط صورة أصغر'**
  String lostEmailImageTooLarge(int max);

  /// No description provided for @docTypeParticipationReceipt.
  ///
  /// In ar, this message translates to:
  /// **'وصل المشاركة'**
  String get docTypeParticipationReceipt;

  /// No description provided for @docTypeAuctionResult.
  ///
  /// In ar, this message translates to:
  /// **'وصل نتيجة المزايدة'**
  String get docTypeAuctionResult;

  /// No description provided for @adDocuments.
  ///
  /// In ar, this message translates to:
  /// **'وثائق المزايدة'**
  String get adDocuments;

  /// No description provided for @adDownloadParticipationReceipt.
  ///
  /// In ar, this message translates to:
  /// **'تحميل وصل المشاركة'**
  String get adDownloadParticipationReceipt;

  /// No description provided for @adDownloadResult.
  ///
  /// In ar, this message translates to:
  /// **'تحميل وصل النتيجة'**
  String get adDownloadResult;

  /// No description provided for @adDownloadConditionBook.
  ///
  /// In ar, this message translates to:
  /// **'تحميل دفتر الشروط'**
  String get adDownloadConditionBook;

  /// No description provided for @adReceiptHint.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك طباعة الوصل أو حفظه بعد التحميل'**
  String get adReceiptHint;

  /// No description provided for @adUnavailableTitle.
  ///
  /// In ar, this message translates to:
  /// **'المزايدة غير متاحة'**
  String get adUnavailableTitle;

  /// No description provided for @adUnavailableBody.
  ///
  /// In ar, this message translates to:
  /// **'هذه المزايدة لم تعد معروضة.'**
  String get adUnavailableBody;

  /// No description provided for @premiumTitle.
  ///
  /// In ar, this message translates to:
  /// **'العضوية المميّزة'**
  String get premiumTitle;

  /// No description provided for @premiumTagline.
  ///
  /// In ar, this message translates to:
  /// **'اعرف بالمزايدات الجديدة قبل غيرك'**
  String get premiumTagline;

  /// No description provided for @premiumActive.
  ///
  /// In ar, this message translates to:
  /// **'اشتراكك فعّال'**
  String get premiumActive;

  /// No description provided for @premiumInactive.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اشتراك فعّال'**
  String get premiumInactive;

  /// No description provided for @premiumPlanLabel.
  ///
  /// In ar, this message translates to:
  /// **'الباقة'**
  String get premiumPlanLabel;

  /// No description provided for @premiumStatus.
  ///
  /// In ar, this message translates to:
  /// **'الحالة'**
  String get premiumStatus;

  /// No description provided for @premiumStartedAt.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ البداية'**
  String get premiumStartedAt;

  /// No description provided for @premiumExpiresAt.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الانتهاء'**
  String get premiumExpiresAt;

  /// No description provided for @premiumAutoRenew.
  ///
  /// In ar, this message translates to:
  /// **'التجديد التلقائي'**
  String get premiumAutoRenew;

  /// No description provided for @premiumAutoRenewOn.
  ///
  /// In ar, this message translates to:
  /// **'مفعّل'**
  String get premiumAutoRenewOn;

  /// No description provided for @premiumAutoRenewOff.
  ///
  /// In ar, this message translates to:
  /// **'متوقف'**
  String get premiumAutoRenewOff;

  /// No description provided for @premiumStopAutoRenew.
  ///
  /// In ar, this message translates to:
  /// **'إيقاف التجديد التلقائي'**
  String get premiumStopAutoRenew;

  /// No description provided for @premiumStopAutoRenewConfirm.
  ///
  /// In ar, this message translates to:
  /// **'سيستمر اشتراكك حتى تاريخ الانتهاء، ولن يُجدَّد بعدها تلقائيًا. هل تريد المتابعة؟'**
  String get premiumStopAutoRenewConfirm;

  /// No description provided for @premiumDaysRemaining.
  ///
  /// In ar, this message translates to:
  /// **'{days, plural, =1{يوم واحد متبقٍ} =2{يومان متبقيان} other{{days} أيام متبقية}}'**
  String premiumDaysRemaining(int days);

  /// No description provided for @premiumExpiringSoon.
  ///
  /// In ar, this message translates to:
  /// **'اشتراكك على وشك الانتهاء — جدّده حتى لا تفوتك التنبيهات'**
  String get premiumExpiringSoon;

  /// No description provided for @premiumChoosePlan.
  ///
  /// In ar, this message translates to:
  /// **'اختر باقتك'**
  String get premiumChoosePlan;

  /// No description provided for @premiumSubscribe.
  ///
  /// In ar, this message translates to:
  /// **'اشترك الآن'**
  String get premiumSubscribe;

  /// No description provided for @premiumRenew.
  ///
  /// In ar, this message translates to:
  /// **'تجديد الاشتراك'**
  String get premiumRenew;

  /// No description provided for @premiumRecommended.
  ///
  /// In ar, this message translates to:
  /// **'الأفضل قيمة'**
  String get premiumRecommended;

  /// No description provided for @premiumPeriodMonthly.
  ///
  /// In ar, this message translates to:
  /// **'شهريًا'**
  String get premiumPeriodMonthly;

  /// No description provided for @premiumPeriodYearly.
  ///
  /// In ar, this message translates to:
  /// **'سنويًا'**
  String get premiumPeriodYearly;

  /// No description provided for @premiumNoPlans.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد باقات متاحة حاليًا'**
  String get premiumNoPlans;

  /// No description provided for @premiumPaymentDone.
  ///
  /// In ar, this message translates to:
  /// **'تم تفعيل اشتراكك'**
  String get premiumPaymentDone;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @prefsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تفضيلات الإشعارات'**
  String get prefsTitle;

  /// No description provided for @prefsChannelsTitle.
  ///
  /// In ar, this message translates to:
  /// **'طرق الاستقبال'**
  String get prefsChannelsTitle;

  /// No description provided for @prefsChannelPush.
  ///
  /// In ar, this message translates to:
  /// **'إشعارات التطبيق'**
  String get prefsChannelPush;

  /// No description provided for @prefsChannelPushHint.
  ///
  /// In ar, this message translates to:
  /// **'تصلك على هاتفك فور حدوث الأمر'**
  String get prefsChannelPushHint;

  /// No description provided for @prefsChannelEmail.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get prefsChannelEmail;

  /// No description provided for @prefsChannelEmailHint.
  ///
  /// In ar, this message translates to:
  /// **'ملخّص بالمزايدات الجديدة المطابقة لاهتماماتك'**
  String get prefsChannelEmailHint;

  /// No description provided for @prefsChannelEmailPremiumOnly.
  ///
  /// In ar, this message translates to:
  /// **'متاح لأصحاب العضوية المميّزة'**
  String get prefsChannelEmailPremiumOnly;

  /// No description provided for @prefsChannelSms.
  ///
  /// In ar, this message translates to:
  /// **'رسائل SMS'**
  String get prefsChannelSms;

  /// No description provided for @prefsNewAuctionAlerts.
  ///
  /// In ar, this message translates to:
  /// **'تنبيهات المزايدات الجديدة'**
  String get prefsNewAuctionAlerts;

  /// No description provided for @prefsNewAuctionAlertsHint.
  ///
  /// In ar, this message translates to:
  /// **'نُعلمك فور إضافة مزايدة من الأنواع التي تهتم بها'**
  String get prefsNewAuctionAlertsHint;

  /// No description provided for @prefsCategoriesTitle.
  ///
  /// In ar, this message translates to:
  /// **'أنواع المزايدات التي تهمّك'**
  String get prefsCategoriesTitle;

  /// No description provided for @prefsCategoriesHint.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوعًا أو أكثر. بدون اختيار ستصلك تنبيهات كل الأنواع.'**
  String get prefsCategoriesHint;

  /// No description provided for @prefsCategoriesAll.
  ///
  /// In ar, this message translates to:
  /// **'كل الأنواع'**
  String get prefsCategoriesAll;

  /// No description provided for @prefsNoCategories.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد أنواع متاحة حاليًا'**
  String get prefsNoCategories;

  /// No description provided for @prefsSave.
  ///
  /// In ar, this message translates to:
  /// **'حفظ التفضيلات'**
  String get prefsSave;

  /// No description provided for @prefsSaved.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ تفضيلاتك'**
  String get prefsSaved;

  /// No description provided for @prefsDiscardChanges.
  ///
  /// In ar, this message translates to:
  /// **'لديك تعديلات غير محفوظة. هل تريد الخروج دون حفظ؟'**
  String get prefsDiscardChanges;

  /// No description provided for @prefsLeave.
  ///
  /// In ar, this message translates to:
  /// **'خروج'**
  String get prefsLeave;

  /// No description provided for @prefsGoPremium.
  ///
  /// In ar, this message translates to:
  /// **'الاشتراك في العضوية المميّزة'**
  String get prefsGoPremium;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
