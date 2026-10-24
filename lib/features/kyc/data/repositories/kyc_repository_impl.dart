import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/exceptions_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/kyc_entities.dart';
import '../../domain/repositories/kyc_repository.dart';
import '../datasources/kyc_remote_data_source.dart';

@LazySingleton(as: KycRepository)
class KycRepositoryImpl implements KycRepository {
  final KycRemoteDataSource remote;
  KycRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, KycStatus>> getStatus() {
    return _guard(() async => (await remote.getStatus()).toEntity());
  }

  @override
  Future<Either<Failure, Unit>> uploadDocument({
    required KycDocType type,
    required String filePath,
  }) {
    return _guard(() async {
      await remote.uploadDocument(type.apiValue, filePath);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> submit(KycSubmitParams p) {
    return _guard(() async {
      await remote.submit({
        if (p.nin != null) 'nin': p.nin,
        if (p.birthDate != null) 'birth_date': p.birthDate,
        'first_name_fr': p.firstNameFr,
        'last_name_fr': p.lastNameFr,
        'father_name': p.fatherName,
        'mother_name': p.motherName,
        'mother_surname': p.motherSurname,
        'address': p.address,
        'wilaya_id': p.wilayaId,
        'commune_id': p.communeId,
        'postal_code': p.postalCode,
        'profession': p.profession,
        'expected_income': p.expectedIncome,
        'id_type': p.idType,
        'id_number': p.idNumber,
      });
      return unit;
    });
  }

  @override
  Future<Either<Failure, List<Wilaya>>> getWilayas() {
    return _guard(
      () async => (await remote.getWilayas()).map((m) => m.toEntity()).toList(),
    );
  }

  @override
  Future<Either<Failure, List<Commune>>> getCommunes(int wilayaId) {
    return _guard(
      () async => (await remote.getCommunes(
        wilayaId,
      )).map((m) => m.toEntity()).toList(),
    );
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
