import 'dart:async';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import '../constants/api_constants.dart';
import '../network/api_client.dart';
import '../network/token_storage.dart';
import 'locale_cubit.dart';

/// بيبلّغ السيرفر بلغة التطبيق (`PUT /profile {locale}`).
///
/// الإشعارات (داخل التطبيق والـ Push والإيميل) بتتولّد على السيرفر بلغة
/// الحساب المحفوظة (`users.locale`، الافتراضي عربي) مش بلغة الطلب، فمن غير
/// المزامنة دي اللي مختار إنجليزي كان بيستلم إشعاراته بالعربي (MZ-MOB-02).
///
/// الأخطاء بتتبلع بهدوء: ميزة مساندة، وهتتعاد مع أول إقلاع أو تغيير للغة.
@lazySingleton
class LocaleSync {
  final ApiClient _client;
  final TokenStorage _tokenStorage;
  final LocaleCubit _localeCubit;

  LocaleSync(this._client, this._tokenStorage, this._localeCubit);

  StreamSubscription<Locale>? _sub;

  /// مزامنة للجلسة الحالية + متابعة أي تغيير للغة بعد كده.
  /// بيتنادى مرة واحدة عند الإقلاع، بعد تحميل اللغة المحفوظة.
  void start() {
    _sub ??= _localeCubit.stream.listen((_) => sync());
    unawaited(sync());
  }

  /// يبعت اللغة الحالية لو فيه جلسة — وبعد كل تسجيل دخول كمان، لأن اللغة
  /// ممكن تكون اتغيّرت والمستخدم خارج.
  Future<void> sync() async {
    try {
      if (!await _tokenStorage.hasTokens) return;
      await _client.put(
        ApiConstants.profile,
        body: {'locale': _localeCubit.state.languageCode},
      );
    } catch (_) {}
  }
}
