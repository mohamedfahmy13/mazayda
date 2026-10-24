import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failures.dart';
import '../entities/kyc_entities.dart';

part 'kyc_repository.freezed.dart';

/// عقد الـ KYC repository.
abstract class KycRepository {
  /// حالة الـ KYC الحالية.
  Future<Either<Failure, KycStatus>> getStatus();

  /// رفع مستند واحد (ملف). [filePath] مسار الملف على الجهاز.
  Future<Either<Failure, Unit>> uploadDocument({
    required KycDocType type,
    required String filePath,
  });

  /// إرسال نموذج الـ KYC للمراجعة → الحساب يصبح UNDER_REVIEW.
  Future<Either<Failure, Unit>> submit(KycSubmitParams params);

  /// قوائم جغرافية (للـ dropdowns).
  Future<Either<Failure, List<Wilaya>>> getWilayas();
  Future<Either<Failure, List<Commune>>> getCommunes(int wilayaId);
}

/// مدخلات إرسال نموذج الـ KYC — تطابق body الـ API.
///
/// [nin] و[birthDate] بيتبعتوا بس لو الحساب ناقصهم (اختياريين عند التسجيل
/// من الموبايل — App Store 5.1.1). السيرفر بيحفظهم مرة واحدة ومابيغيّرهمش
/// بعد كده، فبعتهم لحساب عنده قيمة بيتجاهل.
@freezed
abstract class KycSubmitParams with _$KycSubmitParams {
  const factory KycSubmitParams({
    String? nin,
    String? birthDate, // Y-m-d
    required String firstNameFr,
    required String lastNameFr,
    required String fatherName,
    required String motherName,
    required String motherSurname,
    required String address,
    required int wilayaId,
    required int communeId,
    required String postalCode,
    required String profession,
    required int expectedIncome,
    @Default('ID_CARD') String idType,
    required String idNumber,
  }) = _KycSubmitParams;
}
