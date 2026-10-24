// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 NameInput get firstName; NameInput get lastName; PhoneInput get phone; EmailInput get email; NewPasswordInput get password; ConfirmPasswordInput get confirmPassword; RegisterStatus get status; bool get isValid; String? get userId; String? get errorMessage; Map<String, List<String>>? get serverErrors;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RegisterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.confirmPassword, _this.confirmPassword) || other.confirmPassword == _this.confirmPassword)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.isValid, _this.isValid) || other.isValid == _this.isValid)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&const DeepCollectionEquality().equals(other.serverErrors, _this.serverErrors));
}


@override
int get hashCode {
  final _this = this as RegisterState;
  return Object.hash(runtimeType,_this.firstName,_this.lastName,_this.phone,_this.email,_this.password,_this.confirmPassword,_this.status,_this.isValid,_this.userId,_this.errorMessage,const DeepCollectionEquality().hash(_this.serverErrors));
}

@override
String toString() {
  final _this = this as RegisterState;
  return 'RegisterState(firstName: ${_this.firstName}, lastName: ${_this.lastName}, phone: ${_this.phone}, email: ${_this.email}, password: ${_this.password}, confirmPassword: ${_this.confirmPassword}, status: ${_this.status}, isValid: ${_this.isValid}, userId: ${_this.userId}, errorMessage: ${_this.errorMessage}, serverErrors: ${_this.serverErrors})';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 NameInput firstName, NameInput lastName, PhoneInput phone, EmailInput email, NewPasswordInput password, ConfirmPasswordInput confirmPassword, RegisterStatus status, bool isValid, String? userId, String? errorMessage, Map<String, List<String>>? serverErrors
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? status = null,Object? isValid = null,Object? userId = freezed,Object? errorMessage = freezed,Object? serverErrors = freezed,}) {
  return _then(RegisterState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as NameInput,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as NameInput,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as NewPasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegisterStatus,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,serverErrors: freezed == serverErrors ? _self.serverErrors : serverErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NameInput firstName,  NameInput lastName,  PhoneInput phone,  EmailInput email,  NewPasswordInput password,  ConfirmPasswordInput confirmPassword,  RegisterStatus status,  bool isValid,  String? userId,  String? errorMessage,  Map<String, List<String>>? serverErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.password,_that.confirmPassword,_that.status,_that.isValid,_that.userId,_that.errorMessage,_that.serverErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NameInput firstName,  NameInput lastName,  PhoneInput phone,  EmailInput email,  NewPasswordInput password,  ConfirmPasswordInput confirmPassword,  RegisterStatus status,  bool isValid,  String? userId,  String? errorMessage,  Map<String, List<String>>? serverErrors)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.password,_that.confirmPassword,_that.status,_that.isValid,_that.userId,_that.errorMessage,_that.serverErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NameInput firstName,  NameInput lastName,  PhoneInput phone,  EmailInput email,  NewPasswordInput password,  ConfirmPasswordInput confirmPassword,  RegisterStatus status,  bool isValid,  String? userId,  String? errorMessage,  Map<String, List<String>>? serverErrors)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.password,_that.confirmPassword,_that.status,_that.isValid,_that.userId,_that.errorMessage,_that.serverErrors);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState extends RegisterState {
  const _RegisterState({this.firstName = const NameInput.pure(), this.lastName = const NameInput.pure(), this.phone = const PhoneInput.pure(), this.email = const EmailInput.pure(), this.password = const NewPasswordInput.pure(), this.confirmPassword = const ConfirmPasswordInput.pure(), this.status = RegisterStatus.idle, this.isValid = false, this.userId, this.errorMessage,  Map<String, List<String>>? serverErrors}): _serverErrors = serverErrors,super._();
  

@override@JsonKey() final  NameInput firstName;
@override@JsonKey() final  NameInput lastName;
@override@JsonKey() final  PhoneInput phone;
@override@JsonKey() final  EmailInput email;
@override@JsonKey() final  NewPasswordInput password;
@override@JsonKey() final  ConfirmPasswordInput confirmPassword;
@override@JsonKey() final  RegisterStatus status;
@override@JsonKey() final  bool isValid;
@override final  String? userId;
@override final  String? errorMessage;
 final  Map<String, List<String>>? _serverErrors;
@override Map<String, List<String>>? get serverErrors {
  final value = _serverErrors;
  if (value == null) return null;
  if (_serverErrors is EqualUnmodifiableMapView) return _serverErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.status, status) || other.status == status)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.serverErrors, _serverErrors));
}


@override
int get hashCode {
    return Object.hash(runtimeType,firstName,lastName,phone,email,password,confirmPassword,status,isValid,userId,errorMessage,const DeepCollectionEquality().hash(_serverErrors));
}

@override
String toString() {
    return 'RegisterState(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, password: $password, confirmPassword: $confirmPassword, status: $status, isValid: $isValid, userId: $userId, errorMessage: $errorMessage, serverErrors: $serverErrors)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 NameInput firstName, NameInput lastName, PhoneInput phone, EmailInput email, NewPasswordInput password, ConfirmPasswordInput confirmPassword, RegisterStatus status, bool isValid, String? userId, String? errorMessage, Map<String, List<String>>? serverErrors
});




}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? status = null,Object? isValid = null,Object? userId = freezed,Object? errorMessage = freezed,Object? serverErrors = freezed,}) {
  return _then(_RegisterState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as NameInput,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as NameInput,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as NewPasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegisterStatus,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,serverErrors: freezed == serverErrors ? _self._serverErrors : serverErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,
  ));
}


}

// dart format on
