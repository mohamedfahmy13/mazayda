import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/account_deletion.dart';
import '../../domain/usecases/account_deletion_usecases.dart';

part 'account_deletion_cubit.freezed.dart';

@freezed
sealed class AccountDeletionState with _$AccountDeletionState {
  /// بنسأل السيرفر هل الحذف متاح دلوقتي.
  const factory AccountDeletionState.checking() = DeletionChecking;

  const factory AccountDeletionState.checkFailed(String message) =
      DeletionCheckFailed;

  /// فيه موانع — بنعرض رسايلها ومفيش زرار حذف.
  const factory AccountDeletionState.blocked(
    List<DeletionBlocker> blockers, {
    String? message,
  }) = DeletionBlocked;

  /// الحذف متاح — فورم كلمة السر والتأكيد.
  const factory AccountDeletionState.ready({
    @Default(false) bool deleting,
    /// كلمة سر غلط أو ناقصة (422 `errors.password`) — تحت الحقل.
    String? passwordError,
    /// أي رفض تاني (محاولات كتير، شبكة…) — فوق الزرار.
    String? error,
  }) = DeletionReady;

  /// اتحذف — الشاشة بتعرض الرسالة وبترجع للرئيسية كضيف.
  const factory AccountDeletionState.deleted({String? message}) =
      AccountDeletionDone;
}

/// حذف الحساب من جوّه التطبيق (App Store 5.1.1(v)): فحص الموانع الأول، وبعدين
/// تأكيد بكلمة السر.
@injectable
class AccountDeletionCubit extends Cubit<AccountDeletionState> {
  final CheckAccountDeletion _check;
  final DeleteAccount _delete;

  AccountDeletionCubit(this._check, this._delete)
    : super(const AccountDeletionState.checking());

  Future<void> check() async {
    emit(const AccountDeletionState.checking());
    final res = await _check(const NoParams());
    if (isClosed) return;
    res.fold(
      (f) => emit(AccountDeletionState.checkFailed(f.message)),
      (c) => emit(
        c.canDelete
            ? const AccountDeletionState.ready()
            : AccountDeletionState.blocked(c.blockers),
      ),
    );
  }

  Future<void> delete(String password) async {
    final current = state;
    if (current is! DeletionReady || current.deleting) return;
    emit(const AccountDeletionState.ready(deleting: true));

    final res = await _delete(password);
    if (isClosed) return;
    res.fold(
      (f) {
        final passwordError = switch (f) {
          ServerFailure(:final errors) => errors?['password']?.first,
          _ => null,
        };
        emit(
          AccountDeletionState.ready(
            passwordError: passwordError,
            error: passwordError == null ? f.message : null,
          ),
        );
      },
      (r) => emit(switch (r) {
        AccountDeleted(:final message) => AccountDeletionState.deleted(
          message: message,
        ),
        // مانع ظهر بين الفحص والتأكيد (دفعة لسه بادئة مثلًا).
        AccountDeletionBlocked(:final blockers, :final message) =>
          AccountDeletionState.blocked(blockers, message: message),
      }),
    );
  }
}
