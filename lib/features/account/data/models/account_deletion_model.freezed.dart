// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_deletion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeletionBlockerModel {

 String get code; String get message;
/// Create a copy of DeletionBlockerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletionBlockerModelCopyWith<DeletionBlockerModel> get copyWith => _$DeletionBlockerModelCopyWithImpl<DeletionBlockerModel>(this as DeletionBlockerModel, _$identity);

  /// Serializes this DeletionBlockerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeletionBlockerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionBlockerModel&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.message, _this.message) || other.message == _this.message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeletionBlockerModel;
  return Object.hash(runtimeType,_this.code,_this.message);
}

@override
String toString() {
  final _this = this as DeletionBlockerModel;
  return 'DeletionBlockerModel(code: ${_this.code}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $DeletionBlockerModelCopyWith<$Res>  {
  factory $DeletionBlockerModelCopyWith(DeletionBlockerModel value, $Res Function(DeletionBlockerModel) _then) = _$DeletionBlockerModelCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$DeletionBlockerModelCopyWithImpl<$Res>
    implements $DeletionBlockerModelCopyWith<$Res> {
  _$DeletionBlockerModelCopyWithImpl(this._self, this._then);

  final DeletionBlockerModel _self;
  final $Res Function(DeletionBlockerModel) _then;

/// Create a copy of DeletionBlockerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,}) {
  return _then(DeletionBlockerModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletionBlockerModel].
extension DeletionBlockerModelPatterns on DeletionBlockerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletionBlockerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletionBlockerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletionBlockerModel value)  $default,){
final _that = this;
switch (_that) {
case _DeletionBlockerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletionBlockerModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeletionBlockerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletionBlockerModel() when $default != null:
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message)  $default,) {final _that = this;
switch (_that) {
case _DeletionBlockerModel():
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message)?  $default,) {final _that = this;
switch (_that) {
case _DeletionBlockerModel() when $default != null:
return $default(_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletionBlockerModel extends DeletionBlockerModel {
  const _DeletionBlockerModel({this.code = '', this.message = ''}): super._();
  factory _DeletionBlockerModel.fromJson(Map<String, dynamic> json) => _$DeletionBlockerModelFromJson(json);

@override@JsonKey() final  String code;
@override@JsonKey() final  String message;

/// Create a copy of DeletionBlockerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletionBlockerModelCopyWith<_DeletionBlockerModel> get copyWith => __$DeletionBlockerModelCopyWithImpl<_DeletionBlockerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletionBlockerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletionBlockerModel&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,message);
}

@override
String toString() {
    return 'DeletionBlockerModel(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DeletionBlockerModelCopyWith<$Res> implements $DeletionBlockerModelCopyWith<$Res> {
  factory _$DeletionBlockerModelCopyWith(_DeletionBlockerModel value, $Res Function(_DeletionBlockerModel) _then) = __$DeletionBlockerModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class __$DeletionBlockerModelCopyWithImpl<$Res>
    implements _$DeletionBlockerModelCopyWith<$Res> {
  __$DeletionBlockerModelCopyWithImpl(this._self, this._then);

  final _DeletionBlockerModel _self;
  final $Res Function(_DeletionBlockerModel) _then;

/// Create a copy of DeletionBlockerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(_DeletionBlockerModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccountDeletionCheckModel {

@JsonKey(name: 'can_delete') bool get canDelete; List<DeletionBlockerModel> get blockers;
/// Create a copy of AccountDeletionCheckModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDeletionCheckModelCopyWith<AccountDeletionCheckModel> get copyWith => _$AccountDeletionCheckModelCopyWithImpl<AccountDeletionCheckModel>(this as AccountDeletionCheckModel, _$identity);

  /// Serializes this AccountDeletionCheckModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AccountDeletionCheckModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeletionCheckModel&&(identical(other.canDelete, _this.canDelete) || other.canDelete == _this.canDelete)&&const DeepCollectionEquality().equals(other.blockers, _this.blockers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AccountDeletionCheckModel;
  return Object.hash(runtimeType,_this.canDelete,const DeepCollectionEquality().hash(_this.blockers));
}

@override
String toString() {
  final _this = this as AccountDeletionCheckModel;
  return 'AccountDeletionCheckModel(canDelete: ${_this.canDelete}, blockers: ${_this.blockers})';
}


}

/// @nodoc
abstract mixin class $AccountDeletionCheckModelCopyWith<$Res>  {
  factory $AccountDeletionCheckModelCopyWith(AccountDeletionCheckModel value, $Res Function(AccountDeletionCheckModel) _then) = _$AccountDeletionCheckModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'can_delete') bool canDelete, List<DeletionBlockerModel> blockers
});




}
/// @nodoc
class _$AccountDeletionCheckModelCopyWithImpl<$Res>
    implements $AccountDeletionCheckModelCopyWith<$Res> {
  _$AccountDeletionCheckModelCopyWithImpl(this._self, this._then);

  final AccountDeletionCheckModel _self;
  final $Res Function(AccountDeletionCheckModel) _then;

/// Create a copy of AccountDeletionCheckModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canDelete = null,Object? blockers = null,}) {
  return _then(AccountDeletionCheckModel(
canDelete: null == canDelete ? _self.canDelete : canDelete // ignore: cast_nullable_to_non_nullable
as bool,blockers: null == blockers ? _self.blockers : blockers // ignore: cast_nullable_to_non_nullable
as List<DeletionBlockerModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountDeletionCheckModel].
extension AccountDeletionCheckModelPatterns on AccountDeletionCheckModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountDeletionCheckModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountDeletionCheckModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountDeletionCheckModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountDeletionCheckModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountDeletionCheckModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountDeletionCheckModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'can_delete')  bool canDelete,  List<DeletionBlockerModel> blockers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountDeletionCheckModel() when $default != null:
return $default(_that.canDelete,_that.blockers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'can_delete')  bool canDelete,  List<DeletionBlockerModel> blockers)  $default,) {final _that = this;
switch (_that) {
case _AccountDeletionCheckModel():
return $default(_that.canDelete,_that.blockers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'can_delete')  bool canDelete,  List<DeletionBlockerModel> blockers)?  $default,) {final _that = this;
switch (_that) {
case _AccountDeletionCheckModel() when $default != null:
return $default(_that.canDelete,_that.blockers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountDeletionCheckModel extends AccountDeletionCheckModel {
  const _AccountDeletionCheckModel({@JsonKey(name: 'can_delete') this.canDelete = false,  List<DeletionBlockerModel> blockers = const <DeletionBlockerModel>[]}): _blockers = blockers,super._();
  factory _AccountDeletionCheckModel.fromJson(Map<String, dynamic> json) => _$AccountDeletionCheckModelFromJson(json);

@override@JsonKey(name: 'can_delete') final  bool canDelete;
 final  List<DeletionBlockerModel> _blockers;
@override@JsonKey() List<DeletionBlockerModel> get blockers {
  if (_blockers is EqualUnmodifiableListView) return _blockers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blockers);
}


/// Create a copy of AccountDeletionCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountDeletionCheckModelCopyWith<_AccountDeletionCheckModel> get copyWith => __$AccountDeletionCheckModelCopyWithImpl<_AccountDeletionCheckModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountDeletionCheckModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDeletionCheckModel&&(identical(other.canDelete, canDelete) || other.canDelete == canDelete)&&const DeepCollectionEquality().equals(other.blockers, _blockers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,canDelete,const DeepCollectionEquality().hash(_blockers));
}

@override
String toString() {
    return 'AccountDeletionCheckModel(canDelete: $canDelete, blockers: $blockers)';
}


}

/// @nodoc
abstract mixin class _$AccountDeletionCheckModelCopyWith<$Res> implements $AccountDeletionCheckModelCopyWith<$Res> {
  factory _$AccountDeletionCheckModelCopyWith(_AccountDeletionCheckModel value, $Res Function(_AccountDeletionCheckModel) _then) = __$AccountDeletionCheckModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'can_delete') bool canDelete, List<DeletionBlockerModel> blockers
});




}
/// @nodoc
class __$AccountDeletionCheckModelCopyWithImpl<$Res>
    implements _$AccountDeletionCheckModelCopyWith<$Res> {
  __$AccountDeletionCheckModelCopyWithImpl(this._self, this._then);

  final _AccountDeletionCheckModel _self;
  final $Res Function(_AccountDeletionCheckModel) _then;

/// Create a copy of AccountDeletionCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canDelete = null,Object? blockers = null,}) {
  return _then(_AccountDeletionCheckModel(
canDelete: null == canDelete ? _self.canDelete : canDelete // ignore: cast_nullable_to_non_nullable
as bool,blockers: null == blockers ? _self._blockers : blockers // ignore: cast_nullable_to_non_nullable
as List<DeletionBlockerModel>,
  ));
}


}

// dart format on
