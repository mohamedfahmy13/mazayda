import 'package:equatable/equatable.dart';

/// جهة تابع لها المستخدم (بيرجع فقط لما العلاقة محمّلة).
class ProfileEntityRef extends Equatable {
  final String id;
  final String name;

  const ProfileEntityRef({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

/// الملف الشخصي — يطابق UserResource.
///
/// ملاحظتان مهمتان:
/// 1) مفيش `wilaya_name` في الـ API — الموقع بيرجع كـ `commune_id` رقم فقط.
/// 2) أعلام القدرات (canBid / isKycComplete / hasCommerceRegister /
///    isBlacklisted) هي **عقد التحكّم الرسمي** من الباك — نستخدمها بدل ما
///    نعيد اشتقاق الصلاحيات من الحالات الخام.
class Profile extends Equatable {
  final String id;

  /// مخفي جزئيًا — `null` لو الحساب اتعمل من غير رقم تعريف (اختياري عند
  /// التسجيل من الموبايل، وبيتطلب في الـ KYC).
  final String? ninMasked;
  final String fullName;
  final String? firstNameAr;
  final String? lastNameAr;
  final String? firstNameFr;
  final String? lastNameFr;
  final String? email;
  final String? phone;
  final String? address;
  final int? communeId;
  final String? postalCode;
  final String? profession;
  final String? locale;
  final String? role;

  // ===== حقول فورم الـ KYC للتعبئة المسبقة (BE-8) =====
  // مستخدم اترفض طلبه ومحتاج يعدّل حقل واحد ماينفعش يعيد كتابة 17 حقل.
  // كلها بترجع من `/profile` و`/auth/me` و`/auth/login` (نفس الـ Resource).

  /// الولاية — مشتقّة في الباك من البلدية، فما نحتاجش بحث عكسي في
  /// `/wilayas` عشان نعرف ولاية المستخدم من `communeId`.
  final int? wilayaId;

  final String? birthDate; // Y-m-d زي ما الباك بيبعتها — null لو لسه ماتضافش
  final String? birthPlace;
  final String? fatherName;
  final String? motherName;
  final String? motherSurname;
  final int? expectedIncome;
  final String? idCardNumber;
  final String? passportNumber;
  final String? licenseNumber;
  final String? rip;
  final String? nif;
  final String? nis;

  /// ACTIVE | SUSPENDED | BANNED
  final String? accountStatus;
  final String? accountType;
  final bool isInstitution;
  final ProfileEntityRef? entity;

  /// PENDING | UNDER_REVIEW | COMPLETE | REJECTED | SUSPENDED
  final String kycStatus;

  /// PENDING | APPROVED | REJECTED — أو null لو مقدّمش سجل تجاري أصلًا.
  final String? commercialRegisterStatus;
  final bool hasCommerceRegister;

  final bool emailVerified;
  final bool phoneVerified;
  final String? secretQuestion;
  final bool hasSecretQuestion;

  /// رقم التعريف **و**تاريخ الميلاد موجودين على الحساب. لو `false` فورم
  /// الـ KYC لازم يطلب الناقص منهم (`ninMasked` / `birthDate` = null).
  final bool identityComplete;

  // أعلام القدرات المحسوبة في السيرفر.
  final bool isKycComplete;
  final bool canBid;
  final bool isPremium;
  final bool isBlacklisted;

  const Profile({
    required this.id,
    this.ninMasked,
    required this.fullName,
    this.firstNameAr,
    this.lastNameAr,
    this.firstNameFr,
    this.lastNameFr,
    this.email,
    this.phone,
    this.address,
    this.communeId,
    this.postalCode,
    this.profession,
    this.locale,
    this.role,
    this.wilayaId,
    this.birthDate,
    this.birthPlace,
    this.fatherName,
    this.motherName,
    this.motherSurname,
    this.expectedIncome,
    this.idCardNumber,
    this.passportNumber,
    this.licenseNumber,
    this.rip,
    this.nif,
    this.nis,
    this.accountStatus,
    this.accountType,
    this.isInstitution = false,
    this.entity,
    this.kycStatus = 'PENDING',
    this.commercialRegisterStatus,
    this.hasCommerceRegister = false,
    this.emailVerified = false,
    this.phoneVerified = false,
    this.secretQuestion,
    this.hasSecretQuestion = false,
    this.identityComplete = true,
    this.isKycComplete = false,
    this.canBid = false,
    this.isPremium = false,
    this.isBlacklisted = false,
  });

  /// الحساب موثّق — نعتمد على علم السيرفر، مش على مقارنة نص الحالة.
  /// (القيمة 'VERIFIED' اللي كانت مستخدمة قبل كده مش موجودة في الباك أصلًا.)
  bool get isVerified => isKycComplete;

  bool get isAccountActive => accountStatus == null || accountStatus == 'ACTIVE';

  /// الناقص اللي فورم الـ KYC لازم يسأل عنه.
  bool get needsNin => ninMasked?.isNotEmpty != true;
  bool get needsBirthDate => birthDate?.isNotEmpty != true;

  @override
  List<Object?> get props => [
    id,
    ninMasked,
    fullName,
    email,
    phone,
    address,
    communeId,
    postalCode,
    profession,
    kycStatus,
    commercialRegisterStatus,
    canBid,
    isKycComplete,
    identityComplete,
    birthDate,
  ];
}
