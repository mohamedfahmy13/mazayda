import 'package:equatable/equatable.dart';

/// أنواع مستندات الـ KYC المسموح رفعها (تطابق قيم الـ API في المسار).
enum KycDocType { idFront, idBack, selfieWithId, photoBiometric }

extension KycDocTypeX on KycDocType {
  /// القيمة اللي بتتبعت في مسار الـ upload: kyc/upload/:type
  String get apiValue => switch (this) {
    KycDocType.idFront => 'id-front',
    KycDocType.idBack => 'id-back',
    KycDocType.selfieWithId => 'selfie-with-id',
    KycDocType.photoBiometric => 'photo-biometric',
  };
}

/// حالة الـ KYC الكلية للحساب.
enum KycAccountStatus { pending, underReview, verified, rejected, unknown }

extension KycAccountStatusX on KycAccountStatus {
  static KycAccountStatus fromApi(String? v) => switch (v) {
    'PENDING' => KycAccountStatus.pending,
    'UNDER_REVIEW' => KycAccountStatus.underReview,
    // الـ backend بيرجّع COMPLETE كحالة التوثيق النهائية (مرادفة لـ VERIFIED).
    'VERIFIED' || 'COMPLETE' => KycAccountStatus.verified,
    'REJECTED' => KycAccountStatus.rejected,
    _ => KycAccountStatus.unknown,
  };
}

/// حالة الـ KYC + المستندات الموجودة + هل يمكن الإرسال.
class KycStatus extends Equatable {
  final KycAccountStatus status;
  final List<String> documentsOnFile; // أنواع المستندات المرفوعة
  final bool canSubmit;

  const KycStatus({
    required this.status,
    this.documentsOnFile = const [],
    this.canSubmit = false,
  });

  bool hasDoc(KycDocType type) => documentsOnFile.contains(type.apiValue);

  @override
  List<Object?> get props => [status, documentsOnFile, canSubmit];
}

/// اسم مكان بكل لغاته (`name_ar` / `name_fr` / `name_en`).
///
/// الاختيار بيتم وقت العرض حسب لغة التطبيق، فتغيير اللغة بيسري من غير ما
/// نجيب القايمة تاني. الإنجليزي لو ناقص بنرجع للاسم اللاتيني (الفرنسي) قبل
/// العربي، لأنه أقرب لقارئ إنجليزي.
class PlaceName extends Equatable {
  final String ar;
  final String fr;
  final String en;
  const PlaceName({this.ar = '', this.fr = '', this.en = ''});

  String forLanguage(String languageCode) {
    final order = switch (languageCode) {
      'ar' => [ar, fr, en],
      'en' => [en, fr, ar],
      _ => [fr, en, ar],
    };
    return order.firstWhere((n) => n.isNotEmpty, orElse: () => '');
  }

  /// البحث بأي لغة: المستخدم ممكن يكتب «Adrar» أو «أدرار».
  bool contains(String query) {
    final q = query.toLowerCase();
    return [ar, fr, en].any((n) => n.toLowerCase().contains(q));
  }

  @override
  List<Object?> get props => [ar, fr, en];
}

/// ولاية (للـ dropdown).
class Wilaya extends Equatable {
  final int id;
  final String code;
  final PlaceName names;
  const Wilaya({required this.id, required this.code, required this.names});

  String nameFor(String languageCode) => names.forLanguage(languageCode);

  @override
  List<Object?> get props => [id, code, names];
}

/// بلدية (للـ dropdown، مرتبطة بولاية).
class Commune extends Equatable {
  final int id;
  final PlaceName names;
  final String? postalCode;
  const Commune({required this.id, required this.names, this.postalCode});

  String nameFor(String languageCode) => names.forLanguage(languageCode);

  @override
  List<Object?> get props => [id, names, postalCode];
}
