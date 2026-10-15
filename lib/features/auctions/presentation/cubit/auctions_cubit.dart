import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../kyc/domain/entities/kyc_entities.dart';
import '../../../kyc/domain/usecases/kyc_usecases.dart';
import '../../domain/entities/auction_list_item.dart';
import '../../domain/usecases/get_auctions.dart';

part 'auctions_cubit.freezed.dart';
part 'auctions_state.dart';

/// عدد العناصر المطلوبة في كل صفحة.
/// ملاحظة: **مش** بنستخدمه لتحديد وجود صفحة تالية — ده بيتحدّد من
/// `meta.pagination` (current_page < last_page).
const _kPerPage = 12;

@injectable
class AuctionsCubit extends Cubit<AuctionsState> {
  final GetAuctions _getAuctions;
  final GetWilayas _getWilayas;
  Timer? _debounce;

  // الولايات محلية فقط — لا حاجة لتخزينها في الـ state
  List<Wilaya> _wilayas = [];
  bool _wilayasLoaded = false;

  AuctionsCubit(this._getAuctions, this._getWilayas)
    : super(const AuctionsState());

  List<Wilaya> get wilayas => _wilayas;

  void init() {
    emit(state.copyWith(statusFilter: 'ACTIVE'));
    _fetch(page: 1, reset: true);
  }

  void search(String q) {
    _debounce?.cancel();
    emit(state.copyWith(query: q));
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (isClosed) return;
      _fetch(page: 1, reset: true);
    });
  }

  void setStatus(String? status) {
    emit(state.copyWith(statusFilter: status));
    _fetch(page: 1, reset: true);
  }

  void setType(String? type) {
    emit(state.copyWith(typeFilter: type));
    _fetch(page: 1, reset: true);
  }

  void setWilaya(Wilaya? wilaya) {
    emit(state.copyWith(wilaya: wilaya));
    _fetch(page: 1, reset: true);
  }

  /// يطبّق الفلاتر الثانوية (النوع + الولاية) دفعة واحدة من الـ bottom sheet.
  void applyFilters({String? type, Wilaya? wilaya}) {
    emit(state.copyWith(typeFilter: type, wilaya: wilaya));
    _fetch(page: 1, reset: true);
  }

  /// عدد الفلاتر الثانوية النشطة (يظهر كـ badge على زر التصفية).
  int get activeFilterCount =>
      (state.typeFilter != null ? 1 : 0) + (state.wilaya != null ? 1 : 0);

  void clearFilters() {
    emit(
      state.copyWith(
        query: '',
        statusFilter: 'ACTIVE',
        typeFilter: null,
        wilaya: null,
      ),
    );
    _fetch(page: 1, reset: true);
  }

  Future<void> refresh() => _fetch(page: 1, reset: true);

  Future<void> loadMore() {
    if (state.loading || !state.hasMore) return Future.value();
    return _fetch(page: state.page + 1, reset: false);
  }

  Future<List<Wilaya>> fetchWilayas() async {
    if (_wilayasLoaded) return _wilayas;
    final res = await _getWilayas(const NoParams());
    if (isClosed) return _wilayas;
    res.fold((_) {}, (list) {
      _wilayas = list;
      _wilayasLoaded = true;
    });
    return _wilayas;
  }

  Future<void> _fetch({required int page, required bool reset}) async {
    if (isClosed) return;
    emit(state.copyWith(loading: true, error: null));

    final result = await _getAuctions(
      GetAuctionsParams(
        query: state.query.isEmpty ? null : state.query,
        status: state.statusFilter,
        type: state.typeFilter,
        wilaya: state.wilaya?.id,
        page: page,
        perPage: _kPerPage,
      ),
    );

    if (isClosed) return;
    result.fold(
      (f) => emit(state.copyWith(loading: false, error: f.message)),
      (paged) => emit(
        state.copyWith(
          loading: false,
          auctions: reset ? paged.items : [...state.auctions, ...paged.items],
          // من meta.pagination — مش تخمين من طول القائمة.
          hasMore: paged.hasMore,
          page: paged.currentPage,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
