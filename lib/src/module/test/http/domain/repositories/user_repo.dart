import 'package:aziko/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

abstract class FakeUserRepo {
  Future<Either<Failure, FakeUserEntity>> getUser({required String id});
  Future<Either<Failure, List<FakeUserEntity>>> getAllUsers();
}
