// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../core/error/failure.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../entities/user_entity.dart';
// import '../repositories/user_repo.dart';

// class CreateUser extends UseCase<UserEntity, CreateUserParams> {
//   final UserRepo userRepo;
//   CreateUser(this.userRepo);

//   @override
//   Future<Either<Failure, UserEntity>> call(CreateUserParams params) async {
//     return await userRepo.updatUser(user: params.user);
//   }
// }

// class CreateUserParams extends Equatable {
//   final UserEntity user;
//   const CreateUserParams({required this.user});

//   @override
//   List<Object?> get props => [user];
// }
