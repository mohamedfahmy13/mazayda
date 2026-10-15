// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KycStatusModel _$KycStatusModelFromJson(Map<String, dynamic> json) =>
    _KycStatusModel(
      status: json['status'] as String?,
      documentsOnFile:
          (json['documents_on_file'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      documents:
          json['documents'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
      canSubmit: json['can_submit'] as bool? ?? false,
    );

Map<String, dynamic> _$KycStatusModelToJson(_KycStatusModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'documents_on_file': instance.documentsOnFile,
      'documents': instance.documents,
      'can_submit': instance.canSubmit,
    };

_WilayaModel _$WilayaModelFromJson(Map<String, dynamic> json) => _WilayaModel(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String? ?? '',
  nameAr: json['name_ar'] as String?,
  nameFr: json['name_fr'] as String?,
  nameEn: json['name_en'] as String?,
);

Map<String, dynamic> _$WilayaModelToJson(_WilayaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name_ar': instance.nameAr,
      'name_fr': instance.nameFr,
      'name_en': instance.nameEn,
    };

_CommuneModel _$CommuneModelFromJson(Map<String, dynamic> json) =>
    _CommuneModel(
      id: (json['id'] as num).toInt(),
      nameAr: json['name_ar'] as String?,
      nameFr: json['name_fr'] as String?,
      nameEn: json['name_en'] as String?,
      postalCode: json['postal_code'] as String?,
    );

Map<String, dynamic> _$CommuneModelToJson(_CommuneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_fr': instance.nameFr,
      'name_en': instance.nameEn,
      'postal_code': instance.postalCode,
    };
