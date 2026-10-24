// متطلبات مراجعة App Store (رفض iOS 1.0) — الباك 755c7ae · 2f5dba8 · 2709c36 · 75fc936:
// تصفّح كضيف، حذف الحساب من جوّه التطبيق، والرقم الوطني وتاريخ الميلاد
// اختياريين عند التسجيل وبيتطلبوا في الـ KYC.

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mazayada/core/constants/api_constants.dart';
import 'package:mazayada/core/di/injection.dart';
import 'package:mazayada/core/errors/exceptions.dart';
import 'package:mazayada/core/errors/failures.dart';
import 'package:mazayada/core/network/api_client.dart';
import 'package:mazayada/core/network/token_storage.dart';
import 'package:mazayada/core/notifications/device_registrar.dart';
import 'package:mazayada/core/router/app_router.dart';
import 'package:mazayada/core/session/account_cache.dart';
import 'package:mazayada/core/session/session_exit_router.dart';
import 'package:mazayada/core/session/session_manager.dart';
import 'package:mazayada/core/utils/locale_sync.dart';
import 'package:mazayada/core/widgets/signed_in_gate.dart';
import 'package:mazayada/features/account/data/datasources/account_remote_data_source.dart';
import 'package:mazayada/features/account/data/models/account_deletion_model.dart';
import 'package:mazayada/features/account/data/repositories/account_repository_impl.dart';
import 'package:mazayada/features/account/domain/entities/account_deletion.dart';
import 'package:mazayada/features/account/domain/usecases/account_deletion_usecases.dart';
import 'package:mazayada/features/account/presentation/cubit/account_deletion_cubit.dart';
import 'package:mazayada/features/account/presentation/widgets/deletion_blockers_view.dart';
import 'package:mazayada/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mazayada/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mazayada/features/auth/presentation/formz/auth_inputs.dart';
import 'package:mazayada/features/kyc/data/datasources/kyc_remote_data_source.dart';
import 'package:mazayada/features/kyc/data/repositories/kyc_repository_impl.dart';
import 'package:mazayada/features/kyc/domain/repositories/kyc_repository.dart';
import 'package:mazayada/features/kyc/presentation/widgets/kyc_form.dart';
import 'package:mazayada/features/profile/data/models/profile_model.dart';
import 'package:mazayada/features/profile/domain/entities/profile.dart';
import 'package:mazayada/l10n/app_localizations.dart';
import 'package:mazayada/l10n/app_localizations_en.dart';

final _en = AppLocalizationsEn();

// ===== أدوات =====

const _storage = FlutterSecureStorage();

({TokenStorage tokens, SessionManager session}) _session() {
  final tokens = TokenStorage(_storage);
  return (tokens: tokens, session: SessionManager(tokens, AccountCache(_storage)));
}

/// بيسجّل جسم كل POST ويرجّع رد يكفي المسارات اللي بنختبرها.
class _RecordingApi implements ApiClient {
  final posts = <String, Object?>{};

