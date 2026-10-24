import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/usecases/login_user.dart' show LogoutUser;
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/update_profile.dart';

part 'profile_cubit.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded(
    Profile profile, {
    @Default(false) bool saving,
  }) = ProfileLoaded;
  const factory ProfileState.error(String message) = ProfileError;
}

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile _getProfile;
  final UpdateProfile _updateProfile;
  final LogoutUser _logout;

  ProfileCubit(this._getProfile, this._updateProfile, this._logout)
    : super(const ProfileState.loading());

  Future<void> load() async {
    emit(const ProfileState.loading());
    final res = await _getProfile(const NoParams());
    res.fold(
      (f) => emit(ProfileState.error(f.message)),
      (p) => emit(ProfileState.loaded(p)),
    );
  }

  Future<void> update(UpdateProfileParams params) async {
    final current = state;
    if (current is! ProfileLoaded) return;
    emit(ProfileState.loaded(current.profile, saving: true));
    final res = await _updateProfile(params);
    res.fold(
      (f) => emit(ProfileState.error(f.message)),
      (p) => emit(ProfileState.loaded(p)),
    );
  }

  /// الخروج — التطبيق بيكمّل كضيف. التنقّل مسؤولية الشاشة: التبويب نفسه
  /// بيتقلب لطلب تسجيل الدخول، والـ Cubit ده بيتقفل معاه.
  Future<void> logout() async {
    await _logout(false);
  }
}
