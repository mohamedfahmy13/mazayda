// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEntityRefModel {

 String? get id; String? get name;
/// Create a copy of ProfileEntityRefModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityRefModelCopyWith<ProfileEntityRefModel> get copyWith => _$ProfileEntityRefModelCopyWithImpl<ProfileEntityRefModel>(this as ProfileEntityRefModel, _$identity);

  /// Serializes this ProfileEntityRefModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileEntityRefModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntityRefModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileEntityRefModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as ProfileEntityRefModel;
  return 'ProfileEntityRefModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $ProfileEntityRefModelCopyWith<$Res>  {
  factory $ProfileEntityRefModelCopyWith(ProfileEntityRefModel value, $Res Function(ProfileEntityRefModel) _then) = _$ProfileEntityRefModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$ProfileEntityRefModelCopyWithImpl<$Res>
    implements $ProfileEntityRefModelCopyWith<$Res> {
  _$ProfileEntityRefModelCopyWithImpl(this._self, this._then);

  final ProfileEntityRefModel _self;
  final $Res Function(ProfileEntityRefModel) _then;

/// Create a copy of ProfileEntityRefModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(ProfileEntityRefModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEntityRefModel].
extension ProfileEntityRefModelPatterns on ProfileEntityRefModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntityRefModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntityRefModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntityRefModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntityRefModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntityRefModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntityRefModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntityRefModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntityRefModel():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntityRefModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileEntityRefModel extends ProfileEntityRefModel {
  const _ProfileEntityRefModel({this.id, this.name}): super._();
  factory _ProfileEntityRefModel.fromJson(Map<String, dynamic> json) => _$ProfileEntityRefModelFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of ProfileEntityRefModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityRefModelCopyWith<_ProfileEntityRefModel> get copyWith => __$ProfileEntityRefModelCopyWithImpl<_ProfileEntityRefModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileEntityRefModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntityRefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'ProfileEntityRefModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProfileEntityRefModelCopyWith<$Res> implements $ProfileEntityRefModelCopyWith<$Res> {
  factory _$ProfileEntityRefModelCopyWith(_ProfileEntityRefModel value, $Res Function(_ProfileEntityRefModel) _then) = __$ProfileEntityRefModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$ProfileEntityRefModelCopyWithImpl<$Res>
    implements _$ProfileEntityRefModelCopyWith<$Res> {
  __$ProfileEntityRefModelCopyWithImpl(this._self, this._then);

  final _ProfileEntityRefModel _self;
  final $Res Function(_ProfileEntityRefModel) _then;

/// Create a copy of ProfileEntityRefModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_ProfileEntityRefModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProfileModel {

 String get id;@JsonKey(name: 'nin_masked') String? get ninMasked; String? get name;@JsonKey(name: 'first_name_ar') String? get firstNameAr;@JsonKey(name: 'last_name_ar') String? get lastNameAr;@JsonKey(name: 'first_name_fr') String? get firstNameFr;@JsonKey(name: 'last_name_fr') String? get lastNameFr; String? get email; String? get phone; String? get address;@JsonKey(name: 'commune_id') int? get communeId;@JsonKey(name: 'postal_code') String? get postalCode; String? get profession; String? get locale; String? get role;@JsonKey(name: 'wilaya_id') int? get wilayaId;@JsonKey(name: 'birth_date') String? get birthDate;@JsonKey(name: 'birth_place') String? get birthPlace;@JsonKey(name: 'father_name') String? get fatherName;@JsonKey(name: 'mother_name') String? get motherName;@JsonKey(name: 'mother_surname') String? get motherSurname;@JsonKey(name: 'expected_income') int? get expectedIncome;@JsonKey(name: 'id_card_number') String? get idCardNumber;@JsonKey(name: 'passport_number') String? get passportNumber;@JsonKey(name: 'license_number') String? get licenseNumber; String? get rip; String? get nif; String? get nis;@JsonKey(name: 'account_status') String? get accountStatus;@JsonKey(name: 'account_type') String? get accountType;@JsonKey(name: 'is_institution') bool get isInstitution; ProfileEntityRefModel? get entity;@JsonKey(name: 'kyc_status') String get kycStatus;@JsonKey(name: 'commercial_register_status') String? get commercialRegisterStatus;@JsonKey(name: 'has_commerce_register') bool get hasCommerceRegister;@JsonKey(name: 'email_verified') bool get emailVerified;@JsonKey(name: 'phone_verified') bool get phoneVerified;@JsonKey(name: 'secret_question') String? get secretQuestion;@JsonKey(name: 'has_secret_question') bool get hasSecretQuestion;@JsonKey(name: 'identity_complete') bool? get identityComplete;@JsonKey(name: 'is_kyc_complete') bool get isKycComplete;@JsonKey(name: 'can_bid') bool get canBid;@JsonKey(name: 'is_premium') bool get isPremium;@JsonKey(name: 'is_blacklisted') bool get isBlacklisted;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.ninMasked, _this.ninMasked) || other.ninMasked == _this.ninMasked)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.firstNameAr, _this.firstNameAr) || other.firstNameAr == _this.firstNameAr)&&(identical(other.lastNameAr, _this.lastNameAr) || other.lastNameAr == _this.lastNameAr)&&(identical(other.firstNameFr, _this.firstNameFr) || other.firstNameFr == _this.firstNameFr)&&(identical(other.lastNameFr, _this.lastNameFr) || other.lastNameFr == _this.lastNameFr)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.communeId, _this.communeId) || other.communeId == _this.communeId)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.profession, _this.profession) || other.profession == _this.profession)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.wilayaId, _this.wilayaId) || other.wilayaId == _this.wilayaId)&&(identical(other.birthDate, _this.birthDate) || other.birthDate == _this.birthDate)&&(identical(other.birthPlace, _this.birthPlace) || other.birthPlace == _this.birthPlace)&&(identical(other.fatherName, _this.fatherName) || other.fatherName == _this.fatherName)&&(identical(other.motherName, _this.motherName) || other.motherName == _this.motherName)&&(identical(other.motherSurname, _this.motherSurname) || other.motherSurname == _this.motherSurname)&&(identical(other.expectedIncome, _this.expectedIncome) || other.expectedIncome == _this.expectedIncome)&&(identical(other.idCardNumber, _this.idCardNumber) || other.idCardNumber == _this.idCardNumber)&&(identical(other.passportNumber, _this.passportNumber) || other.passportNumber == _this.passportNumber)&&(identical(other.licenseNumber, _this.licenseNumber) || other.licenseNumber == _this.licenseNumber)&&(identical(other.rip, _this.rip) || other.rip == _this.rip)&&(identical(other.nif, _this.nif) || other.nif == _this.nif)&&(identical(other.nis, _this.nis) || other.nis == _this.nis)&&(identical(other.accountStatus, _this.accountStatus) || other.accountStatus == _this.accountStatus)&&(identical(other.accountType, _this.accountType) || other.accountType == _this.accountType)&&(identical(other.isInstitution, _this.isInstitution) || other.isInstitution == _this.isInstitution)&&(identical(other.entity, _this.entity) || other.entity == _this.entity)&&(identical(other.kycStatus, _this.kycStatus) || other.kycStatus == _this.kycStatus)&&(identical(other.commercialRegisterStatus, _this.commercialRegisterStatus) || other.commercialRegisterStatus == _this.commercialRegisterStatus)&&(identical(other.hasCommerceRegister, _this.hasCommerceRegister) || other.hasCommerceRegister == _this.hasCommerceRegister)&&(identical(other.emailVerified, _this.emailVerified) || other.emailVerified == _this.emailVerified)&&(identical(other.phoneVerified, _this.phoneVerified) || other.phoneVerified == _this.phoneVerified)&&(identical(other.secretQuestion, _this.secretQuestion) || other.secretQuestion == _this.secretQuestion)&&(identical(other.hasSecretQuestion, _this.hasSecretQuestion) || other.hasSecretQuestion == _this.hasSecretQuestion)&&(identical(other.identityComplete, _this.identityComplete) || other.identityComplete == _this.identityComplete)&&(identical(other.isKycComplete, _this.isKycComplete) || other.isKycComplete == _this.isKycComplete)&&(identical(other.canBid, _this.canBid) || other.canBid == _this.canBid)&&(identical(other.isPremium, _this.isPremium) || other.isPremium == _this.isPremium)&&(identical(other.isBlacklisted, _this.isBlacklisted) || other.isBlacklisted == _this.isBlacklisted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileModel;
  return Object.hashAll([runtimeType,_this.id,_this.ninMasked,_this.name,_this.firstNameAr,_this.lastNameAr,_this.firstNameFr,_this.lastNameFr,_this.email,_this.phone,_this.address,_this.communeId,_this.postalCode,_this.profession,_this.locale,_this.role,_this.wilayaId,_this.birthDate,_this.birthPlace,_this.fatherName,_this.motherName,_this.motherSurname,_this.expectedIncome,_this.idCardNumber,_this.passportNumber,_this.licenseNumber,_this.rip,_this.nif,_this.nis,_this.accountStatus,_this.accountType,_this.isInstitution,_this.entity,_this.kycStatus,_this.commercialRegisterStatus,_this.hasCommerceRegister,_this.emailVerified,_this.phoneVerified,_this.secretQuestion,_this.hasSecretQuestion,_this.identityComplete,_this.isKycComplete,_this.canBid,_this.isPremium,_this.isBlacklisted]);
}

