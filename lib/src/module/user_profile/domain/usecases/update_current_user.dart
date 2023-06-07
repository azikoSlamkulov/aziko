// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../core/error/failure.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../repositories/auth_repo.dart';

// // class UpdateCurrentUser {
// //   final AuthRepo authRepo;
// //   UpdateCurrentUser(this.authRepo);

// //   Future<Either<Failure, UserCredential>> updateCurrentUser() async {
// //     return await authRepo.updateCurrentUser();
// //   }
// // }

// class UpdateCurrentUser extends UseCase<bool, UpdateCurrentUserParams> {
//   final AuthRepo authRepo;
//   UpdateCurrentUser(this.authRepo);

//   @override
//   Future<Either<Failure, bool>> call(UpdateCurrentUserParams params) async {
//     return await authRepo.updateCurrentUser(
//       name: params.name,
//       photoURL: params.photoURL,
//     );
//   }
// }

// class UpdateCurrentUserParams extends Equatable {
//   final String name;
//   final String photoURL;
//   const UpdateCurrentUserParams({
//     required this.name,
//     required this.photoURL,
//   });

//   @override
//   List<Object?> get props => [name, photoURL];
// }
