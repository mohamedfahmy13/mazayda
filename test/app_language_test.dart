// MZ-MOB-02 · 03 — لغة التطبيق لازم توصل للسيرفر: في كل طلب، وعلى الحساب نفسه
// (الإشعارات بتتولّد بلغة الحساب)، والنص اللي ييجي بلغة تانية يتعرض صح.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mazayada/core/network/api_client.dart';
import 'package:mazayada/core/network/auth_interceptor.dart';
import 'package:mazayada/core/network/token_storage.dart';
import 'package:mazayada/core/session/session_manager.dart';
import 'package:mazayada/core/utils/locale_cubit.dart';
import 'package:mazayada/core/utils/locale_sync.dart';
import 'package:mazayada/features/auctions/presentation/widgets/auction_filter_sheet.dart';
import 'package:mazayada/features/kyc/data/models/kyc_models.dart';
import 'package:mazayada/features/notifications/domain/entities/app_notification.dart';
import 'package:mazayada/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:mazayada/l10n/app_localizations.dart';

class _RecordingApi implements ApiClient {
  final puts = <Object?>[];

  @override
  Future<dynamic> put(String path, {dynamic body}) async => puts.add(body);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeTokens implements TokenStorage {
  final bool signedIn;
  _FakeTokens({required this.signedIn});

  @override
  Future<bool> get hasTokens async => signedIn;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  test('Accept-Language بيتبعت بلغة التطبيق وقت الطلب', () {
    var language = 'en';
    final interceptor = AuthInterceptor(
      TokenStorage(const FlutterSecureStorage()),
      Dio(),
      SessionManager(),
      () => language,
    );

    final first = RequestOptions(path: '/api/v1/notifications');
    interceptor.onRequest(first, RequestInterceptorHandler());
    expect(first.headers['Accept-Language'], 'en');

    language = 'fr';
    final second = RequestOptions(path: '/api/v1/notifications');
    interceptor.onRequest(second, RequestInterceptorHandler());
    expect(second.headers['Accept-Language'], 'fr');
  });

  group('LocaleSync', () {
    test('بيحفظ اللغة على الحساب عند الإقلاع ومع كل تغيير', () async {
      final locale = LocaleCubit(const FlutterSecureStorage());
      final api = _RecordingApi();
      LocaleSync(api, _FakeTokens(signedIn: true), locale).start();
      await pumpEventQueue();
      expect(api.puts, [
        {'locale': 'ar'},
      ]);

      await locale.setLocale('en');
      await pumpEventQueue();
      expect(api.puts.last, {'locale': 'en'});
    });

    test('من غير جلسة مابيبعتش حاجة', () async {
      final locale = LocaleCubit(const FlutterSecureStorage());
      final api = _RecordingApi();
      LocaleSync(api, _FakeTokens(signedIn: false), locale).start();
      await locale.setLocale('en');
      await pumpEventQueue();
      expect(api.puts, isEmpty);
    });
  });

  testWidgets('إشعار عربي جوّه واجهة إنجليزي بيتعرض RTL', (tester) async {
    const arabic = 'تم استرداد كفالتك بمبلغ 90 دج عن مزايدة «فهمي».';
    const english = 'Your deposit was refunded.';

    await tester.pumpWidget(
      _host(
        NotificationTile(
          notification: AppNotification(
            id: 'n1',
            title: english,
            body: arabic,
            isRead: true,
            createdAt: DateTime(2026, 8, 14),
          ),
          onTap: () {},
        ),
      ),
    );
    await tester.pump();

    TextDirection directionOf(String text) =>
        tester.renderObject<RenderParagraph>(find.text(text)).textDirection;

    expect(directionOf(arabic), TextDirection.rtl);
    expect(directionOf(english), TextDirection.ltr);
  });

  group('MZ-MOB-03 — أسماء الولايات بلغة التطبيق', () {
    final algiers = WilayaModel.fromJson(const {
      'id': 16,
      'code': '16',
      'name_ar': 'الجزائر',
      'name_fr': 'Alger',
    }).toEntity();

    test('كل لغة باسمها، والإنجليزي بيرجع للاسم اللاتيني', () {
      expect(algiers.nameFor('ar'), 'الجزائر');
      expect(algiers.nameFor('fr'), 'Alger');
      expect(algiers.nameFor('en'), 'Alger');
    });

    test('name_en بيتقري لما الباك يبعته', () {
      final withEnglish = WilayaModel.fromJson(const {
        'id': 16,
        'code': '16',
        'name_ar': 'الجزائر',
        'name_fr': 'Alger',
        'name_en': 'Algiers',
      }).toEntity();
      expect(withEnglish.nameFor('en'), 'Algiers');
      expect(withEnglish.nameFor('fr'), 'Alger');
    });

    test('البحث بيلاقي الولاية بأي لغة', () {
      expect(algiers.names.contains('ALG'), isTrue);
      expect(algiers.names.contains('الجز'), isTrue);
      expect(algiers.names.contains('Oran'), isFalse);
    });

    testWidgets('شاشة الفلتر بالإنجليزي بتعرض الاسم اللاتيني', (tester) async {
      await tester.pumpWidget(
        _host(
          AuctionFilterSheet(
            wilayas: [algiers],
            initialType: null,
            initialWilaya: null,
            onApply: (_, _) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Alger'), findsOneWidget);
      expect(find.text('الجزائر'), findsNothing);
    });
  });
}

Widget _host(Widget child, {String locale = 'en'}) => ScreenUtilInit(
  designSize: const Size(375, 812),
  child: MaterialApp(
    locale: Locale(locale),
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  ),
);
