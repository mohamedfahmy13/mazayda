import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/kyc_entities.dart';

part 'kyc_models.freezed.dart';
part 'kyc_models.g.dart';

/// حالة الـ KYC من GET /kyc.
@freezed
abstract class KycStatusModel with _$KycStatusModel {
  const KycStatusModel._();

  const factory KycStatusModel({
    String? status,
    // قد يرجع الـ API المستندات كـ array قديمًا، أو كـ map {id-front: true, ...} حاليًا.
    @JsonKey(name: 'documents_on_file')
    @Default(<String>[])
    List<String> documentsOnFile,
    @JsonKey(name: 'documents')
    @Default(<String, dynamic>{})
    Map<String, dynamic> documents,
    @JsonKey(name: 'can_submit') @Default(false) bool canSubmit,
  }) = _KycStatusModel;

  factory KycStatusModel.fromJson(Map<String, dynamic> json) =>
      _$KycStatusModelFromJson(json);

  KycStatus toEntity() => KycStatus(
    status: KycAccountStatusX.fromApi(status),
    documentsOnFile: _resolveDocuments(),
    canSubmit: canSubmit,
  );

  /// يدمج الشكلين: array مباشر، أو map بأنواع المستندات اللي قيمتها true.
  List<String> _resolveDocuments() => [
    ...documentsOnFile,
    for (final entry in documents.entries)
      if (entry.value == true) entry.key,
  ];
}

/// ولاية — GET /wilayas (بترجع name_ar / name_fr، و`name_en` لما الباك يضيفه).
@freezed
abstract class WilayaModel with _$WilayaModel {
  const WilayaModel._();

  const factory WilayaModel({
    required int id,
    @Default('') String code,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_fr') String? nameFr,
    @JsonKey(name: 'name_en') String? nameEn,
  }) = _WilayaModel;

  factory WilayaModel.fromJson(Map<String, dynamic> json) =>
      _$WilayaModelFromJson(json);

  Wilaya toEntity() => Wilaya(
    id: id,
    code: code,
    names: PlaceName(ar: nameAr ?? '', fr: nameFr ?? '', en: nameEn ?? ''),
  );
}

/// بلدية — GET /wilayas/:id/communes.
@freezed
abstract class CommuneModel with _$CommuneModel {
  const CommuneModel._();

  const factory CommuneModel({
    required int id,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_fr') String? nameFr,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'postal_code') String? postalCode,
  }) = _CommuneModel;

  factory CommuneModel.fromJson(Map<String, dynamic> json) =>
      _$CommuneModelFromJson(json);

  Commune toEntity() => Commune(
    id: id,
    names: PlaceName(ar: nameAr ?? '', fr: nameFr ?? '', en: nameEn ?? ''),
    postalCode: postalCode,
  );
}
