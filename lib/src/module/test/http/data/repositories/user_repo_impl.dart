import 'package:aziko/src/core/error/exception.dart';
import 'package:aziko/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repo.dart';
import '../services/remote_services/user_remote_services.dart';

class FakeUserRepoImpl implements FakeUserRepo {
  final UserRemoteServices userRemoteServices;

  FakeUserRepoImpl({required this.userRemoteServices});

  @override
  Future<Either<Failure, List<FakeUserEntity>>> getAllUsers() async {
    try {
      final _user = await userRemoteServices.getAllUsers();
      return Right(_user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FakeUserEntity>> getUser({required String id}) async {
    try {
      final _user = await userRemoteServices.getAUser(id);
      return Right(_user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