  @override
  Future<dynamic> post(String path, {dynamic body}) async {
    posts[path] = body;
    return {'user_id': 'u-1', 'question': 'mother_maiden'};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _NoopRegistrar implements DeviceRegistrar {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _NoopLocaleSync implements LocaleSync {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _RecordingKycRemote implements KycRemoteDataSource {
  Map<String, dynamic>? submitted;

  @override
  Future<void> submit(Map<String, dynamic> body) async => submitted = body;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// مصدر حذف الحساب: النتيجة إما قيمة أو استثناء بيترمي.
class _FakeAccountRemote implements AccountRemoteDataSource {
  Object? check;
  Object? delete;
  String? sentPassword;

  @override
  Future<AccountDeletionCheckModel> checkDeletion() async {
    final r = check;
    if (r is Exception) throw r;
    return r! as AccountDeletionCheckModel;
  }

  @override
  Future<String?> deleteAccount(String password) async {
    sentPassword = password;
    final r = delete;
    if (r is Exception) throw r;
    return r as String?;
  }
}

ServerException _blocked() => ServerException(
  message: 'لا يمكن حذف الحساب حالياً.',
  statusCode: 422,
  code: 'ACCOUNT_DELETION_BLOCKED',
  data: {
    'blockers': [
      {'code': 'active_participation', 'message': 'أنت مسجّل في مزاد…'},
    ],
  },
);

Widget _host(Widget child) => ScreenUtilInit(
  designSize: const Size(375, 812),
  child: MaterialApp(
    locale: const Locale('en'),
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

void main() {
  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  // ===== 1) Guest mode =====

  group('SessionManager — مصدر «مسجّل ولا ضيف»', () {
    test('restore بيقرا الجلسة المحفوظة', () async {
      FlutterSecureStorage.setMockInitialValues({'access_token': 'a'});
      final s = _session().session;
      await s.restore();
      expect(s.isSignedIn, isTrue);
    });

    test('end بيمسح التوكنات وكاش الحساب ويرجّع ضيف', () async {
      final (:tokens, :session) = _session();
      await tokens.saveTokens(accessToken: 'a', refreshToken: 'r');
      await AccountCache(_storage).save(role: 'CITIZEN', isPremium: true);
      session.signedIn();

      var notified = 0;
      session.addListener(() => notified++);
      await session.end();

      expect(session.isSignedIn, isFalse);
      expect(await tokens.hasTokens, isFalse);
      expect(await AccountCache(_storage).role, isNull);
      expect(notified, 1);
    });

    test('expire بيبلّغ مرة واحدة بس، والضيف مالوش جلسة تنتهي', () async {
      final session = _session().session;
      var expired = 0;
      session.onSessionExpired.listen((_) => expired++);

      await session.expire(); // ضيف
      session.signedIn();
      await Future.wait([session.expire(), session.expire()]); // 401 مزدوج
      await pumpEventQueue();

      expect(session.isSignedIn, isFalse);
      expect(expired, 1);
    });
  });

  group('شاشات الحساب بس هي اللي محتاجة دخول', () {
    test('requiresAccount', () {
      for (final path in [
        Routes.kyc,
        '${Routes.liveBidding}/a1',
        Routes.documents,
        Routes.deleteAccount,
        Routes.notificationPreferences,
      ]) {
        expect(Routes.requiresAccount(path), isTrue, reason: path);
      }
      for (final path in [
        Routes.home,
        '${Routes.auctionDetail}/a1',
        Routes.notifications,
        Routes.profile,
        Routes.myAuctions,
        Routes.login,
      ]) {
        expect(Routes.requiresAccount(path), isFalse, reason: path);
      }
    });

    test('الضيف على شاشة حساب → الدخول ومعاه الوجهة', () {
      expect(
        signInRedirect(
          signedIn: false,
          matchedLocation: Routes.appeals,
          uri: Uri.parse(Routes.appeals),
        ),
        '${Routes.login}?from=%2Fappeals',
      );
      expect(
        signInRedirect(
          signedIn: true,
          matchedLocation: Routes.appeals,
          uri: Uri.parse(Routes.appeals),
        ),
        isNull,
      );
      expect(
        signInRedirect(
          signedIn: false,
          matchedLocation: '${Routes.auctionDetail}/a1',
          uri: Uri.parse('${Routes.auctionDetail}/a1'),
        ),
        isNull,
        reason: 'تفاصيل المزاد متاحة للضيف',
      );
    });
  });

  group('SessionExitRouter', () {
    late SessionManager session;
    late GoRouter router;
    late SessionExitRouter exits;
    final messenger = GlobalKey<ScaffoldMessengerState>();

    Future<void> pumpRouter(WidgetTester tester) async {
      session = _session().session..signedIn();
      // Scaffold: الـ SnackBar بيتعرض على أقرب Scaffold — زي أي شاشة في التطبيق.
      Widget page(String name) => Scaffold(body: Text(name));
      router = GoRouter(
        initialLocation: Routes.home,
        routes: [
          GoRoute(path: Routes.home, builder: (_, _) => page('home')),
          GoRoute(path: Routes.kyc, builder: (_, _) => page('kyc')),
          GoRoute(
            path: '${Routes.auctionDetail}/:id',
            builder: (_, _) => page('auction'),
          ),
        ],
      );
      exits = SessionExitRouter(router, session, messenger)..start();
      addTearDown(exits.dispose);
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
          scaffoldMessengerKey: messenger,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );
    }

    testWidgets('الجلسة خلصت على شاشة حساب → الرئيسية كضيف', (tester) async {
      await pumpRouter(tester);
      router.push(Routes.kyc);
      await tester.pumpAndSettle();
      expect(find.text('kyc'), findsOneWidget);

      await session.end();
      await tester.pumpAndSettle();
      expect(find.text('home'), findsOneWidget);
    });

    testWidgets('على شاشة متاحة للضيف بيفضل مكانه، والانتهاء بيتبلّغ', (
      tester,
    ) async {
      await pumpRouter(tester);
      router.push('${Routes.auctionDetail}/a1');
      await tester.pumpAndSettle();

      await session.expire();
      await tester.pump();
      await tester.pump();

      expect(find.text('auction'), findsOneWidget);
      expect(find.text(_en.sessionExpiredNotice), findsOneWidget);
    });
  });

  group('SignedInGate', () {
    late SessionManager session;

    setUp(() async {
      session = _session().session;
      if (getIt.isRegistered<SessionManager>()) {
        await getIt.unregister<SessionManager>();
      }
      getIt.registerSingleton<SessionManager>(session);
    });
    tearDown(() => getIt.unregister<SessionManager>());

    testWidgets('الضيف بيشوف طلب الدخول، وبعد الدخول المحتوى', (tester) async {
      await tester.pumpWidget(
        _host(
          SignedInGate(
            title: 'My Auctions',
            icon: Icons.gavel,
            message: _en.guestMyAuctionsBody,
            builder: (_) => const Text('content'),
          ),
        ),
      );
      expect(find.text(_en.guestPromptTitle), findsOneWidget);
      expect(find.text(_en.guestMyAuctionsBody), findsOneWidget);
      expect(find.text('content'), findsNothing);

      session.signedIn();
      await tester.pump();
      expect(find.text('content'), findsOneWidget);

      await session.end();
      await tester.pump();
      expect(find.text(_en.guestPromptTitle), findsOneWidget);
    });
  });

  // ===== 2) الرقم الوطني وتاريخ الميلاد اختياريين =====

  group('التسجيل والاسترجاع من غير رقم تعريف', () {
    test('التسجيل مابيبعتش nin ولا birth_date', () async {
      final api = _RecordingApi();
      final (:tokens, :session) = _session();
      final repo = AuthRepositoryImpl(
        AuthRemoteDataSourceImpl(api),
        tokens,
        _NoopRegistrar(),
        session,
        _NoopLocaleSync(),
      );

      final res = await repo.register(
        firstNameAr: 'سعيد',
        lastNameAr: 'بن أحمد',
        phone: '0555123456',
        email: 'said@example.com',
        password: 'StrongP@ss123',
        passwordConfirmation: 'StrongP@ss123',
        deviceName: 'mobile',
      );

      expect(res.isRight(), isTrue);
      final body = api.posts[ApiConstants.register]! as Map;
      expect(body.containsKey('nin'), isFalse);
      expect(body.containsKey('birth_date'), isFalse);
    });

    test('الاسترجاع بالبريد لوحده، والرقم بيتبعت لو اتكتب', () async {
      final api = _RecordingApi();
      final remote = AuthRemoteDataSourceImpl(api);

      await remote.requestPasswordReset(email: 'said@example.com');
      expect(api.posts[ApiConstants.passwordRequest], {
        'email': 'said@example.com',
      });

      await remote.revealSecretQuestion(
        nin: '109870123456789012',
        email: 'said@example.com',
      );
      expect(api.posts[ApiConstants.recoverReveal], {
        'nin': '109870123456789012',
        'email': 'said@example.com',
      });
    });

    test('OptionalNinInput: الفاضي صالح، والمكتوب 18 رقم', () {
      expect(const OptionalNinInput.pure().isValid, isTrue);
      expect(OptionalNinInput.dirty('').valueOrNull, isNull);
      expect(OptionalNinInput.dirty('12345').isValid, isFalse);

      final arabic = OptionalNinInput.dirty('١٠٩٨٧٠١٢٣٤٥٦٧٨٩٠١٢');
      expect(arabic.isValid, isTrue);
      expect(arabic.valueOrNull, '109870123456789012');
    });
  });

  group('identity_complete في البروفايل', () {
    Profile parse(Map<String, dynamic> extra) => ProfileModel.fromJson({
      'id': 'u-1',
      ...extra,
    }).toEntity();

    test('حساب من غير رقم ولا تاريخ ميلاد', () {
      final p = parse({
        'nin_masked': null,
        'birth_date': null,
        'identity_complete': false,
      });
      expect(p.identityComplete, isFalse);
      expect(p.needsNin, isTrue);
      expect(p.needsBirthDate, isTrue);
    });

    test('رد قديم من غير الحقل → بيتشتق من الحقلين', () {
      final p = parse({'nin_masked': '1098****9012', 'birth_date': '1990-05-12'});
      expect(p.identityComplete, isTrue);
      expect(p.needsNin, isFalse);
      expect(parse({'nin_masked': '1098****9012'}).identityComplete, isFalse);
    });
  });

  group('الـ KYC بيطلب الناقص بس', () {
    test('الرقم وتاريخ الميلاد في الجسم لما يتبعتوا بس', () async {
      final remote = _RecordingKycRemote();
      final repo = KycRepositoryImpl(remote);
      const base = KycSubmitParams(
        firstNameFr: 'Said',
        lastNameFr: 'Benahmed',
        fatherName: 'Ali',
        motherName: 'Fatima',
        motherSurname: 'Kaci',
        address: 'Rue 1',
        wilayaId: 16,
        communeId: 1601,
        postalCode: '16000',
        profession: 'Ingénieur',
        expectedIncome: 100000,
        idNumber: '123456789',
      );

      await repo.submit(base);
      expect(remote.submitted!.containsKey('nin'), isFalse);
      expect(remote.submitted!.containsKey('birth_date'), isFalse);

      await repo.submit(
        base.copyWith(nin: '109870123456789012', birthDate: '1990-05-12'),
      );
      expect(remote.submitted!['nin'], '109870123456789012');
      expect(remote.submitted!['birth_date'], '1990-05-12');
    });

    Widget form({Profile? prefill, Map<String, List<String>>? errors}) =>
        _host(
          SingleChildScrollView(
            child: KycForm(
              wilayas: const [],
              communes: const [],
              prefill: prefill,
              fieldErrors: errors,
              submitting: false,
              canSubmit: true,
              onWilayaSelected: (_) {},
              onSubmit: (_) {},
            ),
          ),
        );

    testWidgets('حساب ناقصه الاتنين → الحقلين ظاهرين', (tester) async {
      await tester.pumpWidget(
        form(prefill: const Profile(id: 'u-1', fullName: 'Said')),
      );
      expect(find.text(_en.kycIdentityMissingHint), findsOneWidget);
      expect(find.text(_en.nin), findsOneWidget);
      expect(find.text(_en.birthDate), findsOneWidget);
    });

    testWidgets('حساب كامل → مفيش حقول هوية', (tester) async {
      await tester.pumpWidget(
        form(
          prefill: const Profile(
            id: 'u-1',
            fullName: 'Said',
            ninMasked: '1098****9012',
            birthDate: '1990-05-12',
          ),
        ),
      );
      expect(find.text(_en.kycIdentityMissingHint), findsNothing);
      expect(find.text(_en.nin), findsNothing);
    });

    testWidgets('البروفايل فشل → الحقل بيظهر لما السيرفر يطلبه', (
      tester,
    ) async {
      await tester.pumpWidget(form());
      expect(find.text(_en.nin), findsNothing);

      await tester.pumpWidget(
        form(
          errors: {
            'nin': ['The nin field is required.'],
          },
        ),
      );
      expect(find.text(_en.nin), findsOneWidget);
      expect(find.text('The nin field is required.'), findsOneWidget);
    });
  });

  // ===== 3) حذف الحساب =====

  group('حذف الحساب — الـ repository', () {
    test('النجاح بيمسح الجلسة المحلية من غير أي نداء تاني', () async {
      final (:tokens, :session) = _session();
      await tokens.saveTokens(accessToken: 'a', refreshToken: 'r');
      session.signedIn();
      final remote = _FakeAccountRemote()..delete = 'تم حذف حسابك نهائياً.';

      final res = await AccountRepositoryImpl(
        remote,
        session,
      ).deleteAccount(password: 'StrongP@ss123');

      expect(
        res,
        const Right<Failure, AccountDeletionResult>(
          AccountDeleted(message: 'تم حذف حسابك نهائياً.'),
        ),
      );
      expect(remote.sentPassword, 'StrongP@ss123');
      expect(session.isSignedIn, isFalse);
      expect(await tokens.hasTokens, isFalse);
    });

    test('الموانع (422) إجابة مش خطأ، والجلسة بتفضل', () async {
      final (:tokens, :session) = _session();
      session.signedIn();
      final remote = _FakeAccountRemote()..delete = _blocked();

      final res = await AccountRepositoryImpl(
        remote,
        session,
      ).deleteAccount(password: 'x');

      final result = res.getOrElse(() => throw StateError('expected Right'));
      expect(result, isA<AccountDeletionBlocked>());
      final blockers = (result as AccountDeletionBlocked).blockers;
      expect(blockers.single.code, DeletionBlockerCode.activeParticipation);
      expect(session.isSignedIn, isTrue);
    });

    test('مانع واحد بيقفل الحذف حتى لو can_delete جه غلط', () {
      final check = AccountDeletionCheckModel.fromJson({
        'can_delete': true,
        'blockers': [
          {'code': 'pending_payment', 'message': '…'},
        ],
      }).toEntity();
      expect(check.canDelete, isFalse);
    });
  });

  group('حذف الحساب — الـ Cubit', () {
    late _FakeAccountRemote remote;
    late AccountDeletionCubit cubit;

    setUp(() {
      remote = _FakeAccountRemote();
      final repo = AccountRepositoryImpl(remote, _session().session);
      cubit = AccountDeletionCubit(
        CheckAccountDeletion(repo),
        DeleteAccount(repo),
      );
    });
    tearDown(() => cubit.close());

    test('مفيش موانع → فورم التأكيد، وفيه → قائمتها', () async {
      remote.check = const AccountDeletionCheckModel(canDelete: true);
      await cubit.check();
      expect(cubit.state, const AccountDeletionState.ready());

      remote.check = const AccountDeletionCheckModel(
        blockers: [DeletionBlockerModel(code: 'open_appeal', message: 'طعن')],
      );
      await cubit.check();
      expect(cubit.state, isA<DeletionBlocked>());
    });

    test('كلمة سر غلط → تحت الحقل', () async {
      remote
        ..check = const AccountDeletionCheckModel(canDelete: true)
        ..delete = ServerException(
          message: 'The given data was invalid.',
          statusCode: 422,
          errors: {
            'password': ['كلمة المرور غير صحيحة.'],
          },
        );
      await cubit.check();
      await cubit.delete('wrong');
      expect(
        cubit.state,
        const AccountDeletionState.ready(
          passwordError: 'كلمة المرور غير صحيحة.',
        ),
      );
    });

    test('النجاح → deleted بالرسالة، ومانع جديد → blocked', () async {
      remote
        ..check = const AccountDeletionCheckModel(canDelete: true)
        ..delete = 'تم حذف حسابك نهائياً.';
      await cubit.check();
      await cubit.delete('StrongP@ss123');
      expect(
        cubit.state,
        const AccountDeletionState.deleted(message: 'تم حذف حسابك نهائياً.'),
      );

      remote.delete = _blocked();
      await cubit.check();
      await cubit.delete('StrongP@ss123');
      expect(cubit.state, isA<DeletionBlocked>());
    });
  });

  testWidgets('شاشة الموانع بتعرض رسايل السيرفر', (tester) async {
    await tester.pumpWidget(
      _host(
        const DeletionBlockersView(
          blockers: [
            DeletionBlocker(
              code: DeletionBlockerCode.unsettledWin,
              message: 'لديك مزاد فائز لم تُسدَّد دفعته النهائية بعد.',
            ),
          ],
        ),
      ),
    );
    expect(find.text(_en.deleteAccountBlockedTitle), findsOneWidget);
    expect(
      find.text('لديك مزاد فائز لم تُسدَّد دفعته النهائية بعد.'),
      findsOneWidget,
    );
  });
}
