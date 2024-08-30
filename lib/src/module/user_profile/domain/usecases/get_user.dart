import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repo.dart';

class GetUser extends UseCase<UserEntity, GetUserParams> {
  final UserRepo userRepo;
  GetUser(this.userRepo);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await userRepo.getUser(userID: params.userID);
  }
}

class GetUserParams extends Equatable {
  final String userID;
  const GetUserParams({required this.userID});

  @override
  List<Object?> get props => [
        userID,
      ];
}
