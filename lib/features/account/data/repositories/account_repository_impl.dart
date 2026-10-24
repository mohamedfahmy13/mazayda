import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/exceptions_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/session/session_manager.dart';
import '../../domain/entities/account_deletion.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_remote_data_source.dart';
import '../models/account_deletion_model.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remote;
  final SessionManager session;
  AccountRepositoryImpl(this.remote, this.session);

  /// رفض الحذف بسبب موانع — حمولته `data.blockers` بنفس شكل الفحص.
  static const _blockedCode = 'ACCOUNT_DELETION_BLOCKED';

  @override
  Future<Either<Failure, AccountDeletionCheck>> checkDeletion() {
    return _guard(() async => (await remote.checkDeletion()).toEntity());
  }

  @override
  Future<Either<Failure, AccountDeletionResult>> deleteAccount({
    required String password,
  }) {
    return _guard(() async {
      try {
        final message = await remote.deleteAccount(password);
        // السيرفر بطّل كل التوكنات وشال الأجهزة بنفسه — فمانناديش logout
        // ولا `DELETE /devices` (هيرجعوا 401). بنمسح المحلي بس ونرجع ضيوف.
        await session.end();
        return AccountDeleted(message: message);
      } on ServerException catch (e) {
        if (e.code != _blockedCode) rethrow;
        final details = e.data;
        return AccountDeletionBlocked(
          message: e.message,
          blockers: details is Map
              ? AccountDeletionCheckModel.fromJson(
                  Map<String, dynamic>.from(details),
                ).blockerEntities
              : const [],
        );
      }
    });
  }

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
