// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_recovery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordRecoveryState {

 RecoveryMode get mode; RecoveryStep get step; RecoveryStatus get status;/// اختياري — الحساب اللي اتعمل من غير رقم تعريف بيتعرّف بالبريد بس.
 OptionalNinInput get nin; EmailInput get email; String get otp; String get secretAnswer; NewPasswordInput get password; ConfirmPasswordInput get confirmPassword;/// مفتاح السؤال السرّي الراجع من السيرفر (مثال: mother_maiden).
 String? get questionKey; String? get errorMessage; Map<String, List<String>>? get serverErrors;
/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordRecoveryStateCopyWith<PasswordRecoveryState> get copyWith => _$PasswordRecoveryStateCopyWithImpl<PasswordRecoveryState>(this as PasswordRecoveryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PasswordRecoveryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordRecoveryState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.step, _this.step) || other.step == _this.step)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.nin, _this.nin) || other.nin == _this.nin)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.otp, _this.otp) || other.otp == _this.otp)&&(identical(other.secretAnswer, _this.secretAnswer) || other.secretAnswer == _this.secretAnswer)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.confirmPassword, _this.confirmPassword) || other.confirmPassword == _this.confirmPassword)&&(identical(other.questionKey, _this.questionKey) || other.questionKey == _this.questionKey)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&const DeepCollectionEquality().equals(other.serverErrors, _this.serverErrors));
}


@override
int get hashCode {
  final _this = this as PasswordRecoveryState;
  return Object.hash(runtimeType,_this.mode,_this.step,_this.status,_this.nin,_this.email,_this.otp,_this.secretAnswer,_this.password,_this.confirmPassword,_this.questionKey,_this.errorMessage,const DeepCollectionEquality().hash(_this.serverErrors));
}

@override
String toString() {
  final _this = this as PasswordRecoveryState;
  return 'PasswordRecoveryState(mode: ${_this.mode}, step: ${_this.step}, status: ${_this.status}, nin: ${_this.nin}, email: ${_this.email}, otp: ${_this.otp}, secretAnswer: ${_this.secretAnswer}, password: ${_this.password}, confirmPassword: ${_this.confirmPassword}, questionKey: ${_this.questionKey}, errorMessage: ${_this.errorMessage}, serverErrors: ${_this.serverErrors})';
}


}

/// @nodoc
abstract mixin class $PasswordRecoveryStateCopyWith<$Res>  {
  factory $PasswordRecoveryStateCopyWith(PasswordRecoveryState value, $Res Function(PasswordRecoveryState) _then) = _$PasswordRecoveryStateCopyWithImpl;
@useResult
$Res call({
 RecoveryMode mode, RecoveryStep step, RecoveryStatus status, OptionalNinInput nin, EmailInput email, String otp, String secretAnswer, NewPasswordInput password, ConfirmPasswordInput confirmPassword, String? questionKey, String? errorMessage, Map<String, List<String>>? serverErrors
});




}
/// @nodoc
class _$PasswordRecoveryStateCopyWithImpl<$Res>
    implements $PasswordRecoveryStateCopyWith<$Res> {
  _$PasswordRecoveryStateCopyWithImpl(this._self, this._then);

  final PasswordRecoveryState _self;
  final $Res Function(PasswordRecoveryState) _then;

/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? step = null,Object? status = null,Object? nin = null,Object? email = null,Object? otp = null,Object? secretAnswer = null,Object? password = null,Object? confirmPassword = null,Object? questionKey = freezed,Object? errorMessage = freezed,Object? serverErrors = freezed,}) {
  return _then(PasswordRecoveryState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as RecoveryMode,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as RecoveryStep,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecoveryStatus,nin: null == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as OptionalNinInput,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailInput,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,secretAnswer: null == secretAnswer ? _self.secretAnswer : secretAnswer // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as NewPasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,questionKey: freezed == questionKey ? _self.questionKey : questionKey // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,serverErrors: freezed == serverErrors ? _self.serverErrors : serverErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordRecoveryState].
extension PasswordRecoveryStatePatterns on PasswordRecoveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordRecoveryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordRecoveryState value)  $default,){
final _that = this;
switch (_that) {
case _PasswordRecoveryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordRecoveryState value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecoveryMode mode,  RecoveryStep step,  RecoveryStatus status,  OptionalNinInput nin,  EmailInput email,  String otp,  String secretAnswer,  NewPasswordInput password,  ConfirmPasswordInput confirmPassword,  String? questionKey,  String? errorMessage,  Map<String, List<String>>? serverErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
return $default(_that.mode,_that.step,_that.status,_that.nin,_that.email,_that.otp,_that.secretAnswer,_that.password,_that.confirmPassword,_that.questionKey,_that.errorMessage,_that.serverErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecoveryMode mode,  RecoveryStep step,  RecoveryStatus status,  OptionalNinInput nin,  EmailInput email,  String otp,  String secretAnswer,  NewPasswordInput password,  ConfirmPasswordInput confirmPassword,  String? questionKey,  String? errorMessage,  Map<String, List<String>>? serverErrors)  $default,) {final _that = this;
switch (_that) {
case _PasswordRecoveryState():
return $default(_that.mode,_that.step,_that.status,_that.nin,_that.email,_that.otp,_that.secretAnswer,_that.password,_that.confirmPassword,_that.questionKey,_that.errorMessage,_that.serverErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecoveryMode mode,  RecoveryStep step,  RecoveryStatus status,  OptionalNinInput nin,  EmailInput email,  String otp,  String secretAnswer,  NewPasswordInput password,  ConfirmPasswordInput confirmPassword,  String? questionKey,  String? errorMessage,  Map<String, List<String>>? serverErrors)?  $default,) {final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
return $default(_that.mode,_that.step,_that.status,_that.nin,_that.email,_that.otp,_that.secretAnswer,_that.password,_that.confirmPassword,_that.questionKey,_that.errorMessage,_that.serverErrors);case _:
  return null;

}
}

}

