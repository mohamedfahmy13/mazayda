// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KycSubmitParams {

 String? get nin; String? get birthDate; String get firstNameFr; String get lastNameFr; String get fatherName; String get motherName; String get motherSurname; String get address; int get wilayaId; int get communeId; String get postalCode; String get profession; int get expectedIncome; String get idType; String get idNumber;
/// Create a copy of KycSubmitParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycSubmitParamsCopyWith<KycSubmitParams> get copyWith => _$KycSubmitParamsCopyWithImpl<KycSubmitParams>(this as KycSubmitParams, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as KycSubmitParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycSubmitParams&&(identical(other.nin, _this.nin) || other.nin == _this.nin)&&(identical(other.birthDate, _this.birthDate) || other.birthDate == _this.birthDate)&&(identical(other.firstNameFr, _this.firstNameFr) || other.firstNameFr == _this.firstNameFr)&&(identical(other.lastNameFr, _this.lastNameFr) || other.lastNameFr == _this.lastNameFr)&&(identical(other.fatherName, _this.fatherName) || other.fatherName == _this.fatherName)&&(identical(other.motherName, _this.motherName) || other.motherName == _this.motherName)&&(identical(other.motherSurname, _this.motherSurname) || other.motherSurname == _this.motherSurname)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.wilayaId, _this.wilayaId) || other.wilayaId == _this.wilayaId)&&(identical(other.communeId, _this.communeId) || other.communeId == _this.communeId)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.profession, _this.profession) || other.profession == _this.profession)&&(identical(other.expectedIncome, _this.expectedIncome) || other.expectedIncome == _this.expectedIncome)&&(identical(other.idType, _this.idType) || other.idType == _this.idType)&&(identical(other.idNumber, _this.idNumber) || other.idNumber == _this.idNumber));
}


@override
int get hashCode {
  final _this = this as KycSubmitParams;
  return Object.hash(runtimeType,_this.nin,_this.birthDate,_this.firstNameFr,_this.lastNameFr,_this.fatherName,_this.motherName,_this.motherSurname,_this.address,_this.wilayaId,_this.communeId,_this.postalCode,_this.profession,_this.expectedIncome,_this.idType,_this.idNumber);
}

@override
String toString() {
  final _this = this as KycSubmitParams;
  return 'KycSubmitParams(nin: ${_this.nin}, birthDate: ${_this.birthDate}, firstNameFr: ${_this.firstNameFr}, lastNameFr: ${_this.lastNameFr}, fatherName: ${_this.fatherName}, motherName: ${_this.motherName}, motherSurname: ${_this.motherSurname}, address: ${_this.address}, wilayaId: ${_this.wilayaId}, communeId: ${_this.communeId}, postalCode: ${_this.postalCode}, profession: ${_this.profession}, expectedIncome: ${_this.expectedIncome}, idType: ${_this.idType}, idNumber: ${_this.idNumber})';
}


}

