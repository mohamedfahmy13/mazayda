import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/token_storage.dart';
import '../../../../core/session/account_cache.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../profile/domain/usecases/get_profile.dart';
import '../../domain/entities/auction_viewer.dart';
import '../../domain/usecases/get_auction_by_id.dart';

part 'auction_detail_cubit.freezed.dart';

/// حالات تفاصيل المزاد.
@freezed
sealed class AuctionDetailState with _$AuctionDetailState {
  const factory AuctionDetailState.initial() = AuctionDetailInitial;
  const factory AuctionDetailState.loading() = AuctionDetailLoading;

  /// [detail] المزاد + سياق المستخدم (لو الـ API رجّعه).
  /// [isAuthenticated] من حالة التطبيق نفسه — مش من الـ API.
  /// [account] أعلام الحساب من البروفايل، بتتجاب فقط لما `viewer` يغيب.
  const factory AuctionDetailState.loaded(
    AuctionDetail detail, {
    @Default(false) bool isAuthenticated,
    ViewerAccountFlags? account,
  }) = AuctionDetailLoaded;

  const factory AuctionDetailState.error(String message) = AuctionDetailError;

  /// السيرفر رجّع 404: مسودة أو اتشالت من العرض. حالة لوحدها عشان
  /// «إعادة المحاولة» مالهاش لازمة هنا — المستخدم محتاج يرجع بس.
  const factory AuctionDetailState.unavailable() = AuctionDetailUnavailable;
}

@injectable
class AuctionDetailCubit extends Cubit<AuctionDetailState> {
  final GetAuctionById _getAuctionById;
  final GetProfile _getProfile;
  final TokenStorage _tokenStorage;
  final AccountCache _accountCache;

  AuctionDetailCubit(
    this._getAuctionById,
    this._getProfile,
    this._tokenStorage,
    this._accountCache,
  ) : super(const AuctionDetailState.initial());

  Future<void> load(String id) async {
    emit(const AuctionDetailState.loading());

    final result = await _getAuctionById(id);
    if (isClosed) return;

    await result.fold(
      (failure) async => emit(
        failure is ServerFailure && failure.statusCode == 404
            ? const AuctionDetailState.unavailable()
            : AuctionDetailState.error(failure.message),
      ),
      (detail) async {
        final isAuthed = await _tokenStorage.hasTokens;
        if (isClosed) return;

        // بعد BE-15 الـ viewer بيتعبّى عادي للمستخدم المسجّل، فالفرع ده
        // بقى استثناء: بيحصل لو التوكن منتهي/مش `access` — المصادقة على
        // المسار اختيارية فبتعدّينا كضيوف بدون 401. ساعتها بنجيب أعلام
        // الحساب من البروفايل (مسار مصادَق، فبيجدّد التوكن لو محتاج) عشان
        // بوابات الحساب تفضل دقيقة بدل وضع محدود.
        ViewerAccountFlags? account;
        if (isAuthed && detail.viewer == null) {
          final profileRes = await _getProfile(const NoParams());
          if (isClosed) return;
          account = profileRes.fold(
            (_) => null, // فشل البروفايل ما يمنعش عرض الصفحة
            (p) => ViewerAccountFlags(
              canBid: p.canBid,
              isKycComplete: p.isKycComplete,
              hasCommerceRegister: p.hasCommerceRegister,
              isBlacklisted: p.isBlacklisted,
              isStaff: AccountRoles.isStaff(p.role),
            ),
          );
        } else if (isAuthed) {
          // `meta.viewer` بقى بيرجّع الدور نفسه، فـ`ctaFor` بيقرا
          // `viewer.isStaff` مباشرة ومش محتاجين لا نداء بروفايل ولا الكاش.
          //
          // بنحدّث الكاش من الرد بدل ما نقرا منه: ده بيخلّي أي شاشة تانية
          // لسه بتعتمد عليه تشوف الدور الحالي بدل نسخة قديمة.
          final viewer = detail.viewer;
          if (viewer?.role != null) {
            await _accountCache.save(
              role: viewer!.role,
              isPremium: viewer.isPremium,
            );
            if (isClosed) return;
          }
        }

        emit(
          AuctionDetailState.loaded(
            detail,
            isAuthenticated: isAuthed,
            account: account,
          ),
        );
      },
    );
  }
}
