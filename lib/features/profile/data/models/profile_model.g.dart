// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileEntityRefModel _$ProfileEntityRefModelFromJson(
  Map<String, dynamic> json,
) => _ProfileEntityRefModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$ProfileEntityRefModelToJson(
  _ProfileEntityRefModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      ninMasked: json['nin_masked'] as String?,
      name: json['name'] as String?,
      firstNameAr: json['first_name_ar'] as String?,
      lastNameAr: json['last_name_ar'] as String?,
      firstNameFr: json['first_name_fr'] as String?,
      lastNameFr: json['last_name_fr'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      communeId: (json['commune_id'] as num?)?.toInt(),
      postalCode: json['postal_code'] as String?,
      profession: json['profession'] as String?,
      locale: json['locale'] as String?,
      role: json['role'] as String?,
      wilayaId: (json['wilaya_id'] as num?)?.toInt(),
      birthDate: json['birth_date'] as String?,
      birthPlace: json['birth_place'] as String?,
      fatherName: json['father_name'] as String?,
      motherName: json['mother_name'] as String?,
      motherSurname: json['mother_surname'] as String?,
      expectedIncome: (json['expected_income'] as num?)?.toInt(),
      idCardNumber: json['id_card_number'] as String?,
      passportNumber: json['passport_number'] as String?,
      licenseNumber: json['license_number'] as String?,
      rip: json['rip'] as String?,
      nif: json['nif'] as String?,
      nis: json['nis'] as String?,
      accountStatus: json['account_status'] as String?,
      accountType: json['account_type'] as String?,
      isInstitution: json['is_institution'] as bool? ?? false,
      entity: json['entity'] == null
          ? null
          : ProfileEntityRefModel.fromJson(
              json['entity'] as Map<String, dynamic>,
            ),
      kycStatus: json['kyc_status'] as String? ?? 'PENDING',
      commercialRegisterStatus: json['commercial_register_status'] as String?,
      hasCommerceRegister: json['has_commerce_register'] as bool? ?? false,
      emailVerified: json['email_verified'] as bool? ?? false,
      phoneVerified: json['phone_verified'] as bool? ?? false,
      secretQuestion: json['secret_question'] as String?,
      hasSecretQuestion: json['has_secret_question'] as bool? ?? false,
      identityComplete: json['identity_complete'] as bool?,
      isKycComplete: json['is_kyc_complete'] as bool? ?? false,
      canBid: json['can_bid'] as bool? ?? false,
      isPremium: json['is_premium'] as bool? ?? false,
      isBlacklisted: json['is_blacklisted'] as bool? ?? false,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nin_masked': instance.ninMasked,
      'name': instance.name,
      'first_name_ar': instance.firstNameAr,
      'last_name_ar': instance.lastNameAr,
      'first_name_fr': instance.firstNameFr,
      'last_name_fr': instance.lastNameFr,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'commune_id': instance.communeId,
      'postal_code': instance.postalCode,
      'profession': instance.profession,
      'locale': instance.locale,
      'role': instance.role,
      'wilaya_id': instance.wilayaId,
      'birth_date': instance.birthDate,
      'birth_place': instance.birthPlace,
      'father_name': instance.fatherName,
      'mother_name': instance.motherName,
      'mother_surname': instance.motherSurname,
      'expected_income': instance.expectedIncome,
      'id_card_number': instance.idCardNumber,
      'passport_number': instance.passportNumber,
      'license_number': instance.licenseNumber,
      'rip': instance.rip,
      'nif': instance.nif,
      'nis': instance.nis,
      'account_status': instance.accountStatus,
      'account_type': instance.accountType,
      'is_institution': instance.isInstitution,
      'entity': instance.entity,
      'kyc_status': instance.kycStatus,
      'commercial_register_status': instance.commercialRegisterStatus,
      'has_commerce_register': instance.hasCommerceRegister,
      'email_verified': instance.emailVerified,
      'phone_verified': instance.phoneVerified,
      'secret_question': instance.secretQuestion,
      'has_secret_question': instance.hasSecretQuestion,
      'identity_complete': instance.identityComplete,
      'is_kyc_complete': instance.isKycComplete,
      'can_bid': instance.canBid,
      'is_premium': instance.isPremium,
      'is_blacklisted': instance.isBlacklisted,
    };
