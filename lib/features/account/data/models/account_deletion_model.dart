import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/account_deletion.dart';

part 'account_deletion_model.freezed.dart';
part 'account_deletion_model.g.dart';

/// مانع حذف — `{code, message}`.
@freezed
abstract class DeletionBlockerModel with _$DeletionBlockerModel {
  const DeletionBlockerModel._();

  const factory DeletionBlockerModel({
    @Default('') String code,
    @Default('') String message,
  }) = _DeletionBlockerModel;

  factory DeletionBlockerModel.fromJson(Map<String, dynamic> json) =>
      _$DeletionBlockerModelFromJson(json);

  DeletionBlocker toEntity() => DeletionBlocker(code: code, message: message);
}

/// `GET /account/deletion-check` → `data: {can_delete, blockers}`.
///
/// نفس الشكل بييجي جوّه `data` في رفض الحذف (422 `ACCOUNT_DELETION_BLOCKED`)،
/// فالموديل ده بيقرا الاتنين.
@freezed
abstract class AccountDeletionCheckModel with _$AccountDeletionCheckModel {
  const AccountDeletionCheckModel._();

  const factory AccountDeletionCheckModel({
    @JsonKey(name: 'can_delete') @Default(false) bool canDelete,
    @Default(<DeletionBlockerModel>[]) List<DeletionBlockerModel> blockers,
  }) = _AccountDeletionCheckModel;

  factory AccountDeletionCheckModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDeletionCheckModelFromJson(json);

  List<DeletionBlocker> get blockerEntities =>
      blockers.map((b) => b.toEntity()).toList();

  /// مانع واحد كفاية يقفل الحذف، حتى لو `can_delete` جه غلط.
  AccountDeletionCheck toEntity() => AccountDeletionCheck(
    canDelete: canDelete && blockers.isEmpty,
    blockers: blockerEntities,
  );
}