@override
String toString() {
  final _this = this as ProfileModel;
  return 'ProfileModel(id: ${_this.id}, ninMasked: ${_this.ninMasked}, name: ${_this.name}, firstNameAr: ${_this.firstNameAr}, lastNameAr: ${_this.lastNameAr}, firstNameFr: ${_this.firstNameFr}, lastNameFr: ${_this.lastNameFr}, email: ${_this.email}, phone: ${_this.phone}, address: ${_this.address}, communeId: ${_this.communeId}, postalCode: ${_this.postalCode}, profession: ${_this.profession}, locale: ${_this.locale}, role: ${_this.role}, wilayaId: ${_this.wilayaId}, birthDate: ${_this.birthDate}, birthPlace: ${_this.birthPlace}, fatherName: ${_this.fatherName}, motherName: ${_this.motherName}, motherSurname: ${_this.motherSurname}, expectedIncome: ${_this.expectedIncome}, idCardNumber: ${_this.idCardNumber}, passportNumber: ${_this.passportNumber}, licenseNumber: ${_this.licenseNumber}, rip: ${_this.rip}, nif: ${_this.nif}, nis: ${_this.nis}, accountStatus: ${_this.accountStatus}, accountType: ${_this.accountType}, isInstitution: ${_this.isInstitution}, entity: ${_this.entity}, kycStatus: ${_this.kycStatus}, commercialRegisterStatus: ${_this.commercialRegisterStatus}, hasCommerceRegister: ${_this.hasCommerceRegister}, emailVerified: ${_this.emailVerified}, phoneVerified: ${_this.phoneVerified}, secretQuestion: ${_this.secretQuestion}, hasSecretQuestion: ${_this.hasSecretQuestion}, identityComplete: ${_this.identityComplete}, isKycComplete: ${_this.isKycComplete}, canBid: ${_this.canBid}, isPremium: ${_this.isPremium}, isBlacklisted: ${_this.isBlacklisted})';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'nin_masked') String? ninMasked, String? name,@JsonKey(name: 'first_name_ar') String? firstNameAr,@JsonKey(name: 'last_name_ar') String? lastNameAr,@JsonKey(name: 'first_name_fr') String? firstNameFr,@JsonKey(name: 'last_name_fr') String? lastNameFr, String? email, String? phone, String? address,@JsonKey(name: 'commune_id') int? communeId,@JsonKey(name: 'postal_code') String? postalCode, String? profession, String? locale, String? role,@JsonKey(name: 'wilaya_id') int? wilayaId,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'birth_place') String? birthPlace,@JsonKey(name: 'father_name') String? fatherName,@JsonKey(name: 'mother_name') String? motherName,@JsonKey(name: 'mother_surname') String? motherSurname,@JsonKey(name: 'expected_income') int? expectedIncome,@JsonKey(name: 'id_card_number') String? idCardNumber,@JsonKey(name: 'passport_number') String? passportNumber,@JsonKey(name: 'license_number') String? licenseNumber, String? rip, String? nif, String? nis,@JsonKey(name: 'account_status') String? accountStatus,@JsonKey(name: 'account_type') String? accountType,@JsonKey(name: 'is_institution') bool isInstitution, ProfileEntityRefModel? entity,@JsonKey(name: 'kyc_status') String kycStatus,@JsonKey(name: 'commercial_register_status') String? commercialRegisterStatus,@JsonKey(name: 'has_commerce_register') bool hasCommerceRegister,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'secret_question') String? secretQuestion,@JsonKey(name: 'has_secret_question') bool hasSecretQuestion,@JsonKey(name: 'identity_complete') bool? identityComplete,@JsonKey(name: 'is_kyc_complete') bool isKycComplete,@JsonKey(name: 'can_bid') bool canBid,@JsonKey(name: 'is_premium') bool isPremium,@JsonKey(name: 'is_blacklisted') bool isBlacklisted
});


