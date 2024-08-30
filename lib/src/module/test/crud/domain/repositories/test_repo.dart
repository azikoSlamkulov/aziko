import 'package:aziko/src/core/error/failure.dart';
import 'package:aziko/src/module/test/crud/domain/domain.dart';
import 'package:dartz/dartz.dart';

import '../../test.dart';

abstract class TestRepo {
  Future<Either<Failure, List<TestEntity>>> getAllTest();
  Future<Either<Failure, TestEntity>> getTest({required String id});
  Future<Either<Failure, bool>> createTest({required TestEntity object});
  Future<Either<Failure, bool>> updateTest({required TestEntity object});
  Future<Either<Failure, bool>> deleteTest();
}
