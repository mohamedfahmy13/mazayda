// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mazayada';

  @override
  String get navHome => 'Home';

  @override
  String get navMyAuctions => 'My Auctions';

  @override
  String get navPayments => 'Payments';

  @override
  String get navProfile => 'Profile';

  @override
  String get splashTagline => 'National Public Auctions Platform';

  @override
  String get login => 'Login';

  @override
  String get loginButton => 'Sign in';

  @override
  String get register => 'Create Account';

  @override
  String get noAccountRegister => 'No account? Create one';

  @override
  String get ninOrEmail => 'NIN or email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get birthDate => 'Date of birth';

  @override
  String get selectBirthDate => 'Select date of birth';

  @override
  String get nin => 'National ID Number (NIN)';

  @override
  String get ninHint => '18 digits';

  @override
  String get firstName => 'First name';

  @override
  String get lastName => 'Last name';

  @override
  String get phone => 'Phone number';

  @override
  String get email => 'Email';

  @override
  String get nextVerify => 'Next — Verify';

  @override
  String get verifyEmailTitle => 'Email Verification';

  @override
  String get otpHint => 'Enter the 6-digit code sent to your email';

  @override
  String get confirm => 'Confirm';

  @override
  String get resendCode => 'Resend code';

  @override
  String resendIn(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String resendInTimer(String time) {
    return 'Resend in $time';
  }

  @override
  String get activeAuctions => 'Active Auctions';

  @override
  String get noAuctions => 'No auctions available';

  @override
  String get currentPrice => 'Current price';

  @override
  String get openingPrice => 'Opening price';

  @override
  String get highestBid => 'Highest bid';

  @override
  String get depositRequired => 'Deposit required';

  @override
  String bidders(int count) {
    return '$count bidders';
  }

  @override
  String get live => 'Live';

  @override
  String get comingSoon => 'Soon';

  @override
  String get active => 'Active';

  @override
  String get ended => 'Ended';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get description => 'Description';

  @override
  String get auctionsTitle => 'Auctions';

  @override
  String get searchAuctionHint => 'Search for an auction...';

  @override
  String get filter => 'Filter';

  @override
  String get filterAll => 'All';

  @override
  String get filterStatusActive => 'Active';

  @override
  String get filterStatusUpcoming => 'Upcoming';

  @override
  String get filterStatusExtended => 'Extended';

  @override
  String get filterStatusClosed => 'Closed';

  @override
  String auctionsCount(String count) {
    return '$count auctions';
  }

  @override
  String get clearAll => 'Clear all';

  @override
  String get noMoreResults => '— No more results —';

  @override
  String get noMatchingAuctions => 'No matching auctions';

  @override
  String get tryAdjustingFilters => 'Try adjusting your search or filters';

  @override
  String get resetFilters => 'Reset filters';

  @override
  String get filterAuctions => 'Filter auctions';

  @override
  String get type => 'Type';

  @override
  String get wilaya => 'Wilaya';

  @override
  String get clearSelection => 'Clear selection';

  @override
  String get searchWilayaHint => 'Search for a wilaya...';

  @override
  String get wilayasLoadError => 'Couldn\'t load wilayas';

  @override
  String get noWilayaMatch => 'No wilaya by that name';

  @override
  String get reset => 'Reset';

  @override
  String get showResults => 'Show results';

  @override
  String get registerAndPay => 'Register & Pay';

  @override
  String get bid => 'Bid';

  @override
  String get liveBidding => 'Live Bidding';

  @override
  String get bidHistory => 'Bid history';

  @override
  String get noBidsYet => 'No bids yet';

  @override
  String get youAreHighest => 'You have the highest bid';

  @override
  String placeBidAmount(String amount) {
    return 'Bid $amount';
  }

  @override
  String get currentHighestBid => 'Current highest bid';

  @override
  String get currencyDzd => 'DA';

  @override
  String bidsCount(int count) {
    return '$count bids';
  }

  @override
  String get kycTitle => 'Identity Verification (KYC)';

  @override
  String get kycWarning =>
      'Complete the form within 30 days or your account will be suspended';

  @override
  String get requiredDocuments => 'Required documents';

  @override
  String get personalData => 'Personal data';

  @override
  String get finishVerification => 'Finish verification';

  @override
  String get uploadDocsFirst => 'Upload the three required documents first';

  @override
  String get kycSubmitted => 'Your request has been submitted for review';

  @override
  String get kycDocIdFront => 'ID card (front)';

  @override
  String get kycDocIdBack => 'ID card (back)';

  @override
  String get kycDocSelfie => 'Selfie with ID';

  @override
  String get kycDocBiometric => 'Biometric photo';

  @override
  String get kycStatusPending => 'Awaiting completion';

  @override
  String get kycStatusUnderReview => 'Under review';

  @override
  String get kycStatusVerified => 'Verified';

  @override
  String get kycStatusRejected => 'Rejected';

  @override
  String kycStatusLabel(String status) {
    return 'Status: $status';
  }

  @override
  String get firstNameFr => 'First name (French)';

  @override
  String get lastNameFr => 'Last name (French)';

  @override
  String get fatherName => 'Father\'s name';

  @override
  String get motherName => 'Mother\'s name';

  @override
  String get motherSurname => 'Mother\'s surname';

  @override
  String get expectedIncome => 'Expected monthly income';

  @override
  String get idNumber => 'ID card number';

  @override
  String get commune => 'Commune';

  @override
  String get myAuctionsAll => 'All';

  @override
  String get myAuctionsActive => 'Active';

  @override
  String get myAuctionsWon => 'Won';

  @override
  String get myAuctionsLost => 'Lost';

  @override
  String get myAuctionsUpcoming => 'Upcoming';

  @override
  String get myAuctionsStatusAwaitingPayment => 'Awaiting payment';

  @override
  String get myAuctionsStatusCompleted => 'Completed';

  @override
  String get myAuctionsStatusRefund => 'Deposit refunded';

  @override
  String get myAuctionsStatusUpcoming => 'Not started yet';

  @override
  String get myAuctionsStatusLive => 'Live now';

  @override
  String get myAuctionsStatusEnded => 'Ended — awaiting result';

  @override
  String get myAuctionsStatusParticipating => 'Registered';

  @override
  String get myAuctionsStatusWinning => 'You lead';

  @override
  String get myAuctionsStatusOutbid => 'You were outbid';

  @override
  String get myAuctionsStatusWon => 'You won';

  @override
  String get myAuctionsStatusLost => 'Not won';

  @override
  String get myAuctionsPriceCurrentBid => 'Your current bid';

  @override
  String get myAuctionsPriceKnockdown => 'Knockdown price';

  @override
  String get myAuctionsPriceFinal => 'Final price';

  @override
  String get myAuctionsEmptyAll => 'You haven\'t taken part in any auction yet';

  @override
  String get myAuctionsEmptyActive => 'No active auctions';

  @override
  String get myAuctionsEmptyWon => 'You haven\'t won any auction yet';

  @override
  String get myAuctionsEmptyLost => 'No lost auctions';

  @override
  String get myAuctionsEmptyUpcoming => 'No upcoming auctions';

  @override
  String get myAuctionsMyBid => 'Your highest bid';

  @override
  String get myAuctionsDepositPaid => 'Deposit paid';

  @override
  String get myAuctionsFinalPaymentDue => 'Final payment due';

  @override
  String get myAuctionsFinalPaymentPending => 'Final payment processing';

  @override
  String get myAuctionsFinalPaymentDone => 'Final payment complete';

  @override
  String get myAuctionsFinalPaymentFailed => 'Final payment failed';

  @override
  String get notifications => 'Notifications';

  @override
  String get markAllRead => 'Mark all';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get timeNow => 'Now';

  @override
  String timeMinutesAgo(int minutes) {
    return '$minutes min ago';
  }

  @override
  String timeHoursAgo(int hours) {
    return '$hours h ago';
  }

  @override
  String timeDaysAgo(int days) {
    return '$days d ago';
  }

  @override
  String get profile => 'Profile';

  @override
  String get verifiedKyc => 'Verified — KYC complete';

  @override
  String get kycBadgeRejected => 'Rejected — verify again';

  @override
  String get kycBadgeComplete => 'Complete identity verification';

  @override
  String get changePassword => 'Change password';

  @override
  String get language => 'Language';

  @override
  String get privacy => 'Privacy';

  @override
  String get logout => 'Logout';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get profession => 'Profession';

  @override
  String get address => 'Address';

  @override
  String get postalCode => 'Postal code';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageFrench => 'French';

  @override
  String get languageEnglish => 'English';

  @override
  String get chooseLanguage => 'Choose language';

  @override
  String get retry => 'Retry';

  @override
  String get goBack => 'Go back';

  @override
  String get errorGeneric => 'An error occurred, please try again';

  @override
  String get errorNetwork => 'Check your internet connection';

  @override
  String get paymentSuccess => 'Payment successful';

  @override
  String get paymentCancelled => 'Payment cancelled';

  @override
  String get paymentAlreadyDone =>
      'You are already registered for this auction — you can bid';

  @override
  String get paymentNotConfirmed =>
      'The payment confirmation has not arrived yet. If you paid, wait a moment and try again.';

  @override
  String get paymentBookNotConfirmed =>
      'The condition-book purchase has not been confirmed yet. If you paid, wait a moment and try again.';

  @override
  String get securePayment => 'Secure payment';

  @override
  String get paymentPageFailed => 'Could not load the payment page';

  @override
  String get valRequired => 'This field is required';

  @override
  String get valEmailInvalid => 'Invalid email';

  @override
  String get valPasswordShort => 'Password must be at least 12 characters';

  @override
  String get valPasswordMixedCase =>
      'Must contain an uppercase and a lowercase letter';

  @override
  String get valPasswordNumber => 'Must contain at least one number';

  @override
  String get valPasswordSymbol => 'Must contain at least one symbol';

  @override
  String get valBirthDateUnder18 => 'You must be at least 18 years old';

  @override
  String get valPasswordMismatch => 'Passwords do not match';

  @override
  String get valNinInvalid => 'NIN must be 18 digits';

  @override
  String get valPhoneInvalid => 'Invalid phone (10 digits starting with 0)';

  @override
  String get valNameShort => 'Name too short';

  @override
  String get offlineBanner => 'No internet connection';

  @override
  String get backOnline => 'Connection restored';

  @override
  String get appealsTitle => 'Appeals';

  @override
  String get appealsEmpty => 'No appeals';

  @override
  String get appealSubmitted => 'Your appeal has been submitted';

  @override
  String get newAppeal => 'Submit a new appeal';

  @override
  String get newAppealTitle => 'New appeal';

  @override
  String get appealSubject => 'Subject';

  @override
  String get appealSubjectHint => 'e.g. Appeal about the auction result';

  @override
  String get appealReason => 'Detailed reason';

  @override
  String get appealReasonHint =>
      'Explain the reason for your appeal in detail...';

  @override
  String get submitAppeal => 'Send appeal';

  @override
  String get appealStatusPending => 'Under review';

  @override
  String get appealStatusApproved => 'Approved';

  @override
  String get appealStatusRejected => 'Rejected';

  @override
  String get appealFileFromAuction =>
      'Appeals are filed from the auction page after it closes — open an auction you took part in, then choose “File an appeal”.';

  @override
  String get ctaLogin => 'Sign in to take part';

  @override
  String get ctaParticipate => 'Take part in the auction';

  @override
  String get ctaNeedsKyc => 'Complete your account verification';

  @override
  String get ctaNeedsCommerceRegister => 'Commercial register required';

  @override
  String get ctaCommerceRegisterHint =>
      'This auction requires a valid commercial register before any payment. Add it on the platform, then come back.';

  @override
  String get ctaBuyBook => 'Buy the condition book';

  @override
  String get ctaFinalPayment => 'Make the final payment';

  @override
  String get ctaFinalPaymentDone => 'Final payment completed';

  @override
  String get ctaAppeal => 'File an appeal';

  @override
  String get ctaTrackAppeal => 'Track the appeal';

  @override
  String get crTitle => 'Commercial register';

  @override
  String get crIntro =>
      'Some auctions require a valid commercial register. Submit your details plus a copy of the register and the tax card for review.';

  @override
  String get crStatusNone => 'No register submitted yet';

  @override
  String get crStatusPending => 'Under review';

  @override
  String get crStatusApproved => 'Approved';

  @override
  String get crStatusRejected => 'Rejected';

  @override
  String get crApprovedNote =>
      'Your register is approved — you can take part in auctions that require one.';

  @override
  String get crPendingNote =>
      'Your submission is under review. You can edit and resend it before a decision is made.';

  @override
  String get crRejectedNote =>
      'Submission rejected. Correct the details and resend.';

  @override
  String get crCompanyName => 'Company name';

  @override
  String get crCompanyNameHint => 'e.g. Mazayada Trading LLC';

  @override
  String get crRegisterNumber => 'Commercial register number';

  @override
  String get crRegisterNumberHint => 'e.g. 16/00-1234567 B 19';

  @override
  String get crRegisterNumberIncomplete => 'Register number looks incomplete';

  @override
  String get crTaxNumber => 'Tax number';

  @override
  String get crTaxNumberHint => '15 digits — e.g. 000116001234567';

  @override
  String get crTaxNumberDigitsOnly => 'The tax number must contain digits only';

  @override
  String crTaxNumberLength(int count) {
    return 'The tax number is $count digits long';
  }

  @override
  String get crActivityType => 'Activity type';

  @override
  String get crActivityTypeHint => 'e.g. Car trading';

  @override
  String get crStartDate => 'Register issue date';

  @override
  String get crStartDateHint => 'Pick the issue date';

  @override
  String get crStartDateNotFuture => 'The issue date cannot be in the future';

  @override
  String get crSectionCompany => 'Company details';

  @override
  String get crSectionDocuments => 'Required documents';

  @override
  String crProgress(int done, int total) {
    return '$done of $total complete';
  }

  @override
  String get crFixErrors => 'Check the fields marked in red';

  @override
  String get crDocumentsNote => 'Accepted: PDF or image (JPG/PNG) — 2 MB max.';

  @override
  String get crFileTooLarge => 'File exceeds 2 MB';

  @override
  String get crRegisterDocument => 'Commercial register scan';

  @override
  String get crTaxCardDocument => 'Tax card scan';

  @override
  String get crDocumentSelected => 'New file selected';

  @override
  String get crDocumentOnFile => 'Copy stored on the platform';

  @override
  String get crDocumentMissing => 'Required';

  @override
  String get crCapture => 'Take photo';

  @override
  String get crFromGallery => 'From gallery';

  @override
  String get crFromFiles => 'PDF file';

  @override
  String get crSubmit => 'Submit for review';

  @override
  String get crResubmit => 'Resend';

  @override
  String get crSubmitted => 'Register submitted for review';

  @override
  String get valTooLong => 'Text is longer than allowed';

  @override
  String get valTooShort => 'Text is shorter than required';

  @override
  String get fpTitle => 'Final payment breakdown';

  @override
  String get fpConfirmedDeposit => 'Deposit paid (deducted)';

  @override
  String get fpAmountDue => 'Amount due';

  @override
  String get fpCustomsImmediate => 'Immediate payment (20% customs)';

  @override
  String fpDeadline(String date, int days) {
    return 'Payment deadline: $date (within $days days)';
  }

  @override
  String get fpAlreadyPaid => 'The final payment has already been made';

  @override
  String get fpPay => 'Proceed to payment';

  @override
  String get assetClassMovable => 'Movable';

  @override
  String get assetClassRealEstate => 'Real estate';

  @override
  String get assetClassCustoms => 'Customs goods';

  @override
  String get conditionNew => 'New';

  @override
  String get conditionGood => 'Good';

  @override
  String get conditionFair => 'Fair';

  @override
  String get conditionPoor => 'Poor';

  @override
  String get conditionScrap => 'Scrap';

  @override
  String get auctionTypeSale => 'Sale';

  @override
  String get auctionTypeLease => 'Lease';

  @override
  String get adSpecifications => 'Specifications';

  @override
  String get adPricing => 'Prices and fees';

  @override
  String get adBookPrice => 'Condition book';

  @override
  String get adAssetInfo => 'Asset details';

  @override
  String get adAuctionType => 'Auction type';

  @override
  String get adAssetClass => 'Asset class';

  @override
  String get adCondition => 'Condition';

  @override
  String get adUnitCount => 'Unit count';

  @override
  String get adRequiresCr => 'Commercial register required';

  @override
  String get adRequiresNewspaper => 'Newspaper announcement';

  @override
  String get adYes => 'Yes';

  @override
  String get adSchedule => 'Schedule';

  @override
  String get adStartTime => 'Auction start';

  @override
  String get adEndTime => 'Auction end';

  @override
  String get adExtensions => 'Extensions';

  @override
  String get adLocation => 'Location';

  @override
  String get adCommune => 'Commune';

  @override
  String get adMayor => 'Mayor';

  @override
  String get adOpenMap => 'Open in Maps';

  @override
  String get adInspection => 'Inspection';

  @override
  String get adInspectionState => 'Inspection status';

  @override
  String get adInspectionOpen => 'Open now';

  @override
  String get adInspectionClosed => 'Closed';

  @override
  String get adFrom => 'From';

  @override
  String get adTo => 'To';

  @override
  String get adInspectionPlace => 'Inspection venue';

  @override
  String get adLease => 'Lease terms';

  @override
  String get adLeaseDuration => 'Duration (years)';

  @override
  String get adLeaseRenewals => 'Renewals';

  @override
  String get adTerms => 'Terms';

  @override
  String get adConditionTerms => 'Participation terms';

  @override
  String get adAwardTerms => 'Award terms';

  @override
  String get adResult => 'Auction result';

  @override
  String get adWinner => 'Winner';

  @override
  String get adNoWinner => 'No winner';

  @override
  String get adFinalPrice => 'Final price';

  @override
  String get adAppealWindow => 'Appeal window';

  @override
  String adAppealOpen(int days) {
    return 'Open ($days days)';
  }

  @override
  String get adAppealClosed => 'Expired';

  @override
  String kycFileTooLarge(int maxKb) {
    return 'File exceeds $maxKb KB — try a smaller image';
  }

  @override
  String get docsTitle => 'My documents';

  @override
  String get docsSearchHint => 'Search by auction or document';

  @override
  String get docsTotal => 'Total';

  @override
  String get docsBooks => 'Books';

  @override
  String get docsAwards => 'Awards';

  @override
  String get docsReceipts => 'Receipts';

  @override
  String get docsFilters => 'Filter documents';

  @override
  String get docsType => 'Document type';

  @override
  String get docsPeriod => 'Period';

  @override
  String get docsCategory => 'Category';

  @override
  String get docsEntity => 'Entity';

  @override
  String get docsSort => 'Sort';

  @override
  String get docsApply => 'Apply';

  @override
  String get docsClearFilters => 'Clear all';

  @override
  String get docTypeConditionBook => 'Condition book';

  @override
  String get docTypeAward => 'Award document';

  @override
  String get docTypeReceipt => 'Payment receipt';

  @override
  String get docTypeDelivery => 'Delivery report';

  @override
  String get docsPresetAll => 'All';

  @override
  String get docsPresetToday => 'Today';

  @override
  String get docsPreset7d => 'Last 7 days';

  @override
  String get docsPreset30d => 'Last 30 days';

  @override
  String get docsPresetMonth => 'This month';

  @override
  String get docsPresetYear => 'This year';

  @override
  String get docsSortRecent => 'Newest';

  @override
  String get docsSortOldest => 'Oldest';

  @override
  String get docsSortAuction => 'By auction';

  @override
  String get docsEmpty =>
      'No documents yet — documents from auctions you take part in appear here';

  @override
  String get docsNoResults => 'No documents match the filters';

  @override
  String get docsVerify => 'Verify';

  @override
  String get docsCannotOpen =>
      'Could not open the file — no PDF viewer installed';

  @override
  String get docsDownloadForbidden =>
      'You don\'t have access to download this document';

  @override
  String get docsDownloadUnavailable =>
      'The document file isn\'t available right now';

  @override
  String get adAwardDocument => 'Award document';

  @override
  String get adDownloadAward => 'Download award document';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get forgotPasswordTitle => 'Reset password';

  @override
  String get recoverAccountTitle => 'Recover with secret question';

  @override
  String get recoverWithSecret => 'Recover with secret question';

  @override
  String get forgotPasswordHint =>
      'Enter your NIN and registered email and we will send a reset code.';

  @override
  String get recoverAccountHint =>
      'Enter your NIN and registered email to see your secret question.';

  @override
  String get sendCode => 'Send code';

  @override
  String get showQuestion => 'Show question';

  @override
  String codeSentHint(String email) {
    return 'If an account exists for $email, a 6-digit code has just been sent to it.';
  }

  @override
  String get otpCode => 'Verification code';

  @override
  String get secretAnswer => 'Secret answer';

  @override
  String get secretAnswerHint =>
      'The answer is case- and space-sensitive — type it exactly as you registered it.';

  @override
  String get newPassword => 'New password';

  @override
  String get setNewPassword => 'Set password';

  @override
  String get recoveryDone =>
      'Password changed — sign in with your new password';

  @override
  String get secretQMotherMaiden => 'What is your mother\'s maiden name?';

  @override
  String get secretQFirstSchool => 'What was the name of your first school?';

  @override
  String get secretQBirthCity => 'In which city were you born?';

  @override
  String get secretQPetName => 'What was your first pet\'s name?';

  @override
  String get secretQFavTeacher => 'Who was your favourite teacher?';

  @override
  String bidsSoFar(int count) {
    return '$count bids so far';
  }

  @override
  String get unitDays => 'day';

  @override
  String get unitHours => 'hour';

  @override
  String get unitMinutes => 'min';

  @override
  String get unitSeconds => 'sec';

  @override
  String bidAmountHint(String currency) {
    return 'Bid amount ($currency)';
  }

  @override
  String minBidHint(String amount) {
    return 'Minimum bid: $amount';
  }

  @override
  String get submitYourBid => 'Place your bid';

  @override
  String get bidBelowMinimum => 'Amount is below the minimum bid';

  @override
  String get biddingClosed => 'Bidding is closed';

  @override
  String get ackTitle => 'Auction registration';

  @override
  String get ackSubtitleHasBook =>
      'Accept the participation terms to start registration through the secure payment gateway';

  @override
  String get ackSubtitleNeedsBook =>
      'Buying the condition book is required to register — two payments will open in sequence: the book, then the registration';

  @override
  String get ackDepositRow => 'Deposit (refundable)';

  @override
  String get ackBookRow => 'Condition book (non-refundable)';

  @override
  String get ackAgree =>
      'I confirm I have read the condition book and accept the participation terms';

  @override
  String get ackContinue => 'Continue to payment';

  @override
  String get ackGatewayNote => 'The secure payment gateway (CIBWeb) will open';

  @override
  String minBidSectorHint(String amount, String percent) {
    return 'Minimum bid $amount (sector rate $percent%)';
  }

  @override
  String bidBelowSectorMinimum(String amount, String percent) {
    return 'You cannot bid below $amount — the increment set for this sector is $percent%';
  }

  @override
  String get adSession => 'Auction session';

  @override
  String get adSessionNumber => 'Session number';

  @override
  String sessionRound(int round) {
    return 'Session no. $round';
  }

  @override
  String get adSessionCode => 'Reference';

  @override
  String get adRescheduleCount => 'Times rescheduled';

  @override
  String get adReduction => 'Reduction applied to the opening price';

  @override
  String percentValue(String percent) {
    return '$percent%';
  }

  @override
  String get adOriginalOpeningPrice => 'Original opening price';

  @override
  String get adSessionHistory => 'Previous sessions';

  @override
  String get adSector => 'Sector';

  @override
  String get adSectorIncrement => 'Sector minimum increment';

  @override
  String get adMinBid => 'Minimum accepted bid';

  @override
  String get auctionFeatured => 'Featured';

  @override
  String sessionRescheduledBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count times',
      one: 'once',
    );
    return 'This auction has been rescheduled $_temp0 — the opening price shown includes the reduction';
  }

  @override
  String get lostEmailLink => 'Lost your email?';

  @override
  String get lostEmailTitle => 'Email recovery';

  @override
  String get lostEmailHint =>
      'If you have lost access to your email, enter your details and attach a selfie holding your ID card. The relevant department will review the request and approve the new address.';

  @override
  String get lostEmailNewEmail => 'New email address';

  @override
  String get lostEmailSelfie => 'Selfie with ID card';

  @override
  String get lostEmailSelfieHint =>
      'Hold the ID card next to your face; keep the photo and its details clearly readable';

  @override
  String get lostEmailRetake => 'Retake the photo';

  @override
  String get lostEmailSubmit => 'Submit for review';

  @override
  String get lostEmailSubmittedTitle => 'Request submitted';

  @override
  String get lostEmailSubmittedBody =>
      'Your request is under review by the relevant department. You will be able to sign in with the new address once it is approved.';

  @override
  String get lostEmailApprovedBody =>
      'Your new address has been approved. You can now sign in with it.';

  @override
  String get lostEmailRejectedBody =>
      'The request was rejected. Review the reason below and resubmit after correcting your details.';

  @override
  String get lostEmailRejectionReason => 'Rejection reason';

  @override
  String get lostEmailRefreshStatus => 'Refresh status';

  @override
  String get lostEmailResubmit => 'Edit and resubmit';

  @override
  String get lostEmailRequestRef => 'Request number';

  @override
  String get lostEmailSubmittedAt => 'Submitted on';

  @override
  String get lostEmailSelfieRequired =>
      'The selfie with your ID card is required';

  @override
  String lostEmailImageTooLarge(int max) {
    return 'The image exceeds $max KB — take a smaller photo';
  }

  @override
  String get docTypeParticipationReceipt => 'Participation receipt';

  @override
  String get docTypeAuctionResult => 'Auction result receipt';

  @override
  String get adDocuments => 'Auction documents';

  @override
  String get adDownloadParticipationReceipt => 'Download participation receipt';

  @override
  String get adDownloadResult => 'Download result receipt';

  @override
  String get adDownloadConditionBook => 'Download the condition book';

  @override
  String get adReceiptHint =>
      'You can print or save the receipt after downloading';

  @override
  String get adUnavailableTitle => 'Auction unavailable';

  @override
  String get adUnavailableBody =>
      'This auction may have been cancelled or is no longer listed.';

  @override
  String get premiumTitle => 'Premium membership';

  @override
  String get premiumTagline => 'Hear about new auctions before anyone else';

  @override
  String get premiumActive => 'Your subscription is active';

  @override
  String get premiumInactive => 'No active subscription';

  @override
  String get premiumPlanLabel => 'Plan';

  @override
  String get premiumStatus => 'Status';

  @override
  String get premiumStartedAt => 'Start date';

  @override
  String get premiumExpiresAt => 'Expiry date';

  @override
  String get premiumAutoRenew => 'Auto-renewal';

  @override
  String get premiumAutoRenewOn => 'On';

  @override
  String get premiumAutoRenewOff => 'Off';

  @override
  String get premiumStopAutoRenew => 'Turn off auto-renewal';

  @override
  String get premiumStopAutoRenewConfirm =>
      'Your subscription stays active until its expiry date and will not renew after that. Continue?';

  @override
  String premiumDaysRemaining(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days left',
      one: '1 day left',
    );
    return '$_temp0';
  }

  @override
  String get premiumExpiringSoon =>
      'Your subscription is about to expire — renew it so you keep the alerts';

  @override
  String get premiumChoosePlan => 'Choose your plan';

  @override
  String get premiumSubscribe => 'Subscribe now';

  @override
  String get premiumRenew => 'Renew subscription';

  @override
  String get premiumRecommended => 'Best value';

  @override
  String get premiumPeriodMonthly => 'per month';

  @override
  String get premiumPeriodYearly => 'per year';

  @override
  String get premiumNoPlans => 'No plans are available right now';

  @override
  String get premiumPaymentDone => 'Your subscription is now active';

  @override
  String get cancel => 'Cancel';

  @override
  String get prefsTitle => 'Notification preferences';

  @override
  String get prefsChannelsTitle => 'Delivery channels';

  @override
  String get prefsChannelPush => 'App notifications';

  @override
  String get prefsChannelPushHint => 'Delivered to your phone as things happen';

  @override
  String get prefsChannelEmail => 'Email';

  @override
  String get prefsChannelEmailHint =>
      'A summary of new auctions matching your interests';

  @override
  String get prefsChannelEmailPremiumOnly => 'Available to Premium members';

  @override
  String get prefsChannelSms => 'SMS';

  @override
  String get prefsNewAuctionAlerts => 'New auction alerts';

  @override
  String get prefsNewAuctionAlertsHint =>
      'We alert you as soon as an auction in your chosen categories is published';

  @override
  String get prefsCategoriesTitle => 'Categories you care about';

  @override
  String get prefsCategoriesHint =>
      'Pick one or more. With none selected you get alerts for every category.';

  @override
  String get prefsCategoriesAll => 'All categories';

  @override
  String get prefsNoCategories => 'No categories are available';

  @override
  String get prefsSave => 'Save preferences';

  @override
  String get prefsSaved => 'Your preferences were saved';

  @override
  String get prefsDiscardChanges =>
      'You have unsaved changes. Leave without saving?';

  @override
  String get prefsLeave => 'Leave';

  @override
  String get prefsGoPremium => 'Get Premium';
}