$ProfileEntityRefModelCopyWith<$Res>? get entity;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ninMasked = freezed,Object? name = freezed,Object? firstNameAr = freezed,Object? lastNameAr = freezed,Object? firstNameFr = freezed,Object? lastNameFr = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? communeId = freezed,Object? postalCode = freezed,Object? profession = freezed,Object? locale = freezed,Object? role = freezed,Object? wilayaId = freezed,Object? birthDate = freezed,Object? birthPlace = freezed,Object? fatherName = freezed,Object? motherName = freezed,Object? motherSurname = freezed,Object? expectedIncome = freezed,Object? idCardNumber = freezed,Object? passportNumber = freezed,Object? licenseNumber = freezed,Object? rip = freezed,Object? nif = freezed,Object? nis = freezed,Object? accountStatus = freezed,Object? accountType = freezed,Object? isInstitution = null,Object? entity = freezed,Object? kycStatus = null,Object? commercialRegisterStatus = freezed,Object? hasCommerceRegister = null,Object? emailVerified = null,Object? phoneVerified = null,Object? secretQuestion = freezed,Object? hasSecretQuestion = null,Object? identityComplete = freezed,Object? isKycComplete = null,Object? canBid = null,Object? isPremium = null,Object? isBlacklisted = null,}) {
  return _then(ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ninMasked: freezed == ninMasked ? _self.ninMasked : ninMasked // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,firstNameAr: freezed == firstNameAr ? _self.firstNameAr : firstNameAr // ignore: cast_nullable_to_non_nullable
as String?,lastNameAr: freezed == lastNameAr ? _self.lastNameAr : lastNameAr // ignore: cast_nullable_to_non_nullable
as String?,firstNameFr: freezed == firstNameFr ? _self.firstNameFr : firstNameFr // ignore: cast_nullable_to_non_nullable
as String?,lastNameFr: freezed == lastNameFr ? _self.lastNameFr : lastNameFr // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,communeId: freezed == communeId ? _self.communeId : communeId // ignore: cast_nullable_to_non_nullable
as int?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,wilayaId: freezed == wilayaId ? _self.wilayaId : wilayaId // ignore: cast_nullable_to_non_nullable
as int?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,birthPlace: freezed == birthPlace ? _self.birthPlace : birthPlace // ignore: cast_nullable_to_non_nullable
as String?,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,motherSurname: freezed == motherSurname ? _self.motherSurname : motherSurname // ignore: cast_nullable_to_non_nullable
as String?,expectedIncome: freezed == expectedIncome ? _self.expectedIncome : expectedIncome // ignore: cast_nullable_to_non_nullable
as int?,idCardNumber: freezed == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as String?,passportNumber: freezed == passportNumber ? _self.passportNumber : passportNumber // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,rip: freezed == rip ? _self.rip : rip // ignore: cast_nullable_to_non_nullable
as String?,nif: freezed == nif ? _self.nif : nif // ignore: cast_nullable_to_non_nullable
as String?,nis: freezed == nis ? _self.nis : nis // ignore: cast_nullable_to_non_nullable
as String?,accountStatus: freezed == accountStatus ? _self.accountStatus : accountStatus // ignore: cast_nullable_to_non_nullable
as String?,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String?,isInstitution: null == isInstitution ? _self.isInstitution : isInstitution // ignore: cast_nullable_to_non_nullable
as bool,entity: freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as ProfileEntityRefModel?,kycStatus: null == kycStatus ? _self.kycStatus : kycStatus // ignore: cast_nullable_to_non_nullable
as String,commercialRegisterStatus: freezed == commercialRegisterStatus ? _self.commercialRegisterStatus : commercialRegisterStatus // ignore: cast_nullable_to_non_nullable
as String?,hasCommerceRegister: null == hasCommerceRegister ? _self.hasCommerceRegister : hasCommerceRegister // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,secretQuestion: freezed == secretQuestion ? _self.secretQuestion : secretQuestion // ignore: cast_nullable_to_non_nullable
as String?,hasSecretQuestion: null == hasSecretQuestion ? _self.hasSecretQuestion : hasSecretQuestion // ignore: cast_nullable_to_non_nullable
as bool,identityComplete: freezed == identityComplete ? _self.identityComplete : identityComplete // ignore: cast_nullable_to_non_nullable
as bool?,isKycComplete: null == isKycComplete ? _self.isKycComplete : isKycComplete // ignore: cast_nullable_to_non_nullable
as bool,canBid: null == canBid ? _self.canBid : canBid // ignore: cast_nullable_to_non_nullable
as bool,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,isBlacklisted: null == isBlacklisted ? _self.isBlacklisted : isBlacklisted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityRefModelCopyWith<$Res>? get entity {
    if (_self.entity == null) {
    return null;
  }

  return $ProfileEntityRefModelCopyWith<$Res>(_self.entity!, (value) {
    return _then(_self.copyWith(entity: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'nin_masked')  String? ninMasked,  String? name, @JsonKey(name: 'first_name_ar')  String? firstNameAr, @JsonKey(name: 'last_name_ar')  String? lastNameAr, @JsonKey(name: 'first_name_fr')  String? firstNameFr, @JsonKey(name: 'last_name_fr')  String? lastNameFr,  String? email,  String? phone,  String? address, @JsonKey(name: 'commune_id')  int? communeId, @JsonKey(name: 'postal_code')  String? postalCode,  String? profession,  String? locale,  String? role, @JsonKey(name: 'wilaya_id')  int? wilayaId, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'birth_place')  String? birthPlace, @JsonKey(name: 'father_name')  String? fatherName, @JsonKey(name: 'mother_name')  String? motherName, @JsonKey(name: 'mother_surname')  String? motherSurname, @JsonKey(name: 'expected_income')  int? expectedIncome, @JsonKey(name: 'id_card_number')  String? idCardNumber, @JsonKey(name: 'passport_number')  String? passportNumber, @JsonKey(name: 'license_number')  String? licenseNumber,  String? rip,  String? nif,  String? nis, @JsonKey(name: 'account_status')  String? accountStatus, @JsonKey(name: 'account_type')  String? accountType, @JsonKey(name: 'is_institution')  bool isInstitution,  ProfileEntityRefModel? entity, @JsonKey(name: 'kyc_status')  String kycStatus, @JsonKey(name: 'commercial_register_status')  String? commercialRegisterStatus, @JsonKey(name: 'has_commerce_register')  bool hasCommerceRegister, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'secret_question')  String? secretQuestion, @JsonKey(name: 'has_secret_question')  bool hasSecretQuestion, @JsonKey(name: 'identity_complete')  bool? identityComplete, @JsonKey(name: 'is_kyc_complete')  bool isKycComplete, @JsonKey(name: 'can_bid')  bool canBid, @JsonKey(name: 'is_premium')  bool isPremium, @JsonKey(name: 'is_blacklisted')  bool isBlacklisted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.ninMasked,_that.name,_that.firstNameAr,_that.lastNameAr,_that.firstNameFr,_that.lastNameFr,_that.email,_that.phone,_that.address,_that.communeId,_that.postalCode,_that.profession,_that.locale,_that.role,_that.wilayaId,_that.birthDate,_that.birthPlace,_that.fatherName,_that.motherName,_that.motherSurname,_that.expectedIncome,_that.idCardNumber,_that.passportNumber,_that.licenseNumber,_that.rip,_that.nif,_that.nis,_that.accountStatus,_that.accountType,_that.isInstitution,_that.entity,_that.kycStatus,_that.commercialRegisterStatus,_that.hasCommerceRegister,_that.emailVerified,_that.phoneVerified,_that.secretQuestion,_that.hasSecretQuestion,_that.identityComplete,_that.isKycComplete,_that.canBid,_that.isPremium,_that.isBlacklisted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'nin_masked')  String? ninMasked,  String? name, @JsonKey(name: 'first_name_ar')  String? firstNameAr, @JsonKey(name: 'last_name_ar')  String? lastNameAr, @JsonKey(name: 'first_name_fr')  String? firstNameFr, @JsonKey(name: 'last_name_fr')  String? lastNameFr,  String? email,  String? phone,  String? address, @JsonKey(name: 'commune_id')  int? communeId, @JsonKey(name: 'postal_code')  String? postalCode,  String? profession,  String? locale,  String? role, @JsonKey(name: 'wilaya_id')  int? wilayaId, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'birth_place')  String? birthPlace, @JsonKey(name: 'father_name')  String? fatherName, @JsonKey(name: 'mother_name')  String? motherName, @JsonKey(name: 'mother_surname')  String? motherSurname, @JsonKey(name: 'expected_income')  int? expectedIncome, @JsonKey(name: 'id_card_number')  String? idCardNumber, @JsonKey(name: 'passport_number')  String? passportNumber, @JsonKey(name: 'license_number')  String? licenseNumber,  String? rip,  String? nif,  String? nis, @JsonKey(name: 'account_status')  String? accountStatus, @JsonKey(name: 'account_type')  String? accountType, @JsonKey(name: 'is_institution')  bool isInstitution,  ProfileEntityRefModel? entity, @JsonKey(name: 'kyc_status')  String kycStatus, @JsonKey(name: 'commercial_register_status')  String? commercialRegisterStatus, @JsonKey(name: 'has_commerce_register')  bool hasCommerceRegister, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'secret_question')  String? secretQuestion, @JsonKey(name: 'has_secret_question')  bool hasSecretQuestion, @JsonKey(name: 'identity_complete')  bool? identityComplete, @JsonKey(name: 'is_kyc_complete')  bool isKycComplete, @JsonKey(name: 'can_bid')  bool canBid, @JsonKey(name: 'is_premium')  bool isPremium, @JsonKey(name: 'is_blacklisted')  bool isBlacklisted)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.ninMasked,_that.name,_that.firstNameAr,_that.lastNameAr,_that.firstNameFr,_that.lastNameFr,_that.email,_that.phone,_that.address,_that.communeId,_that.postalCode,_that.profession,_that.locale,_that.role,_that.wilayaId,_that.birthDate,_that.birthPlace,_that.fatherName,_that.motherName,_that.motherSurname,_that.expectedIncome,_that.idCardNumber,_that.passportNumber,_that.licenseNumber,_that.rip,_that.nif,_that.nis,_that.accountStatus,_that.accountType,_that.isInstitution,_that.entity,_that.kycStatus,_that.commercialRegisterStatus,_that.hasCommerceRegister,_that.emailVerified,_that.phoneVerified,_that.secretQuestion,_that.hasSecretQuestion,_that.identityComplete,_that.isKycComplete,_that.canBid,_that.isPremium,_that.isBlacklisted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'nin_masked')  String? ninMasked,  String? name, @JsonKey(name: 'first_name_ar')  String? firstNameAr, @JsonKey(name: 'last_name_ar')  String? lastNameAr, @JsonKey(name: 'first_name_fr')  String? firstNameFr, @JsonKey(name: 'last_name_fr')  String? lastNameFr,  String? email,  String? phone,  String? address, @JsonKey(name: 'commune_id')  int? communeId, @JsonKey(name: 'postal_code')  String? postalCode,  String? profession,  String? locale,  String? role, @JsonKey(name: 'wilaya_id')  int? wilayaId, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'birth_place')  String? birthPlace, @JsonKey(name: 'father_name')  String? fatherName, @JsonKey(name: 'mother_name')  String? motherName, @JsonKey(name: 'mother_surname')  String? motherSurname, @JsonKey(name: 'expected_income')  int? expectedIncome, @JsonKey(name: 'id_card_number')  String? idCardNumber, @JsonKey(name: 'passport_number')  String? passportNumber, @JsonKey(name: 'license_number')  String? licenseNumber,  String? rip,  String? nif,  String? nis, @JsonKey(name: 'account_status')  String? accountStatus, @JsonKey(name: 'account_type')  String? accountType, @JsonKey(name: 'is_institution')  bool isInstitution,  ProfileEntityRefModel? entity, @JsonKey(name: 'kyc_status')  String kycStatus, @JsonKey(name: 'commercial_register_status')  String? commercialRegisterStatus, @JsonKey(name: 'has_commerce_register')  bool hasCommerceRegister, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'secret_question')  String? secretQuestion, @JsonKey(name: 'has_secret_question')  bool hasSecretQuestion, @JsonKey(name: 'identity_complete')  bool? identityComplete, @JsonKey(name: 'is_kyc_complete')  bool isKycComplete, @JsonKey(name: 'can_bid')  bool canBid, @JsonKey(name: 'is_premium')  bool isPremium, @JsonKey(name: 'is_blacklisted')  bool isBlacklisted)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.ninMasked,_that.name,_that.firstNameAr,_that.lastNameAr,_that.firstNameFr,_that.lastNameFr,_that.email,_that.phone,_that.address,_that.communeId,_that.postalCode,_that.profession,_that.locale,_that.role,_that.wilayaId,_that.birthDate,_that.birthPlace,_that.fatherName,_that.motherName,_that.motherSurname,_that.expectedIncome,_that.idCardNumber,_that.passportNumber,_that.licenseNumber,_that.rip,_that.nif,_that.nis,_that.accountStatus,_that.accountType,_that.isInstitution,_that.entity,_that.kycStatus,_that.commercialRegisterStatus,_that.hasCommerceRegister,_that.emailVerified,_that.phoneVerified,_that.secretQuestion,_that.hasSecretQuestion,_that.identityComplete,_that.isKycComplete,_that.canBid,_that.isPremium,_that.isBlacklisted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({required this.id, @JsonKey(name: 'nin_masked') this.ninMasked, this.name, @JsonKey(name: 'first_name_ar') this.firstNameAr, @JsonKey(name: 'last_name_ar') this.lastNameAr, @JsonKey(name: 'first_name_fr') this.firstNameFr, @JsonKey(name: 'last_name_fr') this.lastNameFr, this.email, this.phone, this.address, @JsonKey(name: 'commune_id') this.communeId, @JsonKey(name: 'postal_code') this.postalCode, this.profession, this.locale, this.role, @JsonKey(name: 'wilaya_id') this.wilayaId, @JsonKey(name: 'birth_date') this.birthDate, @JsonKey(name: 'birth_place') this.birthPlace, @JsonKey(name: 'father_name') this.fatherName, @JsonKey(name: 'mother_name') this.motherName, @JsonKey(name: 'mother_surname') this.motherSurname, @JsonKey(name: 'expected_income') this.expectedIncome, @JsonKey(name: 'id_card_number') this.idCardNumber, @JsonKey(name: 'passport_number') this.passportNumber, @JsonKey(name: 'license_number') this.licenseNumber, this.rip, this.nif, this.nis, @JsonKey(name: 'account_status') this.accountStatus, @JsonKey(name: 'account_type') this.accountType, @JsonKey(name: 'is_institution') this.isInstitution = false, this.entity, @JsonKey(name: 'kyc_status') this.kycStatus = 'PENDING', @JsonKey(name: 'commercial_register_status') this.commercialRegisterStatus, @JsonKey(name: 'has_commerce_register') this.hasCommerceRegister = false, @JsonKey(name: 'email_verified') this.emailVerified = false, @JsonKey(name: 'phone_verified') this.phoneVerified = false, @JsonKey(name: 'secret_question') this.secretQuestion, @JsonKey(name: 'has_secret_question') this.hasSecretQuestion = false, @JsonKey(name: 'identity_complete') this.identityComplete, @JsonKey(name: 'is_kyc_complete') this.isKycComplete = false, @JsonKey(name: 'can_bid') this.canBid = false, @JsonKey(name: 'is_premium') this.isPremium = false, @JsonKey(name: 'is_blacklisted') this.isBlacklisted = false}): super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'nin_masked') final  String? ninMasked;