/// @nodoc
abstract mixin class $KycSubmitParamsCopyWith<$Res>  {
  factory $KycSubmitParamsCopyWith(KycSubmitParams value, $Res Function(KycSubmitParams) _then) = _$KycSubmitParamsCopyWithImpl;
@useResult
$Res call({
 String? nin, String? birthDate, String firstNameFr, String lastNameFr, String fatherName, String motherName, String motherSurname, String address, int wilayaId, int communeId, String postalCode, String profession, int expectedIncome, String idType, String idNumber
});




}
/// @nodoc
class _$KycSubmitParamsCopyWithImpl<$Res>
    implements $KycSubmitParamsCopyWith<$Res> {
  _$KycSubmitParamsCopyWithImpl(this._self, this._then);

  final KycSubmitParams _self;
  final $Res Function(KycSubmitParams) _then;

/// Create a copy of KycSubmitParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nin = freezed,Object? birthDate = freezed,Object? firstNameFr = null,Object? lastNameFr = null,Object? fatherName = null,Object? motherName = null,Object? motherSurname = null,Object? address = null,Object? wilayaId = null,Object? communeId = null,Object? postalCode = null,Object? profession = null,Object? expectedIncome = null,Object? idType = null,Object? idNumber = null,}) {
  return _then(KycSubmitParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,firstNameFr: null == firstNameFr ? _self.firstNameFr : firstNameFr // ignore: cast_nullable_to_non_nullable
as String,lastNameFr: null == lastNameFr ? _self.lastNameFr : lastNameFr // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,motherSurname: null == motherSurname ? _self.motherSurname : motherSurname // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,wilayaId: null == wilayaId ? _self.wilayaId : wilayaId // ignore: cast_nullable_to_non_nullable
as int,communeId: null == communeId ? _self.communeId : communeId // ignore: cast_nullable_to_non_nullable
as int,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,profession: null == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String,expectedIncome: null == expectedIncome ? _self.expectedIncome : expectedIncome // ignore: cast_nullable_to_non_nullable
as int,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KycSubmitParams].
extension KycSubmitParamsPatterns on KycSubmitParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KycSubmitParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KycSubmitParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KycSubmitParams value)  $default,){
final _that = this;
switch (_that) {
case _KycSubmitParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KycSubmitParams value)?  $default,){
final _that = this;
switch (_that) {
case _KycSubmitParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nin,  String? birthDate,  String firstNameFr,  String lastNameFr,  String fatherName,  String motherName,  String motherSurname,  String address,  int wilayaId,  int communeId,  String postalCode,  String profession,  int expectedIncome,  String idType,  String idNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KycSubmitParams() when $default != null:
return $default(_that.nin,_that.birthDate,_that.firstNameFr,_that.lastNameFr,_that.fatherName,_that.motherName,_that.motherSurname,_that.address,_that.wilayaId,_that.communeId,_that.postalCode,_that.profession,_that.expectedIncome,_that.idType,_that.idNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nin,  String? birthDate,  String firstNameFr,  String lastNameFr,  String fatherName,  String motherName,  String motherSurname,  String address,  int wilayaId,  int communeId,  String postalCode,  String profession,  int expectedIncome,  String idType,  String idNumber)  $default,) {final _that = this;
switch (_that) {
case _KycSubmitParams():
return $default(_that.nin,_that.birthDate,_that.firstNameFr,_that.lastNameFr,_that.fatherName,_that.motherName,_that.motherSurname,_that.address,_that.wilayaId,_that.communeId,_that.postalCode,_that.profession,_that.expectedIncome,_that.idType,_that.idNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nin,  String? birthDate,  String firstNameFr,  String lastNameFr,  String fatherName,  String motherName,  String motherSurname,  String address,  int wilayaId,  int communeId,  String postalCode,  String profession,  int expectedIncome,  String idType,  String idNumber)?  $default,) {final _that = this;
switch (_that) {
case _KycSubmitParams() when $default != null:
return $default(_that.nin,_that.birthDate,_that.firstNameFr,_that.lastNameFr,_that.fatherName,_that.motherName,_that.motherSurname,_that.address,_that.wilayaId,_that.communeId,_that.postalCode,_that.profession,_that.expectedIncome,_that.idType,_that.idNumber);case _:
  return null;

}
}

}

/// @nodoc


class _KycSubmitParams implements KycSubmitParams {
  const _KycSubmitParams({this.nin, this.birthDate, required this.firstNameFr, required this.lastNameFr, required this.fatherName, required this.motherName, required this.motherSurname, required this.address, required this.wilayaId, required this.communeId, required this.postalCode, required this.profession, required this.expectedIncome, this.idType = 'ID_CARD', required this.idNumber});
  

@override final  String? nin;
@override final  String? birthDate;
@override final  String firstNameFr;
@override final  String lastNameFr;
@override final  String fatherName;
@override final  String motherName;
@override final  String motherSurname;
@override final  String address;
@override final  int wilayaId;
@override final  int communeId;
@override final  String postalCode;
@override final  String profession;
@override final  int expectedIncome;
@override@JsonKey() final  String idType;
@override final  String idNumber;

/// Create a copy of KycSubmitParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KycSubmitParamsCopyWith<_KycSubmitParams> get copyWith => __$KycSubmitParamsCopyWithImpl<_KycSubmitParams>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KycSubmitParams&&(identical(other.nin, nin) || other.nin == nin)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.firstNameFr, firstNameFr) || other.firstNameFr == firstNameFr)&&(identical(other.lastNameFr, lastNameFr) || other.lastNameFr == lastNameFr)&&(identical(other.fatherName, fatherName) || other.fatherName == fatherName)&&(identical(other.motherName, motherName) || other.motherName == motherName)&&(identical(other.motherSurname, motherSurname) || other.motherSurname == motherSurname)&&(identical(other.address, address) || other.address == address)&&(identical(other.wilayaId, wilayaId) || other.wilayaId == wilayaId)&&(identical(other.communeId, communeId) || other.communeId == communeId)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.expectedIncome, expectedIncome) || other.expectedIncome == expectedIncome)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nin,birthDate,firstNameFr,lastNameFr,fatherName,motherName,motherSurname,address,wilayaId,communeId,postalCode,profession,expectedIncome,idType,idNumber);
}

@override
String toString() {
    return 'KycSubmitParams(nin: $nin, birthDate: $birthDate, firstNameFr: $firstNameFr, lastNameFr: $lastNameFr, fatherName: $fatherName, motherName: $motherName, motherSurname: $motherSurname, address: $address, wilayaId: $wilayaId, communeId: $communeId, postalCode: $postalCode, profession: $profession, expectedIncome: $expectedIncome, idType: $idType, idNumber: $idNumber)';
}


}

