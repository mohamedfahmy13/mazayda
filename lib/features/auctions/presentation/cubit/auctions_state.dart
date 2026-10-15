part of 'auctions_cubit.dart';

@freezed
abstract class AuctionsState with _$AuctionsState {
  const factory AuctionsState({
    @Default(false) bool loading,
    @Default(<AuctionListItem>[]) List<AuctionListItem> auctions,
    @Default(false) bool hasMore,
    @Default(1) int page,
    String? error,
    // فلاتر نشطة
    @Default('') String query,
    String? statusFilter,
    String? typeFilter,
    // الولاية نفسها مش اسمها: الاسم بيتحسب وقت العرض بلغة التطبيق، فشارة
    // الفلتر بتتبدّل مع اللغة.
    Wilaya? wilaya,
  }) = _AuctionsState;
}