@override final  String? name;
@override@JsonKey(name: 'first_name_ar') final  String? firstNameAr;
@override@JsonKey(name: 'last_name_ar') final  String? lastNameAr;
@override@JsonKey(name: 'first_name_fr') final  String? firstNameFr;
@override@JsonKey(name: 'last_name_fr') final  String? lastNameFr;
@override final  String? email;
@override final  String? phone;
@override final  String? address;
@override@JsonKey(name: 'commune_id') final  int? communeId;
@override@JsonKey(name: 'postal_code') final  String? postalCode;
@override final  String? profession;
@override final  String? locale;
@override final  String? role;
@override@JsonKey(name: 'wilaya_id') final  int? wilayaId;
@override@JsonKey(name: 'birth_date') final  String? birthDate;
@override@JsonKey(name: 'birth_place') final  String? birthPlace;
@override@JsonKey(name: 'father_name') final  String? fatherName;
@override@JsonKey(name: 'mother_name') final  String? motherName;
@override@JsonKey(name: 'mother_surname') final  String? motherSurname;
@override@JsonKey(name: 'expected_income') final  int? expectedIncome;
@override@JsonKey(name: 'id_card_number') final  String? idCardNumber;
@override@JsonKey(name: 'passport_number') final  String? passportNumber;
@override@JsonKey(name: 'license_number') final  String? licenseNumber;
@override final  String? rip;
@override final  String? nif;
@override final  String? nis;
@override@JsonKey(name: 'account_status') final  String? accountStatus;
@override@JsonKey(name: 'account_type') final  String? accountType;
@override@JsonKey(name: 'is_institution') final  bool isInstitution;
@override final  ProfileEntityRefModel? entity;
@override@JsonKey(name: 'kyc_status') final  String kycStatus;
@override@JsonKey(name: 'commercial_register_status') final  String? commercialRegisterStatus;
@override@JsonKey(name: 'has_commerce_register') final  bool hasCommerceRegister;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;
@override@JsonKey(name: 'phone_verified') final  bool phoneVerified;
@override@JsonKey(name: 'secret_question') final  String? secretQuestion;
@override@JsonKey(name: 'has_secret_question') final  bool hasSecretQuestion;
@override@JsonKey(name: 'identity_complete') final  bool? identityComplete;
@override@JsonKey(name: 'is_kyc_complete') final  bool isKycComplete;
@override@JsonKey(name: 'can_bid') final  bool canBid;
@override@JsonKey(name: 'is_premium') final  bool isPremium;
@override@JsonKey(name: 'is_blacklisted') final  bool isBlacklisted;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ninMasked, ninMasked) || other.ninMasked == ninMasked)&&(identical(other.name, name) || other.name == name)&&(identical(other.firstNameAr, firstNameAr) || other.firstNameAr == firstNameAr)&&(identical(other.lastNameAr, lastNameAr) || other.lastNameAr == lastNameAr)&&(identical(other.firstNameFr, firstNameFr) || other.firstNameFr == firstNameFr)&&(identical(other.lastNameFr, lastNameFr) || other.lastNameFr == lastNameFr)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.communeId, communeId) || other.communeId == communeId)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.role, role) || other.role == role)&&(identical(other.wilayaId, wilayaId) || other.wilayaId == wilayaId)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.birthPlace, birthPlace) || other.birthPlace == birthPlace)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.motherSurname, motherSurname) || other.motherSurname == motherSurname)&&(identical(other.expectedIncome, expectedIncome) || other.expectedIncome == expectedIncome)&&(identical(other.idCardNumber, idCardNumber) || other.idCardNumber == idCardNumber)&&(identical(other.passportNumber, passportNumber) || other.passportNumber == passportNumber)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.rip, rip) || other.rip == rip)&&(identical(other.nif, nif) || other.nif == nif)&&(identical(other.nis, nis) || other.nis == nis)&&(identical(other.accountStatus, accountStatus) || other.accountStatus == accountStatus)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.isInstitution, isInstitution) || other.isInstitution == isInstitution)&&(identical(other.entity, entity) || other.entity == entity)&&(identical(other.kycStatus, kycStatus) || other.kycStatus == kycStatus)&&(identical(other.commercialRegisterStatus, commercialRegisterStatus) || other.commercialRegisterStatus == commercialRegisterStatus)&&(identical(other.hasCommerceRegister, hasCommerceRegister) || other.hasCommerceRegister == hasCommerceRegister)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.secretQuestion, secretQuestion) || other.secretQuestion == secretQuestion)&&(identical(other.hasSecretQuestion, hasSecretQuestion) || other.hasSecretQuestion == hasSecretQuestion)&&(identical(other.identityComplete, identityComplete) || other.identityComplete == identityComplete)&&(identical(other.isKycComplete, isKycComplete) || other.isKycComplete == isKycComplete)&&(identical(other.canBid, canBid) || other.canBid == canBid)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.isBlacklisted, isBlacklisted) || other.isBlacklisted == isBlacklisted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,ninMasked,name,firstNameAr,lastNameAr,firstNameFr,lastNameFr,email,phone,address,communeId,postalCode,profession,locale,role,wilayaId,birthDate,birthPlace,fatherName,motherName,motherSurname,expectedIncome,idCardNumber,passportNumber,licenseNumber,rip,nif,nis,accountStatus,accountType,isInstitution,entity,kycStatus,commercialRegisterStatus,hasCommerceRegister,emailVerified,phoneVerified,secretQuestion,hasSecretQuestion,identityComplete,isKycComplete,canBid,isPremium,isBlacklisted]);
}

