import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/exceptions_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/token_storage.dart';
import '../../../../core/notifications/device_registrar.dart';
import '../../../../core/session/session_manager.dart';
import '../../../../core/utils/locale_sync.dart';
import '../../domain/entities/auth_entities.dart';
import '../../domain/entities/email_recovery.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final TokenStorage tokenStorage;
  final DeviceRegistrar deviceRegistrar;
  final SessionManager session;
  final LocaleSync localeSync;

  AuthRepositoryImpl(
    this.remote,
    this.tokenStorage,
    this.deviceRegistrar,
    this.session,
    this.localeSync,
  );

  @override
  Future<Either<Failure, RegisterResult>> register({
    required String firstNameAr,
    required String lastNameAr,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String deviceName,
  }) {
    return _guard(() async {
      final userId = await remote.register({
        'first_name_ar': firstNameAr,
        'last_name_ar': lastNameAr,
        'phone': phone,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'device_name': deviceName,
      });
      return RegisterResult(userId: userId);
    });
  }

  @override
  Future<Either<Failure, AuthTokens>> verifyOtp({
    required String userId,
    required String otp,
    required String deviceName,
  }) {
    return _guard(() async {
      final model = await remote.verifyOtp({
        'user_id': userId,
        'otp': otp,
        'device_name': deviceName,
      });
      // نحفظ التوكنات فور النجاح
      await tokenStorage.saveTokens(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
      );
      session.signedIn();
      // نربط الجهاز بالحساب عشان الإشعارات توصله (بيتجاهل الفشل بهدوء).
      await deviceRegistrar.register();
      // وبلغة التطبيق — الحساب الجديد بيتعمل بالعربي افتراضيًا.
      unawaited(localeSync.sync());
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, Unit>> resendOtp({required String userId}) {
    return _guard(() async {
      await remote.resendOtp(userId);
      return unit;
    });
  }

  @override
  Future<Either<Failure, LoginResult>> login({
    required String ninOrEmail,
    required String password,
    required String deviceName,
  }) {
    return _guard(() async {
      final result = await remote.login({
        'nin_or_email': ninOrEmail,
        'password': password,
        'device_name': deviceName,
      });

      // نحفظ التوكنات فور النجاح (حالة عدم تأكيد البريد بترجّع tokens = null)
      final tokens = result.tokens;
      if (tokens != null) {
        await tokenStorage.saveTokens(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        );
        session.signedIn();
        await deviceRegistrar.register();
        unawaited(localeSync.sync());
      }
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, AuthUser>> getCurrentUser() {
    return _guard(() async {
      final model = await remote.getCurrentUser();
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, Unit>> logout({bool allDevices = false}) {
    return _guard(() async {
      // فكّ ربط الجهاز **قبل** مسح التوكن — النداء محتاج مصادقة.
      await deviceRegistrar.unregister();
      try {
        await remote.logout(allDevices: allDevices);
      } catch (_) {
        // حتى لو فشل النداء، نمسح محليًا
      }
      // التطبيق بيكمّل كضيف — مش بيرجع لشاشة دخول.
      await session.end();
      return unit;
    });
  }

  // ===== استرجاع البريد الإلكتروني المفقود (تعديل العميل رقم 1) =====

  @override
  Future<Either<Failure, EmailRecoveryRequest>> submitEmailRecovery({
    required String nin,
    required String birthDate,
    required String phone,
    required String newEmail,
    required String selfiePath,
  }) {
    return _guard(() async {
      final model = await remote.submitEmailRecovery(
        nin: nin,
        birthDate: birthDate,
        phone: phone,
        newEmail: newEmail,
        selfiePath: selfiePath,
      );
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, EmailRecoveryRequest?>> getEmailRecoveryStatus({
    required String nin,
  }) {
    return _guard(() async {
      final model = await remote.getEmailRecoveryStatus(nin: nin);
      return model?.toEntity();
    });
  }

  // ===== استرجاع الحساب =====

  @override
  Future<Either<Failure, Unit>> requestPasswordReset({
    String? nin,
    required String email,
  }) {
    return _guard(() async {
      await remote.requestPasswordReset(nin: nin, email: email);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> verifyPasswordReset({
    String? nin,
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) {
    return _guard(() async {
      await remote.verifyPasswordReset(
        nin: nin,
        email: email,
        otp: otp,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      // السيرفر عمل revokeAll — أي توكن مخزّن بقى ميت، فنمسحه.
      await session.end();
      return unit;
    });
  }

  @override
  Future<Either<Failure, String>> revealSecretQuestion({
    String? nin,
    required String email,
  }) {
    return _guard(
      () async => remote.revealSecretQuestion(nin: nin, email: email),
    );
  }

  @override
  Future<Either<Failure, Unit>> recoverBySecret({
    String? nin,
    required String email,
    required String secretAnswer,
    required String password,
    required String passwordConfirmation,
  }) {
    return _guard(() async {
      await remote.recoverBySecret(
        nin: nin,
        email: email,
        secretAnswer: secretAnswer,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      await session.end();
      return unit;
    });
  }

  // تحويل الـ exceptions لـ Failures (نفس نمط الـ auctions)
  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } on UnauthorizedException catch (e) {
      return Left(Failure.unauthorized(message: e.message));
    } on NetworkException catch (e) {
      return Left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return Left(e.toFailure());
    } catch (_) {
      return const Left(Failure.unexpected());
    }
  }
}
