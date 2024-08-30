import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repo.dart';

class DeleteUser extends UseCase<bool, DeleteUserParams> {
  final UserRepo userRepo;
  DeleteUser(this.userRepo);

  @override
  Future<Either<Failure, bool>> call(DeleteUserParams params) async {
    return await userRepo.deleteUser(userID: params.userID);
  }
}

class DeleteUserParams extends Equatable {
  final String userID;
  const DeleteUserParams({required this.userID});

  @override
  List<Object?> get props => [userID];
}