@override
String toString() {
    return 'ProfileModel(id: $id, ninMasked: $ninMasked, name: $name, firstNameAr: $firstNameAr, lastNameAr: $lastNameAr, firstNameFr: $firstNameFr, lastNameFr: $lastNameFr, email: $email, phone: $phone, address: $address, communeId: $communeId, postalCode: $postalCode, profession: $profession, locale: $locale, role: $role, wilayaId: $wilayaId, birthDate: $birthDate, birthPlace: $birthPlace, fatherName: $fatherName, motherName: $motherName, motherSurname: $motherSurname, expectedIncome: $expectedIncome, idCardNumber: $idCardNumber, passportNumber: $passportNumber, licenseNumber: $licenseNumber, rip: $rip, nif: $nif, nis: $nis, accountStatus: $accountStatus, accountType: $accountType, isInstitution: $isInstitution, entity: $entity, kycStatus: $kycStatus, commercialRegisterStatus: $commercialRegisterStatus, hasCommerceRegister: $hasCommerceRegister, emailVerified: $emailVerified, phoneVerified: $phoneVerified, secretQuestion: $secretQuestion, hasSecretQuestion: $hasSecretQuestion, identityComplete: $identityComplete, isKycComplete: $isKycComplete, canBid: $canBid, isPremium: $isPremium, isBlacklisted: $isBlacklisted)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'nin_masked') String? ninMasked, String? name,@JsonKey(name: 'first_name_ar') String? firstNameAr,@JsonKey(name: 'last_name_ar') String? lastNameAr,@JsonKey(name: 'first_name_fr') String? firstNameFr,@JsonKey(name: 'last_name_fr') String? lastNameFr, String? email, String? phone, String? address,@JsonKey(name: 'commune_id') int? communeId,@JsonKey(name: 'postal_code') String? postalCode, String? profession, String? locale, String? role,@JsonKey(name: 'wilaya_id') int? wilayaId,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'birth_place') String? birthPlace,@JsonKey(name: 'father_name') String? fatherName,@JsonKey(name: 'mother_name') String? motherName,@JsonKey(name: 'mother_surname') String? motherSurname,@JsonKey(name: 'expected_income') int? expectedIncome,@JsonKey(name: 'id_card_number') String? idCardNumber,@JsonKey(name: 'passport_number') String? passportNumber,@JsonKey(name: 'license_number') String? licenseNumber, String? rip, String? nif, String? nis,@JsonKey(name: 'account_status') String? accountStatus,@JsonKey(name: 'account_type') String? accountType,@JsonKey(name: 'is_institution') bool isInstitution, ProfileEntityRefModel? entity,@JsonKey(name: 'kyc_status') String kycStatus,@JsonKey(name: 'commercial_register_status') String? commercialRegisterStatus,@JsonKey(name: 'has_commerce_register') bool hasCommerceRegister,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'secret_question') String? secretQuestion,@JsonKey(name: 'has_secret_question') bool hasSecretQuestion,@JsonKey(name: 'identity_complete') bool? identityComplete,@JsonKey(name: 'is_kyc_complete') bool isKycComplete,@JsonKey(name: 'can_bid') bool canBid,@JsonKey(name: 'is_premium') bool isPremium,@JsonKey(name: 'is_blacklisted') bool isBlacklisted
});