/// @nodoc


class _PasswordRecoveryState extends PasswordRecoveryState {
  const _PasswordRecoveryState({required this.mode, this.step = RecoveryStep.identify, this.status = RecoveryStatus.idle, this.nin = const OptionalNinInput.pure(), this.email = const EmailInput.pure(), this.otp = '', this.secretAnswer = '', this.password = const NewPasswordInput.pure(), this.confirmPassword = const ConfirmPasswordInput.pure(), this.questionKey, this.errorMessage,  Map<String, List<String>>? serverErrors}): _serverErrors = serverErrors,super._();
  

@override final  RecoveryMode mode;
@override@JsonKey() final  RecoveryStep step;
@override@JsonKey() final  RecoveryStatus status;
/// اختياري — الحساب اللي اتعمل من غير رقم تعريف بيتعرّف بالبريد بس.
@override@JsonKey() final  OptionalNinInput nin;
@override@JsonKey() final  EmailInput email;
@override@JsonKey() final  String otp;
@override@JsonKey() final  String secretAnswer;
@override@JsonKey() final  NewPasswordInput password;
@override@JsonKey() final  ConfirmPasswordInput confirmPassword;
/// مفتاح السؤال السرّي الراجع من السيرفر (مثال: mother_maiden).
@override final  String? questionKey;
@override final  String? errorMessage;
 final  Map<String, List<String>>? _serverErrors;
@override Map<String, List<String>>? get serverErrors {
  final value = _serverErrors;
  if (value == null) return null;
  if (_serverErrors is EqualUnmodifiableMapView) return _serverErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordRecoveryStateCopyWith<_PasswordRecoveryState> get copyWith => __$PasswordRecoveryStateCopyWithImpl<_PasswordRecoveryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordRecoveryState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.step, step) || other.step == step)&&(identical(other.status, status) || other.status == status)&&(identical(other.nin, nin) || other.nin == nin)&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.secretAnswer, secretAnswer) || other.secretAnswer == secretAnswer)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.questionKey, questionKey) || other.questionKey == questionKey)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.serverErrors, _serverErrors));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,step,status,nin,email,otp,secretAnswer,password,confirmPassword,questionKey,errorMessage,const DeepCollectionEquality().hash(_serverErrors));
}

@override
String toString() {
    return 'PasswordRecoveryState(mode: $mode, step: $step, status: $status, nin: $nin, email: $email, otp: $otp, secretAnswer: $secretAnswer, password: $password, confirmPassword: $confirmPassword, questionKey: $questionKey, errorMessage: $errorMessage, serverErrors: $serverErrors)';
}


}

/// @nodoc
abstract mixin class _$PasswordRecoveryStateCopyWith<$Res> implements $PasswordRecoveryStateCopyWith<$Res> {
  factory _$PasswordRecoveryStateCopyWith(_PasswordRecoveryState value, $Res Function(_PasswordRecoveryState) _then) = __$PasswordRecoveryStateCopyWithImpl;
@override @useResult
$Res call({
 RecoveryMode mode, RecoveryStep step, RecoveryStatus status, OptionalNinInput nin, EmailInput email, String otp, String secretAnswer, NewPasswordInput password, ConfirmPasswordInput confirmPassword, String? questionKey, String? errorMessage, Map<String, List<String>>? serverErrors
});




}
/// @nodoc
class __$PasswordRecoveryStateCopyWithImpl<$Res>
    implements _$PasswordRecoveryStateCopyWith<$Res> {
  __$PasswordRecoveryStateCopyWithImpl(this._self, this._then);

  final _PasswordRecoveryState _self;
  final $Res Function(_PasswordRecoveryState) _then;

/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? step = null,Object? status = null,Object? nin = null,Object? email = null,Object? otp = null,Object? secretAnswer = null,Object? password = null,Object? confirmPassword = null,Object? questionKey = freezed,Object? errorMessage = freezed,Object? serverErrors = freezed,}) {
  return _then(_PasswordRecoveryState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as RecoveryMode,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as RecoveryStep,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RecoveryStatus,nin: null == nin ? _self.nin : nin // ignore: cast_nullable_to_non_nullable
as OptionalNinInput,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailInput,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,secretAnswer: null == secretAnswer ? _self.secretAnswer : secretAnswer // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as NewPasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,questionKey: freezed == questionKey ? _self.questionKey : questionKey // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,serverErrors: freezed == serverErrors ? _self._serverErrors : serverErrors // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>?,
  ));
}


}

// dart format on
