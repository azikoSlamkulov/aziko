import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repo.dart';

class UpdateUser extends UseCase<bool, UpdateUserParams> {
  final UserRepo userRepo;
  UpdateUser(this.userRepo);

  @override
  Future<Either<Failure, bool>> call(UpdateUserParams params) async {
    return await userRepo.updateUser(user: params.user);
  }
}

class UpdateUserParams extends Equatable {
  final UserEntity user;
  const UpdateUserParams({required this.user});

  @override
  List<Object?> get props => [user];
}
