// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_deletion_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountDeletionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeletionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AccountDeletionState()';
}


}

/// @nodoc
class $AccountDeletionStateCopyWith<$Res>  {
$AccountDeletionStateCopyWith(AccountDeletionState _, $Res Function(AccountDeletionState) __);
}


/// Adds pattern-matching-related methods to [AccountDeletionState].
extension AccountDeletionStatePatterns on AccountDeletionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeletionChecking value)?  checking,TResult Function( DeletionCheckFailed value)?  checkFailed,TResult Function( DeletionBlocked value)?  blocked,TResult Function( DeletionReady value)?  ready,TResult Function( AccountDeletionDone value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeletionChecking() when checking != null:
return checking(_that);case DeletionCheckFailed() when checkFailed != null:
return checkFailed(_that);case DeletionBlocked() when blocked != null:
return blocked(_that);case DeletionReady() when ready != null:
return ready(_that);case AccountDeletionDone() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeletionChecking value)  checking,required TResult Function( DeletionCheckFailed value)  checkFailed,required TResult Function( DeletionBlocked value)  blocked,required TResult Function( DeletionReady value)  ready,required TResult Function( AccountDeletionDone value)  deleted,}){
final _that = this;
switch (_that) {
case DeletionChecking():
return checking(_that);case DeletionCheckFailed():
return checkFailed(_that);case DeletionBlocked():
return blocked(_that);case DeletionReady():
return ready(_that);case AccountDeletionDone():
return deleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeletionChecking value)?  checking,TResult? Function( DeletionCheckFailed value)?  checkFailed,TResult? Function( DeletionBlocked value)?  blocked,TResult? Function( DeletionReady value)?  ready,TResult? Function( AccountDeletionDone value)?  deleted,}){
final _that = this;
switch (_that) {
case DeletionChecking() when checking != null:
return checking(_that);case DeletionCheckFailed() when checkFailed != null:
return checkFailed(_that);case DeletionBlocked() when blocked != null:
return blocked(_that);case DeletionReady() when ready != null:
return ready(_that);case AccountDeletionDone() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checking,TResult Function( String message)?  checkFailed,TResult Function( List<DeletionBlocker> blockers,  String? message)?  blocked,TResult Function( bool deleting,  String? passwordError,  String? error)?  ready,TResult Function( String? message)?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeletionChecking() when checking != null:
return checking();case DeletionCheckFailed() when checkFailed != null:
return checkFailed(_that.message);case DeletionBlocked() when blocked != null:
return blocked(_that.blockers,_that.message);case DeletionReady() when ready != null:
return ready(_that.deleting,_that.passwordError,_that.error);case AccountDeletionDone() when deleted != null:
return deleted(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checking,required TResult Function( String message)  checkFailed,required TResult Function( List<DeletionBlocker> blockers,  String? message)  blocked,required TResult Function( bool deleting,  String? passwordError,  String? error)  ready,required TResult Function( String? message)  deleted,}) {final _that = this;
switch (_that) {
case DeletionChecking():
return checking();case DeletionCheckFailed():
return checkFailed(_that.message);case DeletionBlocked():
return blocked(_that.blockers,_that.message);case DeletionReady():
return ready(_that.deleting,_that.passwordError,_that.error);case AccountDeletionDone():
return deleted(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checking,TResult? Function( String message)?  checkFailed,TResult? Function( List<DeletionBlocker> blockers,  String? message)?  blocked,TResult? Function( bool deleting,  String? passwordError,  String? error)?  ready,TResult? Function( String? message)?  deleted,}) {final _that = this;
switch (_that) {
case DeletionChecking() when checking != null:
return checking();case DeletionCheckFailed() when checkFailed != null:
return checkFailed(_that.message);case DeletionBlocked() when blocked != null:
return blocked(_that.blockers,_that.message);case DeletionReady() when ready != null:
return ready(_that.deleting,_that.passwordError,_that.error);case AccountDeletionDone() when deleted != null:
return deleted(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeletionChecking implements AccountDeletionState {
  const DeletionChecking();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionChecking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AccountDeletionState.checking()';
}


}




/// @nodoc


class DeletionCheckFailed implements AccountDeletionState {
  const DeletionCheckFailed(this.message);
  

 final  String message;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletionCheckFailedCopyWith<DeletionCheckFailed> get copyWith => _$DeletionCheckFailedCopyWithImpl<DeletionCheckFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionCheckFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AccountDeletionState.checkFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeletionCheckFailedCopyWith<$Res> implements $AccountDeletionStateCopyWith<$Res> {
  factory $DeletionCheckFailedCopyWith(DeletionCheckFailed value, $Res Function(DeletionCheckFailed) _then) = _$DeletionCheckFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeletionCheckFailedCopyWithImpl<$Res>
    implements $DeletionCheckFailedCopyWith<$Res> {
  _$DeletionCheckFailedCopyWithImpl(this._self, this._then);

  final DeletionCheckFailed _self;
  final $Res Function(DeletionCheckFailed) _then;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeletionCheckFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeletionBlocked implements AccountDeletionState {
  const DeletionBlocked( List<DeletionBlocker> blockers, {this.message}): _blockers = blockers;
  

 final  List<DeletionBlocker> _blockers;
 List<DeletionBlocker> get blockers {
  if (_blockers is EqualUnmodifiableListView) return _blockers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blockers);
}

 final  String? message;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletionBlockedCopyWith<DeletionBlocked> get copyWith => _$DeletionBlockedCopyWithImpl<DeletionBlocked>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionBlocked&&const DeepCollectionEquality().equals(other.blockers, _blockers)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_blockers),message);
}

@override
String toString() {
    return 'AccountDeletionState.blocked(blockers: $blockers, message: $message)';
}


}

/// @nodoc
abstract mixin class $DeletionBlockedCopyWith<$Res> implements $AccountDeletionStateCopyWith<$Res> {
  factory $DeletionBlockedCopyWith(DeletionBlocked value, $Res Function(DeletionBlocked) _then) = _$DeletionBlockedCopyWithImpl;
@useResult
$Res call({
 List<DeletionBlocker> blockers, String? message
});




}
/// @nodoc
class _$DeletionBlockedCopyWithImpl<$Res>
    implements $DeletionBlockedCopyWith<$Res> {
  _$DeletionBlockedCopyWithImpl(this._self, this._then);

  final DeletionBlocked _self;
  final $Res Function(DeletionBlocked) _then;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? blockers = null,Object? message = freezed,}) {
  return _then(DeletionBlocked(
null == blockers ? _self._blockers : blockers // ignore: cast_nullable_to_non_nullable
as List<DeletionBlocker>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DeletionReady implements AccountDeletionState {
  const DeletionReady({this.deleting = false, this.passwordError, this.error});
  

@JsonKey() final  bool deleting;
/// كلمة سر غلط أو ناقصة (422 `errors.password`) — تحت الحقل.
 final  String? passwordError;
/// أي رفض تاني (محاولات كتير، شبكة…) — فوق الزرار.
 final  String? error;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletionReadyCopyWith<DeletionReady> get copyWith => _$DeletionReadyCopyWithImpl<DeletionReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionReady&&(identical(other.deleting, deleting) || other.deleting == deleting)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,deleting,passwordError,error);
}

@override
String toString() {
    return 'AccountDeletionState.ready(deleting: $deleting, passwordError: $passwordError, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeletionReadyCopyWith<$Res> implements $AccountDeletionStateCopyWith<$Res> {
  factory $DeletionReadyCopyWith(DeletionReady value, $Res Function(DeletionReady) _then) = _$DeletionReadyCopyWithImpl;
@useResult
$Res call({
 bool deleting, String? passwordError, String? error
});




}
/// @nodoc
class _$DeletionReadyCopyWithImpl<$Res>
    implements $DeletionReadyCopyWith<$Res> {
  _$DeletionReadyCopyWithImpl(this._self, this._then);

  final DeletionReady _self;
  final $Res Function(DeletionReady) _then;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deleting = null,Object? passwordError = freezed,Object? error = freezed,}) {
  return _then(DeletionReady(
deleting: null == deleting ? _self.deleting : deleting // ignore: cast_nullable_to_non_nullable
as bool,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AccountDeletionDone implements AccountDeletionState {
  const AccountDeletionDone({this.message});
  

 final  String? message;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDeletionDoneCopyWith<AccountDeletionDone> get copyWith => _$AccountDeletionDoneCopyWithImpl<AccountDeletionDone>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeletionDone&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AccountDeletionState.deleted(message: $message)';
}


}

/// @nodoc
abstract mixin class $AccountDeletionDoneCopyWith<$Res> implements $AccountDeletionStateCopyWith<$Res> {
  factory $AccountDeletionDoneCopyWith(AccountDeletionDone value, $Res Function(AccountDeletionDone) _then) = _$AccountDeletionDoneCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AccountDeletionDoneCopyWithImpl<$Res>
    implements $AccountDeletionDoneCopyWith<$Res> {
  _$AccountDeletionDoneCopyWithImpl(this._self, this._then);

  final AccountDeletionDone _self;
  final $Res Function(AccountDeletionDone) _then;

/// Create a copy of AccountDeletionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(AccountDeletionDone(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
