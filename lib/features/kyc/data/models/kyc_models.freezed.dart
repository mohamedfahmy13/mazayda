// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KycStatusModel {

 String? get status;@JsonKey(name: 'documents_on_file') List<String> get documentsOnFile;@JsonKey(name: 'documents') Map<String, dynamic> get documents;@JsonKey(name: 'can_submit') bool get canSubmit;
/// Create a copy of KycStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycStatusModelCopyWith<KycStatusModel> get copyWith => _$KycStatusModelCopyWithImpl<KycStatusModel>(this as KycStatusModel, _$identity);

  /// Serializes this KycStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as KycStatusModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycStatusModel&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.documentsOnFile, _this.documentsOnFile)&&const DeepCollectionEquality().equals(other.documents, _this.documents)&&(identical(other.canSubmit, _this.canSubmit) || other.canSubmit == _this.canSubmit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as KycStatusModel;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.documentsOnFile),const DeepCollectionEquality().hash(_this.documents),_this.canSubmit);
}

@override
String toString() {
  final _this = this as KycStatusModel;
  return 'KycStatusModel(status: ${_this.status}, documentsOnFile: ${_this.documentsOnFile}, documents: ${_this.documents}, canSubmit: ${_this.canSubmit})';
}


}

/// @nodoc
abstract mixin class $KycStatusModelCopyWith<$Res>  {
  factory $KycStatusModelCopyWith(KycStatusModel value, $Res Function(KycStatusModel) _then) = _$KycStatusModelCopyWithImpl;
@useResult
$Res call({
 String? status,@JsonKey(name: 'documents_on_file') List<String> documentsOnFile,@JsonKey(name: 'documents') Map<String, dynamic> documents,@JsonKey(name: 'can_submit') bool canSubmit
});




}
/// @nodoc
class _$KycStatusModelCopyWithImpl<$Res>
    implements $KycStatusModelCopyWith<$Res> {
  _$KycStatusModelCopyWithImpl(this._self, this._then);

  final KycStatusModel _self;
  final $Res Function(KycStatusModel) _then;

/// Create a copy of KycStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? documentsOnFile = null,Object? documents = null,Object? canSubmit = null,}) {
  return _then(KycStatusModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,documentsOnFile: null == documentsOnFile ? _self.documentsOnFile : documentsOnFile // ignore: cast_nullable_to_non_nullable
as List<String>,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [KycStatusModel].
extension KycStatusModelPatterns on KycStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KycStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KycStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KycStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _KycStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KycStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _KycStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status, @JsonKey(name: 'documents_on_file')  List<String> documentsOnFile, @JsonKey(name: 'documents')  Map<String, dynamic> documents, @JsonKey(name: 'can_submit')  bool canSubmit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KycStatusModel() when $default != null:
return $default(_that.status,_that.documentsOnFile,_that.documents,_that.canSubmit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status, @JsonKey(name: 'documents_on_file')  List<String> documentsOnFile, @JsonKey(name: 'documents')  Map<String, dynamic> documents, @JsonKey(name: 'can_submit')  bool canSubmit)  $default,) {final _that = this;
switch (_that) {
case _KycStatusModel():
return $default(_that.status,_that.documentsOnFile,_that.documents,_that.canSubmit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status, @JsonKey(name: 'documents_on_file')  List<String> documentsOnFile, @JsonKey(name: 'documents')  Map<String, dynamic> documents, @JsonKey(name: 'can_submit')  bool canSubmit)?  $default,) {final _that = this;
switch (_that) {
case _KycStatusModel() when $default != null:
return $default(_that.status,_that.documentsOnFile,_that.documents,_that.canSubmit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KycStatusModel extends KycStatusModel {
  const _KycStatusModel({this.status, @JsonKey(name: 'documents_on_file')  List<String> documentsOnFile = const <String>[], @JsonKey(name: 'documents')  Map<String, dynamic> documents = const <String, dynamic>{}, @JsonKey(name: 'can_submit') this.canSubmit = false}): _documentsOnFile = documentsOnFile,_documents = documents,super._();
  factory _KycStatusModel.fromJson(Map<String, dynamic> json) => _$KycStatusModelFromJson(json);

@override final  String? status;
 final  List<String> _documentsOnFile;
@override@JsonKey(name: 'documents_on_file') List<String> get documentsOnFile {
  if (_documentsOnFile is EqualUnmodifiableListView) return _documentsOnFile;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documentsOnFile);
}

 final  Map<String, dynamic> _documents;
@override@JsonKey(name: 'documents') Map<String, dynamic> get documents {
  if (_documents is EqualUnmodifiableMapView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_documents);
}

@override@JsonKey(name: 'can_submit') final  bool canSubmit;

/// Create a copy of KycStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KycStatusModelCopyWith<_KycStatusModel> get copyWith => __$KycStatusModelCopyWithImpl<_KycStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KycStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KycStatusModel&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.documentsOnFile, _documentsOnFile)&&const DeepCollectionEquality().equals(other.documents, _documents)&&(identical(other.canSubmit, canSubmit) || other.canSubmit == canSubmit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_documentsOnFile),const DeepCollectionEquality().hash(_documents),canSubmit);
}

@override
String toString() {
    return 'KycStatusModel(status: $status, documentsOnFile: $documentsOnFile, documents: $documents, canSubmit: $canSubmit)';
}


}

/// @nodoc
abstract mixin class _$KycStatusModelCopyWith<$Res> implements $KycStatusModelCopyWith<$Res> {
  factory _$KycStatusModelCopyWith(_KycStatusModel value, $Res Function(_KycStatusModel) _then) = __$KycStatusModelCopyWithImpl;
@override @useResult
$Res call({
 String? status,@JsonKey(name: 'documents_on_file') List<String> documentsOnFile,@JsonKey(name: 'documents') Map<String, dynamic> documents,@JsonKey(name: 'can_submit') bool canSubmit
});




}
/// @nodoc
class __$KycStatusModelCopyWithImpl<$Res>
    implements _$KycStatusModelCopyWith<$Res> {
  __$KycStatusModelCopyWithImpl(this._self, this._then);

  final _KycStatusModel _self;
  final $Res Function(_KycStatusModel) _then;

/// Create a copy of KycStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? documentsOnFile = null,Object? documents = null,Object? canSubmit = null,}) {
  return _then(_KycStatusModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,documentsOnFile: null == documentsOnFile ? _self._documentsOnFile : documentsOnFile // ignore: cast_nullable_to_non_nullable
as List<String>,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$WilayaModel {

 int get id; String get code;@JsonKey(name: 'name_ar') String? get nameAr;@JsonKey(name: 'name_fr') String? get nameFr;@JsonKey(name: 'name_en') String? get nameEn;
/// Create a copy of WilayaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WilayaModelCopyWith<WilayaModel> get copyWith => _$WilayaModelCopyWithImpl<WilayaModel>(this as WilayaModel, _$identity);

  /// Serializes this WilayaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WilayaModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WilayaModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.nameAr, _this.nameAr) || other.nameAr == _this.nameAr)&&(identical(other.nameFr, _this.nameFr) || other.nameFr == _this.nameFr)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WilayaModel;
  return Object.hash(runtimeType,_this.id,_this.code,_this.nameAr,_this.nameFr,_this.nameEn);
}

@override
String toString() {
  final _this = this as WilayaModel;
  return 'WilayaModel(id: ${_this.id}, code: ${_this.code}, nameAr: ${_this.nameAr}, nameFr: ${_this.nameFr}, nameEn: ${_this.nameEn})';
}


}

/// @nodoc
abstract mixin class $WilayaModelCopyWith<$Res>  {
  factory $WilayaModelCopyWith(WilayaModel value, $Res Function(WilayaModel) _then) = _$WilayaModelCopyWithImpl;
@useResult
$Res call({
 int id, String code,@JsonKey(name: 'name_ar') String? nameAr,@JsonKey(name: 'name_fr') String? nameFr,@JsonKey(name: 'name_en') String? nameEn
});




}
/// @nodoc
class _$WilayaModelCopyWithImpl<$Res>
    implements $WilayaModelCopyWith<$Res> {
  _$WilayaModelCopyWithImpl(this._self, this._then);

  final WilayaModel _self;
  final $Res Function(WilayaModel) _then;

/// Create a copy of WilayaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? nameAr = freezed,Object? nameFr = freezed,Object? nameEn = freezed,}) {
  return _then(WilayaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,nameAr: freezed == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String?,nameFr: freezed == nameFr ? _self.nameFr : nameFr // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WilayaModel].
extension WilayaModelPatterns on WilayaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WilayaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WilayaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WilayaModel value)  $default,){
final _that = this;
switch (_that) {
case _WilayaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WilayaModel value)?  $default,){
final _that = this;
switch (_that) {
case _WilayaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code, @JsonKey(name: 'name_ar')  String? nameAr, @JsonKey(name: 'name_fr')  String? nameFr, @JsonKey(name: 'name_en')  String? nameEn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WilayaModel() when $default != null:
return $default(_that.id,_that.code,_that.nameAr,_that.nameFr,_that.nameEn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code, @JsonKey(name: 'name_ar')  String? nameAr, @JsonKey(name: 'name_fr')  String? nameFr, @JsonKey(name: 'name_en')  String? nameEn)  $default,) {final _that = this;
switch (_that) {
case _WilayaModel():
return $default(_that.id,_that.code,_that.nameAr,_that.nameFr,_that.nameEn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code, @JsonKey(name: 'name_ar')  String? nameAr, @JsonKey(name: 'name_fr')  String? nameFr, @JsonKey(name: 'name_en')  String? nameEn)?  $default,) {final _that = this;
switch (_that) {
case _WilayaModel() when $default != null:
return $default(_that.id,_that.code,_that.nameAr,_that.nameFr,_that.nameEn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WilayaModel extends WilayaModel {
  const _WilayaModel({required this.id, this.code = '', @JsonKey(name: 'name_ar') this.nameAr, @JsonKey(name: 'name_fr') this.nameFr, @JsonKey(name: 'name_en') this.nameEn}): super._();
  factory _WilayaModel.fromJson(Map<String, dynamic> json) => _$WilayaModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String code;
@override@JsonKey(name: 'name_ar') final  String? nameAr;
@override@JsonKey(name: 'name_fr') final  String? nameFr;
@override@JsonKey(name: 'name_en') final  String? nameEn;

/// Create a copy of WilayaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WilayaModelCopyWith<_WilayaModel> get copyWith => __$WilayaModelCopyWithImpl<_WilayaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WilayaModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WilayaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameFr, nameFr) || other.nameFr == nameFr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,nameAr,nameFr,nameEn);
}

@override
String toString() {
    return 'WilayaModel(id: $id, code: $code, nameAr: $nameAr, nameFr: $nameFr, nameEn: $nameEn)';
}


}

/// @nodoc
abstract mixin class _$WilayaModelCopyWith<$Res> implements $WilayaModelCopyWith<$Res> {
  factory _$WilayaModelCopyWith(_WilayaModel value, $Res Function(_WilayaModel) _then) = __$WilayaModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String code,@JsonKey(name: 'name_ar') String? nameAr,@JsonKey(name: 'name_fr') String? nameFr,@JsonKey(name: 'name_en') String? nameEn
});




}
/// @nodoc
class __$WilayaModelCopyWithImpl<$Res>
    implements _$WilayaModelCopyWith<$Res> {
  __$WilayaModelCopyWithImpl(this._self, this._then);

  final _WilayaModel _self;
  final $Res Function(_WilayaModel) _then;

/// Create a copy of WilayaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? nameAr = freezed,Object? nameFr = freezed,Object? nameEn = freezed,}) {
  return _then(_WilayaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,nameAr: freezed == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String?,nameFr: freezed == nameFr ? _self.nameFr : nameFr // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CommuneModel {

 int get id;@JsonKey(name: 'name_ar') String? get nameAr;@JsonKey(name: 'name_fr') String? get nameFr;@JsonKey(name: 'name_en') String? get nameEn;@JsonKey(name: 'postal_code') String? get postalCode;
/// Create a copy of CommuneModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommuneModelCopyWith<CommuneModel> get copyWith => _$CommuneModelCopyWithImpl<CommuneModel>(this as CommuneModel, _$identity);

  /// Serializes this CommuneModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommuneModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommuneModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.nameAr, _this.nameAr) || other.nameAr == _this.nameAr)&&(identical(other.nameFr, _this.nameFr) || other.nameFr == _this.nameFr)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommuneModel;
  return Object.hash(runtimeType,_this.id,_this.nameAr,_this.nameFr,_this.nameEn,_this.postalCode);
}

@override
String toString() {
  final _this = this as CommuneModel;
  return 'CommuneModel(id: ${_this.id}, nameAr: ${_this.nameAr}, nameFr: ${_this.nameFr}, nameEn: ${_this.nameEn}, postalCode: ${_this.postalCode})';
}


}

/// @nodoc
abstract mixin class $CommuneModelCopyWith<$Res>  {
  factory $CommuneModelCopyWith(CommuneModel value, $Res Function(CommuneModel) _then) = _$CommuneModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'name_ar') String? nameAr,@JsonKey(name: 'name_fr') String? nameFr,@JsonKey(name: 'name_en') String? nameEn,@JsonKey(name: 'postal_code') String? postalCode
});




}
/// @nodoc
class _$CommuneModelCopyWithImpl<$Res>
    implements $CommuneModelCopyWith<$Res> {
  _$CommuneModelCopyWithImpl(this._self, this._then);

  final CommuneModel _self;
  final $Res Function(CommuneModel) _then;

/// Create a copy of CommuneModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nameAr = freezed,Object? nameFr = freezed,Object? nameEn = freezed,Object? postalCode = freezed,}) {
  return _then(CommuneModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nameAr: freezed == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String?,nameFr: freezed == nameFr ? _self.nameFr : nameFr // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommuneModel].
extension CommuneModelPatterns on CommuneModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommuneModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommuneModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommuneModel value)  $default,){
final _that = this;
switch (_that) {
case _CommuneModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommuneModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommuneModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name_ar')  String? nameAr, @JsonKey(name: 'name_fr')  String? nameFr, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'postal_code')  String? postalCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommuneModel() when $default != null:
return $default(_that.id,_that.nameAr,_that.nameFr,_that.nameEn,_that.postalCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name_ar')  String? nameAr, @JsonKey(name: 'name_fr')  String? nameFr, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'postal_code')  String? postalCode)  $default,) {final _that = this;
switch (_that) {
case _CommuneModel():
return $default(_that.id,_that.nameAr,_that.nameFr,_that.nameEn,_that.postalCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'name_ar')  String? nameAr, @JsonKey(name: 'name_fr')  String? nameFr, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'postal_code')  String? postalCode)?  $default,) {final _that = this;
switch (_that) {
case _CommuneModel() when $default != null:
return $default(_that.id,_that.nameAr,_that.nameFr,_that.nameEn,_that.postalCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommuneModel extends CommuneModel {
  const _CommuneModel({required this.id, @JsonKey(name: 'name_ar') this.nameAr, @JsonKey(name: 'name_fr') this.nameFr, @JsonKey(name: 'name_en') this.nameEn, @JsonKey(name: 'postal_code') this.postalCode}): super._();
  factory _CommuneModel.fromJson(Map<String, dynamic> json) => _$CommuneModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'name_ar') final  String? nameAr;
@override@JsonKey(name: 'name_fr') final  String? nameFr;
@override@JsonKey(name: 'name_en') final  String? nameEn;
@override@JsonKey(name: 'postal_code') final  String? postalCode;

/// Create a copy of CommuneModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommuneModelCopyWith<_CommuneModel> get copyWith => __$CommuneModelCopyWithImpl<_CommuneModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommuneModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommuneModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nameAr, nameAr) || other.nameAr == nameAr)&&(identical(other.nameFr, nameFr) || other.nameFr == nameFr)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,nameAr,nameFr,nameEn,postalCode);
}

@override
String toString() {
    return 'CommuneModel(id: $id, nameAr: $nameAr, nameFr: $nameFr, nameEn: $nameEn, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class _$CommuneModelCopyWith<$Res> implements $CommuneModelCopyWith<$Res> {
  factory _$CommuneModelCopyWith(_CommuneModel value, $Res Function(_CommuneModel) _then) = __$CommuneModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'name_ar') String? nameAr,@JsonKey(name: 'name_fr') String? nameFr,@JsonKey(name: 'name_en') String? nameEn,@JsonKey(name: 'postal_code') String? postalCode
});




}
/// @nodoc
class __$CommuneModelCopyWithImpl<$Res>
    implements _$CommuneModelCopyWith<$Res> {
  __$CommuneModelCopyWithImpl(this._self, this._then);

  final _CommuneModel _self;
  final $Res Function(_CommuneModel) _then;

/// Create a copy of CommuneModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nameAr = freezed,Object? nameFr = freezed,Object? nameEn = freezed,Object? postalCode = freezed,}) {
  return _then(_CommuneModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nameAr: freezed == nameAr ? _self.nameAr : nameAr // ignore: cast_nullable_to_non_nullable
as String?,nameFr: freezed == nameFr ? _self.nameFr : nameFr // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