/// @nodoc
abstract mixin class _$KycSubmitParamsCopyWith<$Res> implements $KycSubmitParamsCopyWith<$Res> {
  factory _$KycSubmitParamsCopyWith(_KycSubmitParams value, $Res Function(_KycSubmitParams) _then) = __$KycSubmitParamsCopyWithImpl;
@override @useResult
$Res call({
 String? nin, String? birthDate, String firstNameFr, String lastNameFr, String fatherName, String motherName, String motherSurname, String address, int wilayaId, int communeId, String postalCode, String profession, int expectedIncome, String idType, String idNumber
});




}
/// @nodoc
class __$KycSubmitParamsCopyWithImpl<$Res>
    implements _$KycSubmitParamsCopyWith<$Res> {
  __$KycSubmitParamsCopyWithImpl(this._self, this._then);

  final _KycSubmitParams _self;
  final $Res Function(_KycSubmitParams) _then;

/// Create a copy of KycSubmitParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nin = freezed,Object? birthDate = freezed,Object? firstNameFr = null,Object? lastNameFr = null,Object? fatherName = null,Object? motherName = null,Object? motherSurname = null,Object? address = null,Object? wilayaId = null,Object? communeId = null,Object? postalCode = null,Object? profession = null,Object? expectedIncome = null,Object? idType = null,Object? idNumber = null,}) {
  return _then(_KycSubmitParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,firstNameFr: null == firstNameFr ? _self.firstNameFr : firstNameFr // ignore: cast_nullable_to_non_nullable
as String,lastNameFr: null == lastNameFr ? _self.lastNameFr : lastNameFr // ignore: cast_nullable_to_non_nullable
as String,fatherName: null == fatherName ? _self.fatherName : fatherName // ignore: cast_nullable_to_non_nullable
as String,motherName: null == motherName ? _self.motherName : motherName // ignore: cast_nullable_to_non_nullable
as String,motherSurname: null == motherSurname ? _self.motherSurname : motherSurname // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,wilayaId: null == wilayaId ? _self.wilayaId : wilayaId // ignore: cast_nullable_to_non_nullable
as int,communeId: null == communeId ? _self.communeId : communeId // ignore: cast_nullable_to_non_nullable
as int,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,profession: null == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String,expectedIncome: null == expectedIncome ? _self.expectedIncome : expectedIncome // ignore: cast_nullable_to_non_nullable
as int,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
