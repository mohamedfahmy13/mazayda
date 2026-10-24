// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_deletion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeletionBlockerModel _$DeletionBlockerModelFromJson(
  Map<String, dynamic> json,
) => _DeletionBlockerModel(
  code: json['code'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$DeletionBlockerModelToJson(
  _DeletionBlockerModel instance,
) => <String, dynamic>{'code': instance.code, 'message': instance.message};

_AccountDeletionCheckModel _$AccountDeletionCheckModelFromJson(
  Map<String, dynamic> json,
) => _AccountDeletionCheckModel(
  canDelete: json['can_delete'] as bool? ?? false,
  blockers:
      (json['blockers'] as List<dynamic>?)
          ?.map((e) => DeletionBlockerModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DeletionBlockerModel>[],
);

Map<String, dynamic> _$AccountDeletionCheckModelToJson(
  _AccountDeletionCheckModel instance,
) => <String, dynamic>{
  'can_delete': instance.canDelete,
  'blockers': instance.blockers,
};