@override $ProfileEntityRefModelCopyWith<$Res>? get entity;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ninMasked = freezed,Object? name = freezed,Object? firstNameAr = freezed,Object? lastNameAr = freezed,Object? firstNameFr = freezed,Object? lastNameFr = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? communeId = freezed,Object? postalCode = freezed,Object? profession = freezed,Object? locale = freezed,Object? role = freezed,Object? wilayaId = freezed,Object? birthDate = freezed,Object? birthPlace = freezed,Object? fatherName = freezed,Object? motherName = freezed,Object? motherSurname = freezed,Object? expectedIncome = freezed,Object? idCardNumber = freezed,Object? passportNumber = freezed,Object? licenseNumber = freezed,Object? rip = freezed,Object? nif = freezed,Object? nis = freezed,Object? accountStatus = freezed,Object? accountType = freezed,Object? isInstitution = null,Object? entity = freezed,Object? kycStatus = null,Object? commercialRegisterStatus = freezed,Object? hasCommerceRegister = null,Object? emailVerified = null,Object? phoneVerified = null,Object? secretQuestion = freezed,Object? hasSecretQuestion = null,Object? identityComplete = freezed,Object? isKycComplete = null,Object? canBid = null,Object? isPremium = null,Object? isBlacklisted = null,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ninMasked: freezed == ninMasked ? _self.ninMasked : ninMasked // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,firstNameAr: freezed == firstNameAr ? _self.firstNameAr : firstNameAr // ignore: cast_nullable_to_non_nullable
as String?,lastNameAr: freezed == lastNameAr ? _self.lastNameAr : lastNameAr // ignore: cast_nullable_to_non_nullable
as String?,firstNameFr: freezed == firstNameFr ? _self.firstNameFr : firstNameFr // ignore: cast_nullable_to_non_nullable
as String?,lastNameFr: freezed == lastNameFr ? _self.lastNameFr : lastNameFr // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,communeId: freezed == communeId ? _self.communeId : communeId // ignore: cast_nullable_to_non_nullable
as int?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,wilayaId: freezed == wilayaId ? _self.wilayaId : wilayaId // ignore: cast_nullable_to_non_nullable
as int?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,birthPlace: freezed == birthPlace ? _self.birthPlace : birthPlace // ignore: cast_nullable_to_non_nullable
as String?,fatherName: freezed == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String?,motherName: freezed == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String?,motherSurname: freezed == motherSurname ? _self.motherSurname : motherSurname // ignore: cast_nullable_to_non_nullable
as String?,expectedIncome: freezed == expectedIncome ? _self.expectedIncome : expectedIncome // ignore: cast_nullable_to_non_nullable
as int?,idCardNumber: freezed == idCardNumber ? _self.idCardNumber : idCardNumber // ignore: cast_nullable_to_non_nullable
as String?,passportNumber: freezed == passportNumber ? _self.passportNumber : passportNumber // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,rip: freezed == rip ? _self.rip : rip // ignore: cast_nullable_to_non_nullable
as String?,nif: freezed == nif ? _self.nif : nif // ignore: cast_nullable_to_non_nullable
as String?,nis: freezed == nis ? _self.nis : nis // ignore: cast_nullable_to_non_nullable
as String?,accountStatus: freezed == accountStatus ? _self.accountStatus : accountStatus // ignore: cast_nullable_to_non_nullable
as String?,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String?,isInstitution: null == isInstitution ? _self.isInstitution : isInstitution // ignore: cast_nullable_to_non_nullable
as bool,entity: freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as ProfileEntityRefModel?,kycStatus: null == kycStatus ? _self.kycStatus : kycStatus // ignore: cast_nullable_to_non_nullable
as String,commercialRegisterStatus: freezed == commercialRegisterStatus ? _self.commercialRegisterStatus : commercialRegisterStatus // ignore: cast_nullable_to_non_nullable
as String?,hasCommerceRegister: null == hasCommerceRegister ? _self.hasCommerceRegister : hasCommerceRegister // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,secretQuestion: freezed == secretQuestion ? _self.secretQuestion : secretQuestion // ignore: cast_nullable_to_non_nullable
as String?,hasSecretQuestion: null == hasSecretQuestion ? _self.hasSecretQuestion : hasSecretQuestion // ignore: cast_nullable_to_non_nullable
as bool,identityComplete: freezed == identityComplete ? _self.identityComplete : identityComplete // ignore: cast_nullable_to_non_nullable
as bool?,isKycComplete: null == isKycComplete ? _self.isKycComplete : isKycComplete // ignore: cast_nullable_to_non_nullable
as bool,canBid: null == canBid ? _self.canBid : canBid // ignore: cast_nullable_to_non_nullable
as bool,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,isBlacklisted: null == isBlacklisted ? _self.isBlacklisted : isBlacklisted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityRefModelCopyWith<$Res>? get entity {
    if (_self.entity == null) {
    return null;
  }

  return $ProfileEntityRefModelCopyWith<$Res>(_self.entity!, (value) {
    return _then(_self.copyWith(entity: value));
  });
}
}

// dart format on
