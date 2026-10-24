/// استثناءات على مستوى الـ data layer.
/// الـ DataSource بيرميها، والـ Repository بيمسكها ويحوّلها لـ Failure.
library;

class ServerException implements Exception {
  final String message;
  final int? statusCode;
  final Map<String, List<String>>? errors;

  /// كود خطأ يتقري من الباك (مثال: `already_bought_book`).
  /// اختياري — الباك لسه بيرجّع الرسالة النصية بس في بعض المسارات
  /// (طلب BE-16)، فالكود ممكن يكون null ووقتها بنرجع للنص.
  final String? code;

  /// جزء `data` من ردّ الخطأ لو الباك بعته — رفض بيحمل تفاصيل لازم تتعرض،
  /// زي موانع حذف الحساب (`ACCOUNT_DELETION_BLOCKED` → `data.blockers`).
  final Object? data;

  ServerException({
    required this.message,
    this.statusCode,
    this.errors,
    this.code,
    this.data,
  });
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'لا يوجد اتصال بالإنترنت']);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = 'انتهت الجلسة']);
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = 'خطأ في التخزين المحلي']);
}
