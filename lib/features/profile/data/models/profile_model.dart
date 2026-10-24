import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

/// جهة المستخدم — `entity: {id, name}` (whenLoaded، فالمفتاح ممكن يغيب تمامًا).
@freezed
abstract class ProfileEntityRefModel with _$ProfileEntityRefModel {
  const ProfileEntityRefModel._();

  const factory ProfileEntityRefModel({String? id, String? name}) =
      _ProfileEntityRefModel;

  factory ProfileEntityRefModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityRefModelFromJson(json);

  ProfileEntityRef toEntity() =>
      ProfileEntityRef(id: id ?? '', name: name ?? '');
}

/// يطابق UserResource. كل الحقول nullable لأن بعضها بيغيب حسب السياق —
/// مثال: `entity` بيتشال لما العلاقة مش محمّلة، و PUT /profile بيرجّع الرد
/// من غير `entity` أصلًا.
///
/// نفس الـ Resource بيرجع من `/profile` و`/auth/me` و`/auth/login`، فحقول
/// التعبئة المسبقة (BE-8) متاحة في التلاتة.
@freezed
abstract class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    required String id,
    @JsonKey(name: 'nin_masked') String? ninMasked,
    String? name,
    @JsonKey(name: 'first_name_ar') String? firstNameAr,
    @JsonKey(name: 'last_name_ar') String? lastNameAr,
    @JsonKey(name: 'first_name_fr') String? firstNameFr,
    @JsonKey(name: 'last_name_fr') String? lastNameFr,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'commune_id') int? communeId,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? profession,
    String? locale,
    String? role,
    // ===== حقول التعبئة المسبقة للـ KYC (BE-8) =====
    @JsonKey(name: 'wilaya_id') int? wilayaId,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'birth_place') String? birthPlace,
    @JsonKey(name: 'father_name') String? fatherName,
    @JsonKey(name: 'mother_name') String? motherName,
    @JsonKey(name: 'mother_surname') String? motherSurname,
    @JsonKey(name: 'expected_income') int? expectedIncome,
    @JsonKey(name: 'id_card_number') String? idCardNumber,
    @JsonKey(name: 'passport_number') String? passportNumber,
    @JsonKey(name: 'license_number') String? licenseNumber,
    String? rip,
    String? nif,
    String? nis,
    @JsonKey(name: 'account_status') String? accountStatus,
    @JsonKey(name: 'account_type') String? accountType,
    @JsonKey(name: 'is_institution') @Default(false) bool isInstitution,
    ProfileEntityRefModel? entity,
    @JsonKey(name: 'kyc_status') @Default('PENDING') String kycStatus,
    @JsonKey(name: 'commercial_register_status')
    String? commercialRegisterStatus,
    @JsonKey(name: 'has_commerce_register')
    @Default(false)
    bool hasCommerceRegister,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
    @JsonKey(name: 'phone_verified') @Default(false) bool phoneVerified,
    @JsonKey(name: 'secret_question') String? secretQuestion,
    @JsonKey(name: 'has_secret_question')
    @Default(false)
    bool hasSecretQuestion,
    // جديد (App Store 5.1.1) — غايب في الردود القديمة، فبنشتقّه من الحقلين.
    @JsonKey(name: 'identity_complete') bool? identityComplete,
    @JsonKey(name: 'is_kyc_complete') @Default(false) bool isKycComplete,
    @JsonKey(name: 'can_bid') @Default(false) bool canBid,
    @JsonKey(name: 'is_premium') @Default(false) bool isPremium,
    @JsonKey(name: 'is_blacklisted') @Default(false) bool isBlacklisted,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Profile toEntity() => Profile(
    id: id,
    ninMasked: ninMasked,
    // الباك بيرجّع `name` جاهز؛ لو غاب نركّبه من الاسم العربي.
    fullName: name?.trim().isNotEmpty == true
        ? name!
        : [firstNameAr, lastNameAr].whereType<String>().join(' ').trim(),
    firstNameAr: firstNameAr,
    lastNameAr: lastNameAr,
    firstNameFr: firstNameFr,
    lastNameFr: lastNameFr,
    email: email,
    phone: phone,
    address: address,
    communeId: communeId,
    postalCode: postalCode,
    profession: profession,
    locale: locale,
    role: role,
    wilayaId: wilayaId,
    birthDate: birthDate,
    birthPlace: birthPlace,
    fatherName: fatherName,
    motherName: motherName,
    motherSurname: motherSurname,
    expectedIncome: expectedIncome,
    idCardNumber: idCardNumber,
    passportNumber: passportNumber,
    licenseNumber: licenseNumber,
    rip: rip,
    nif: nif,
    nis: nis,
    accountStatus: accountStatus,
    accountType: accountType,
    isInstitution: isInstitution,
    entity: entity?.toEntity(),
    kycStatus: kycStatus,
    commercialRegisterStatus: commercialRegisterStatus,
    hasCommerceRegister: hasCommerceRegister,
    emailVerified: emailVerified,
    phoneVerified: phoneVerified,
    secretQuestion: secretQuestion,
    hasSecretQuestion: hasSecretQuestion,
    identityComplete:
        identityComplete ??
        ((ninMasked?.isNotEmpty ?? false) && (birthDate?.isNotEmpty ?? false)),
    isKycComplete: isKycComplete,
    canBid: canBid,
    isPremium: isPremium,
    isBlacklisted: isBlacklisted,
  );
}
