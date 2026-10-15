// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auctions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuctionsState {

 bool get loading; List<AuctionListItem> get auctions; bool get hasMore; int get page; String? get error; String get query; String? get statusFilter; String? get typeFilter; Wilaya? get wilaya;
/// Create a copy of AuctionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuctionsStateCopyWith<AuctionsState> get copyWith => _$AuctionsStateCopyWithImpl<AuctionsState>(this as AuctionsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuctionsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionsState&&(identical(other.loading, _this.loading) || other.loading == _this.loading)&&const DeepCollectionEquality().equals(other.auctions, _this.auctions)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.statusFilter, _this.statusFilter) || other.statusFilter == _this.statusFilter)&&(identical(other.typeFilter, _this.typeFilter) || other.typeFilter == _this.typeFilter)&&(identical(other.wilaya, _this.wilaya) || other.wilaya == _this.wilaya));
}


@override
int get hashCode {
  final _this = this as AuctionsState;
  return Object.hash(runtimeType,_this.loading,const DeepCollectionEquality().hash(_this.auctions),_this.hasMore,_this.page,_this.error,_this.query,_this.statusFilter,_this.typeFilter,_this.wilaya);
}

@override
String toString() {
  final _this = this as AuctionsState;
  return 'AuctionsState(loading: ${_this.loading}, auctions: ${_this.auctions}, hasMore: ${_this.hasMore}, page: ${_this.page}, error: ${_this.error}, query: ${_this.query}, statusFilter: ${_this.statusFilter}, typeFilter: ${_this.typeFilter}, wilaya: ${_this.wilaya})';
}


}

/// @nodoc
abstract mixin class $AuctionsStateCopyWith<$Res>  {
  factory $AuctionsStateCopyWith(AuctionsState value, $Res Function(AuctionsState) _then) = _$AuctionsStateCopyWithImpl;
@useResult
$Res call({
 bool loading, List<AuctionListItem> auctions, bool hasMore, int page, String? error, String query, String? statusFilter, String? typeFilter, Wilaya? wilaya
});




}
/// @nodoc
class _$AuctionsStateCopyWithImpl<$Res>
    implements $AuctionsStateCopyWith<$Res> {
  _$AuctionsStateCopyWithImpl(this._self, this._then);

  final AuctionsState _self;
  final $Res Function(AuctionsState) _then;

/// Create a copy of AuctionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? auctions = null,Object? hasMore = null,Object? page = null,Object? error = freezed,Object? query = null,Object? statusFilter = freezed,Object? typeFilter = freezed,Object? wilaya = freezed,}) {
  return _then(AuctionsState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,auctions: null == auctions ? _self.auctions : auctions // ignore: cast_nullable_to_non_nullable
as List<AuctionListItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as String?,typeFilter: freezed == typeFilter ? _self.typeFilter : typeFilter // ignore: cast_nullable_to_non_nullable
as String?,wilaya: freezed == wilaya ? _self.wilaya : wilaya // ignore: cast_nullable_to_non_nullable
as Wilaya?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuctionsState].
extension AuctionsStatePatterns on AuctionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuctionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuctionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuctionsState value)  $default,){
final _that = this;
switch (_that) {
case _AuctionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuctionsState value)?  $default,){
final _that = this;
switch (_that) {
case _AuctionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  List<AuctionListItem> auctions,  bool hasMore,  int page,  String? error,  String query,  String? statusFilter,  String? typeFilter,  Wilaya? wilaya)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuctionsState() when $default != null:
return $default(_that.loading,_that.auctions,_that.hasMore,_that.page,_that.error,_that.query,_that.statusFilter,_that.typeFilter,_that.wilaya);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  List<AuctionListItem> auctions,  bool hasMore,  int page,  String? error,  String query,  String? statusFilter,  String? typeFilter,  Wilaya? wilaya)  $default,) {final _that = this;
switch (_that) {
case _AuctionsState():
return $default(_that.loading,_that.auctions,_that.hasMore,_that.page,_that.error,_that.query,_that.statusFilter,_that.typeFilter,_that.wilaya);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  List<AuctionListItem> auctions,  bool hasMore,  int page,  String? error,  String query,  String? statusFilter,  String? typeFilter,  Wilaya? wilaya)?  $default,) {final _that = this;
switch (_that) {
case _AuctionsState() when $default != null:
return $default(_that.loading,_that.auctions,_that.hasMore,_that.page,_that.error,_that.query,_that.statusFilter,_that.typeFilter,_that.wilaya);case _:
  return null;

}
}

}

/// @nodoc


class _AuctionsState implements AuctionsState {
  const _AuctionsState({this.loading = false,  List<AuctionListItem> auctions = const <AuctionListItem>[], this.hasMore = false, this.page = 1, this.error, this.query = '', this.statusFilter, this.typeFilter, this.wilaya}): _auctions = auctions;
  

@override@JsonKey() final  bool loading;
 final  List<AuctionListItem> _auctions;
@override@JsonKey() List<AuctionListItem> get auctions {
  if (_auctions is EqualUnmodifiableListView) return _auctions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_auctions);
}

@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int page;
@override final  String? error;
@override@JsonKey() final  String query;
@override final  String? statusFilter;
@override final  String? typeFilter;
@override final  Wilaya? wilaya;

/// Create a copy of AuctionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuctionsStateCopyWith<_AuctionsState> get copyWith => __$AuctionsStateCopyWithImpl<_AuctionsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuctionsState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.auctions, _auctions)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.error, error) || other.error == error)&&(identical(other.query, query) || other.query == query)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.typeFilter, typeFilter) || other.typeFilter == typeFilter)&&(identical(other.wilaya, wilaya) || other.wilaya == wilaya));
}


@override
int get hashCode {
    return Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(_auctions),hasMore,page,error,query,statusFilter,typeFilter,wilaya);
}

@override
String toString() {
    return 'AuctionsState(loading: $loading, auctions: $auctions, hasMore: $hasMore, page: $page, error: $error, query: $query, statusFilter: $statusFilter, typeFilter: $typeFilter, wilaya: $wilaya)';
}


}

/// @nodoc
abstract mixin class _$AuctionsStateCopyWith<$Res> implements $AuctionsStateCopyWith<$Res> {
  factory _$AuctionsStateCopyWith(_AuctionsState value, $Res Function(_AuctionsState) _then) = __$AuctionsStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, List<AuctionListItem> auctions, bool hasMore, int page, String? error, String query, String? statusFilter, String? typeFilter, Wilaya? wilaya
});




}
/// @nodoc
class __$AuctionsStateCopyWithImpl<$Res>
    implements _$AuctionsStateCopyWith<$Res> {
  __$AuctionsStateCopyWithImpl(this._self, this._then);

  final _AuctionsState _self;
  final $Res Function(_AuctionsState) _then;

/// Create a copy of AuctionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? auctions = null,Object? hasMore = null,Object? page = null,Object? error = freezed,Object? query = null,Object? statusFilter = freezed,Object? typeFilter = freezed,Object? wilaya = freezed,}) {
  return _then(_AuctionsState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,auctions: null == auctions ? _self._auctions : auctions // ignore: cast_nullable_to_non_nullable
as List<AuctionListItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as String?,typeFilter: freezed == typeFilter ? _self.typeFilter : typeFilter // ignore: cast_nullable_to_non_nullable
as String?,wilaya: freezed == wilaya ? _self.wilaya : wilaya // ignore: cast_nullable_to_non_nullable
as Wilaya?,
  ));
}


}

// dart format on
