import 'package:aziko/src/core/core.dart';
import 'package:aziko/src/module/test/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class CrudRepo {
  Future<Either<Failure, List<CarEntity>>> getAllObjects();

  Future<Either<Failure, CarEntity>> getObject({
    required String id,
  });

  Future<Either<Failure, bool>> addObject({
    required CarEntity object,
  });

  Future<Either<Failure, bool>> updateObject({
    required CarEntity object,
  });

  Future<Either<Failure, bool>> deleteObject({
    required String id,
  });
}
