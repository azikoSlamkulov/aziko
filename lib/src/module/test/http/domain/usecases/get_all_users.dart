import 'package:aziko/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repo.dart';

class GetAllUsers {
  final FakeUserRepo userRepo;

  GetAllUsers(this.userRepo);

  Future<Either<Failure, List<FakeUserEntity>>> getAllUsers() async {
    return await userRepo.getAllUsers();
  }
}
