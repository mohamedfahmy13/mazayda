// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuctionDetailState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuctionDetailState()';
}


}

/// @nodoc
class $AuctionDetailStateCopyWith<$Res>  {
$AuctionDetailStateCopyWith(AuctionDetailState _, $Res Function(AuctionDetailState) __);
}


/// Adds pattern-matching-related methods to [AuctionDetailState].
extension AuctionDetailStatePatterns on AuctionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuctionDetailInitial value)?  initial,TResult Function( AuctionDetailLoading value)?  loading,TResult Function( AuctionDetailLoaded value)?  loaded,TResult Function( AuctionDetailError value)?  error,TResult Function( AuctionDetailUnavailable value)?  unavailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuctionDetailInitial() when initial != null:
return initial(_that);case AuctionDetailLoading() when loading != null:
return loading(_that);case AuctionDetailLoaded() when loaded != null:
return loaded(_that);case AuctionDetailError() when error != null:
return error(_that);case AuctionDetailUnavailable() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuctionDetailInitial value)  initial,required TResult Function( AuctionDetailLoading value)  loading,required TResult Function( AuctionDetailLoaded value)  loaded,required TResult Function( AuctionDetailError value)  error,required TResult Function( AuctionDetailUnavailable value)  unavailable,}){
final _that = this;
switch (_that) {
case AuctionDetailInitial():
return initial(_that);case AuctionDetailLoading():
return loading(_that);case AuctionDetailLoaded():
return loaded(_that);case AuctionDetailError():
return error(_that);case AuctionDetailUnavailable():
return unavailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuctionDetailInitial value)?  initial,TResult? Function( AuctionDetailLoading value)?  loading,TResult? Function( AuctionDetailLoaded value)?  loaded,TResult? Function( AuctionDetailError value)?  error,TResult? Function( AuctionDetailUnavailable value)?  unavailable,}){
final _that = this;
switch (_that) {
case AuctionDetailInitial() when initial != null:
return initial(_that);case AuctionDetailLoading() when loading != null:
return loading(_that);case AuctionDetailLoaded() when loaded != null:
return loaded(_that);case AuctionDetailError() when error != null:
return error(_that);case AuctionDetailUnavailable() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AuctionDetail detail,  bool isAuthenticated,  ViewerAccountFlags? account)?  loaded,TResult Function( String message)?  error,TResult Function()?  unavailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuctionDetailInitial() when initial != null:
return initial();case AuctionDetailLoading() when loading != null:
return loading();case AuctionDetailLoaded() when loaded != null:
return loaded(_that.detail,_that.isAuthenticated,_that.account);case AuctionDetailError() when error != null:
return error(_that.message);case AuctionDetailUnavailable() when unavailable != null:
return unavailable();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AuctionDetail detail,  bool isAuthenticated,  ViewerAccountFlags? account)  loaded,required TResult Function( String message)  error,required TResult Function()  unavailable,}) {final _that = this;
switch (_that) {
case AuctionDetailInitial():
return initial();case AuctionDetailLoading():
return loading();case AuctionDetailLoaded():
return loaded(_that.detail,_that.isAuthenticated,_that.account);case AuctionDetailError():
return error(_that.message);case AuctionDetailUnavailable():
return unavailable();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AuctionDetail detail,  bool isAuthenticated,  ViewerAccountFlags? account)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  unavailable,}) {final _that = this;
switch (_that) {
case AuctionDetailInitial() when initial != null:
return initial();case AuctionDetailLoading() when loading != null:
return loading();case AuctionDetailLoaded() when loaded != null:
return loaded(_that.detail,_that.isAuthenticated,_that.account);case AuctionDetailError() when error != null:
return error(_that.message);case AuctionDetailUnavailable() when unavailable != null:
return unavailable();case _:
  return null;

}
}

}

/// @nodoc


class AuctionDetailInitial implements AuctionDetailState {
  const AuctionDetailInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuctionDetailState.initial()';
}


}




/// @nodoc


class AuctionDetailLoading implements AuctionDetailState {
  const AuctionDetailLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuctionDetailState.loading()';
}


}




/// @nodoc


class AuctionDetailLoaded implements AuctionDetailState {
  const AuctionDetailLoaded(this.detail, {this.isAuthenticated = false, this.account});
  

 final  AuctionDetail detail;
@JsonKey() final  bool isAuthenticated;
 final  ViewerAccountFlags? account;

/// Create a copy of AuctionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuctionDetailLoadedCopyWith<AuctionDetailLoaded> get copyWith => _$AuctionDetailLoadedCopyWithImpl<AuctionDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetailLoaded&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode {
    return Object.hash(runtimeType,detail,isAuthenticated,account);
}

@override
String toString() {
    return 'AuctionDetailState.loaded(detail: $detail, isAuthenticated: $isAuthenticated, account: $account)';
}


}

/// @nodoc
abstract mixin class $AuctionDetailLoadedCopyWith<$Res> implements $AuctionDetailStateCopyWith<$Res> {
  factory $AuctionDetailLoadedCopyWith(AuctionDetailLoaded value, $Res Function(AuctionDetailLoaded) _then) = _$AuctionDetailLoadedCopyWithImpl;
@useResult
$Res call({
 AuctionDetail detail, bool isAuthenticated, ViewerAccountFlags? account
});




}
/// @nodoc
class _$AuctionDetailLoadedCopyWithImpl<$Res>
    implements $AuctionDetailLoadedCopyWith<$Res> {
  _$AuctionDetailLoadedCopyWithImpl(this._self, this._then);

  final AuctionDetailLoaded _self;
  final $Res Function(AuctionDetailLoaded) _then;

/// Create a copy of AuctionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,Object? isAuthenticated = null,Object? account = freezed,}) {
  return _then(AuctionDetailLoaded(
null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as AuctionDetail,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as ViewerAccountFlags?,
  ));
}


}

/// @nodoc


class AuctionDetailError implements AuctionDetailState {
  const AuctionDetailError(this.message);
  

 final  String message;

/// Create a copy of AuctionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuctionDetailErrorCopyWith<AuctionDetailError> get copyWith => _$AuctionDetailErrorCopyWithImpl<AuctionDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AuctionDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuctionDetailErrorCopyWith<$Res> implements $AuctionDetailStateCopyWith<$Res> {
  factory $AuctionDetailErrorCopyWith(AuctionDetailError value, $Res Function(AuctionDetailError) _then) = _$AuctionDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuctionDetailErrorCopyWithImpl<$Res>
    implements $AuctionDetailErrorCopyWith<$Res> {
  _$AuctionDetailErrorCopyWithImpl(this._self, this._then);

  final AuctionDetailError _self;
  final $Res Function(AuctionDetailError) _then;

/// Create a copy of AuctionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuctionDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuctionDetailUnavailable implements AuctionDetailState {
  const AuctionDetailUnavailable();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetailUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuctionDetailState.unavailable()';
}


}




// dart format on
