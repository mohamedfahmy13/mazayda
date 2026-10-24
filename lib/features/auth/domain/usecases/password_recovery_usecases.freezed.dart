// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_recovery_usecases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdentifyAccountParams {

 String? get nin; String get email;
/// Create a copy of IdentifyAccountParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentifyAccountParamsCopyWith<IdentifyAccountParams> get copyWith => _$IdentifyAccountParamsCopyWithImpl<IdentifyAccountParams>(this as IdentifyAccountParams, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IdentifyAccountParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentifyAccountParams&&(identical(other.nin, _this.nin) || other.nin == _this.nin)&&(identical(other.email, _this.email) || other.email == _this.email));
}


@override
int get hashCode {
  final _this = this as IdentifyAccountParams;
  return Object.hash(runtimeType,_this.nin,_this.email);
}

@override
String toString() {
  final _this = this as IdentifyAccountParams;
  return 'IdentifyAccountParams(nin: ${_this.nin}, email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $IdentifyAccountParamsCopyWith<$Res>  {
  factory $IdentifyAccountParamsCopyWith(IdentifyAccountParams value, $Res Function(IdentifyAccountParams) _then) = _$IdentifyAccountParamsCopyWithImpl;
@useResult
$Res call({
 String? nin, String email
});




}
/// @nodoc
class _$IdentifyAccountParamsCopyWithImpl<$Res>
    implements $IdentifyAccountParamsCopyWith<$Res> {
  _$IdentifyAccountParamsCopyWithImpl(this._self, this._then);

  final IdentifyAccountParams _self;
  final $Res Function(IdentifyAccountParams) _then;

/// Create a copy of IdentifyAccountParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nin = freezed,Object? email = null,}) {
  return _then(IdentifyAccountParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IdentifyAccountParams].
extension IdentifyAccountParamsPatterns on IdentifyAccountParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentifyAccountParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentifyAccountParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentifyAccountParams value)  $default,){
final _that = this;
switch (_that) {
case _IdentifyAccountParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentifyAccountParams value)?  $default,){
final _that = this;
switch (_that) {
case _IdentifyAccountParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nin,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentifyAccountParams() when $default != null:
return $default(_that.nin,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nin,  String email)  $default,) {final _that = this;
switch (_that) {
case _IdentifyAccountParams():
return $default(_that.nin,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nin,  String email)?  $default,) {final _that = this;
switch (_that) {
case _IdentifyAccountParams() when $default != null:
return $default(_that.nin,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _IdentifyAccountParams implements IdentifyAccountParams {
  const _IdentifyAccountParams({this.nin, required this.email});
  

@override final  String? nin;
@override final  String email;

/// Create a copy of IdentifyAccountParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentifyAccountParamsCopyWith<_IdentifyAccountParams> get copyWith => __$IdentifyAccountParamsCopyWithImpl<_IdentifyAccountParams>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentifyAccountParams&&(identical(other.nin, nin) || other.nin == nin)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nin,email);
}

@override
String toString() {
    return 'IdentifyAccountParams(nin: $nin, email: $email)';
}


}

/// @nodoc
abstract mixin class _$IdentifyAccountParamsCopyWith<$Res> implements $IdentifyAccountParamsCopyWith<$Res> {
  factory _$IdentifyAccountParamsCopyWith(_IdentifyAccountParams value, $Res Function(_IdentifyAccountParams) _then) = __$IdentifyAccountParamsCopyWithImpl;
@override @useResult
$Res call({
 String? nin, String email
});




}
/// @nodoc
class __$IdentifyAccountParamsCopyWithImpl<$Res>
    implements _$IdentifyAccountParamsCopyWith<$Res> {
  __$IdentifyAccountParamsCopyWithImpl(this._self, this._then);

  final _IdentifyAccountParams _self;
  final $Res Function(_IdentifyAccountParams) _then;

/// Create a copy of IdentifyAccountParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nin = freezed,Object? email = null,}) {
  return _then(_IdentifyAccountParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VerifyPasswordResetParams {

 String? get nin; String get email; String get otp; String get password; String get passwordConfirmation;
/// Create a copy of VerifyPasswordResetParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyPasswordResetParamsCopyWith<VerifyPasswordResetParams> get copyWith => _$VerifyPasswordResetParamsCopyWithImpl<VerifyPasswordResetParams>(this as VerifyPasswordResetParams, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VerifyPasswordResetParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyPasswordResetParams&&(identical(other.nin, _this.nin) || other.nin == _this.nin)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.otp, _this.otp) || other.otp == _this.otp)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.passwordConfirmation, _this.passwordConfirmation) || other.passwordConfirmation == _this.passwordConfirmation));
}


@override
int get hashCode {
  final _this = this as VerifyPasswordResetParams;
  return Object.hash(runtimeType,_this.nin,_this.email,_this.otp,_this.password,_this.passwordConfirmation);
}

@override
String toString() {
  final _this = this as VerifyPasswordResetParams;
  return 'VerifyPasswordResetParams(nin: ${_this.nin}, email: ${_this.email}, otp: ${_this.otp}, password: ${_this.password}, passwordConfirmation: ${_this.passwordConfirmation})';
}


}

/// @nodoc
abstract mixin class $VerifyPasswordResetParamsCopyWith<$Res>  {
  factory $VerifyPasswordResetParamsCopyWith(VerifyPasswordResetParams value, $Res Function(VerifyPasswordResetParams) _then) = _$VerifyPasswordResetParamsCopyWithImpl;
@useResult
$Res call({
 String? nin, String email, String otp, String password, String passwordConfirmation
});




}
/// @nodoc
class _$VerifyPasswordResetParamsCopyWithImpl<$Res>
    implements $VerifyPasswordResetParamsCopyWith<$Res> {
  _$VerifyPasswordResetParamsCopyWithImpl(this._self, this._then);

  final VerifyPasswordResetParams _self;
  final $Res Function(VerifyPasswordResetParams) _then;

/// Create a copy of VerifyPasswordResetParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nin = freezed,Object? email = null,Object? otp = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(VerifyPasswordResetParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyPasswordResetParams].
extension VerifyPasswordResetParamsPatterns on VerifyPasswordResetParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyPasswordResetParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyPasswordResetParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyPasswordResetParams value)  $default,){
final _that = this;
switch (_that) {
case _VerifyPasswordResetParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyPasswordResetParams value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyPasswordResetParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nin,  String email,  String otp,  String password,  String passwordConfirmation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyPasswordResetParams() when $default != null:
return $default(_that.nin,_that.email,_that.otp,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nin,  String email,  String otp,  String password,  String passwordConfirmation)  $default,) {final _that = this;
switch (_that) {
case _VerifyPasswordResetParams():
return $default(_that.nin,_that.email,_that.otp,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nin,  String email,  String otp,  String password,  String passwordConfirmation)?  $default,) {final _that = this;
switch (_that) {
case _VerifyPasswordResetParams() when $default != null:
return $default(_that.nin,_that.email,_that.otp,_that.password,_that.passwordConfirmation);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyPasswordResetParams implements VerifyPasswordResetParams {
  const _VerifyPasswordResetParams({this.nin, required this.email, required this.otp, required this.password, required this.passwordConfirmation});
  

@override final  String? nin;
@override final  String email;
@override final  String otp;
@override final  String password;
@override final  String passwordConfirmation;

/// Create a copy of VerifyPasswordResetParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyPasswordResetParamsCopyWith<_VerifyPasswordResetParams> get copyWith => __$VerifyPasswordResetParamsCopyWithImpl<_VerifyPasswordResetParams>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyPasswordResetParams&&(identical(other.nin, nin) || other.nin == nin)&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nin,email,otp,password,passwordConfirmation);
}

@override
String toString() {
    return 'VerifyPasswordResetParams(nin: $nin, email: $email, otp: $otp, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class _$VerifyPasswordResetParamsCopyWith<$Res> implements $VerifyPasswordResetParamsCopyWith<$Res> {
  factory _$VerifyPasswordResetParamsCopyWith(_VerifyPasswordResetParams value, $Res Function(_VerifyPasswordResetParams) _then) = __$VerifyPasswordResetParamsCopyWithImpl;
@override @useResult
$Res call({
 String? nin, String email, String otp, String password, String passwordConfirmation
});




}
/// @nodoc
class __$VerifyPasswordResetParamsCopyWithImpl<$Res>
    implements _$VerifyPasswordResetParamsCopyWith<$Res> {
  __$VerifyPasswordResetParamsCopyWithImpl(this._self, this._then);

  final _VerifyPasswordResetParams _self;
  final $Res Function(_VerifyPasswordResetParams) _then;

/// Create a copy of VerifyPasswordResetParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nin = freezed,Object? email = null,Object? otp = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(_VerifyPasswordResetParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RecoverBySecretParams {

 String? get nin; String get email; String get secretAnswer; String get password; String get passwordConfirmation;
/// Create a copy of RecoverBySecretParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoverBySecretParamsCopyWith<RecoverBySecretParams> get copyWith => _$RecoverBySecretParamsCopyWithImpl<RecoverBySecretParams>(this as RecoverBySecretParams, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RecoverBySecretParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverBySecretParams&&(identical(other.nin, _this.nin) || other.nin == _this.nin)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.secretAnswer, _this.secretAnswer) || other.secretAnswer == _this.secretAnswer)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.passwordConfirmation, _this.passwordConfirmation) || other.passwordConfirmation == _this.passwordConfirmation));
}


@override
int get hashCode {
  final _this = this as RecoverBySecretParams;
  return Object.hash(runtimeType,_this.nin,_this.email,_this.secretAnswer,_this.password,_this.passwordConfirmation);
}

@override
String toString() {
  final _this = this as RecoverBySecretParams;
  return 'RecoverBySecretParams(nin: ${_this.nin}, email: ${_this.email}, secretAnswer: ${_this.secretAnswer}, password: ${_this.password}, passwordConfirmation: ${_this.passwordConfirmation})';
}


}

/// @nodoc
abstract mixin class $RecoverBySecretParamsCopyWith<$Res>  {
  factory $RecoverBySecretParamsCopyWith(RecoverBySecretParams value, $Res Function(RecoverBySecretParams) _then) = _$RecoverBySecretParamsCopyWithImpl;
@useResult
$Res call({
 String? nin, String email, String secretAnswer, String password, String passwordConfirmation
});




}
/// @nodoc
class _$RecoverBySecretParamsCopyWithImpl<$Res>
    implements $RecoverBySecretParamsCopyWith<$Res> {
  _$RecoverBySecretParamsCopyWithImpl(this._self, this._then);

  final RecoverBySecretParams _self;
  final $Res Function(RecoverBySecretParams) _then;

/// Create a copy of RecoverBySecretParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nin = freezed,Object? email = null,Object? secretAnswer = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(RecoverBySecretParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,secretAnswer: null == secretAnswer ? _self.secretAnswer : secretAnswer // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecoverBySecretParams].
extension RecoverBySecretParamsPatterns on RecoverBySecretParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecoverBySecretParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecoverBySecretParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecoverBySecretParams value)  $default,){
final _that = this;
switch (_that) {
case _RecoverBySecretParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecoverBySecretParams value)?  $default,){
final _that = this;
switch (_that) {
case _RecoverBySecretParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nin,  String email,  String secretAnswer,  String password,  String passwordConfirmation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoverBySecretParams() when $default != null:
return $default(_that.nin,_that.email,_that.secretAnswer,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nin,  String email,  String secretAnswer,  String password,  String passwordConfirmation)  $default,) {final _that = this;
switch (_that) {
case _RecoverBySecretParams():
return $default(_that.nin,_that.email,_that.secretAnswer,_that.password,_that.passwordConfirmation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nin,  String email,  String secretAnswer,  String password,  String passwordConfirmation)?  $default,) {final _that = this;
switch (_that) {
case _RecoverBySecretParams() when $default != null:
return $default(_that.nin,_that.email,_that.secretAnswer,_that.password,_that.passwordConfirmation);case _:
  return null;

}
}

}

/// @nodoc


class _RecoverBySecretParams implements RecoverBySecretParams {
  const _RecoverBySecretParams({this.nin, required this.email, required this.secretAnswer, required this.password, required this.passwordConfirmation});
  

@override final  String? nin;
@override final  String email;
@override final  String secretAnswer;
@override final  String password;
@override final  String passwordConfirmation;

/// Create a copy of RecoverBySecretParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecoverBySecretParamsCopyWith<_RecoverBySecretParams> get copyWith => __$RecoverBySecretParamsCopyWithImpl<_RecoverBySecretParams>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoverBySecretParams&&(identical(other.nin, nin) || other.nin == nin)&&(identical(other.email, email) || other.email == email)&&(identical(other.secretAnswer, secretAnswer) || other.secretAnswer == secretAnswer)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nin,email,secretAnswer,password,passwordConfirmation);
}

@override
String toString() {
    return 'RecoverBySecretParams(nin: $nin, email: $email, secretAnswer: $secretAnswer, password: $password, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class _$RecoverBySecretParamsCopyWith<$Res> implements $RecoverBySecretParamsCopyWith<$Res> {
  factory _$RecoverBySecretParamsCopyWith(_RecoverBySecretParams value, $Res Function(_RecoverBySecretParams) _then) = __$RecoverBySecretParamsCopyWithImpl;
@override @useResult
$Res call({
 String? nin, String email, String secretAnswer, String password, String passwordConfirmation
});




}
/// @nodoc
class __$RecoverBySecretParamsCopyWithImpl<$Res>
    implements _$RecoverBySecretParamsCopyWith<$Res> {
  __$RecoverBySecretParamsCopyWithImpl(this._self, this._then);

  final _RecoverBySecretParams _self;
  final $Res Function(_RecoverBySecretParams) _then;

/// Create a copy of RecoverBySecretParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nin = freezed,Object? email = null,Object? secretAnswer = null,Object? password = null,Object? passwordConfirmation = null,}) {
  return _then(_RecoverBySecretParams(
nin: freezed == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,secretAnswer: null == secretAnswer ? _self.secretAnswer : secretAnswer // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
