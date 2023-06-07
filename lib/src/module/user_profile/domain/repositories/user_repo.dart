import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUser({required String userID});

  Future<Either<Failure, List<UserEntity>>> getAllUsers();

  Future<Either<Failure, bool>> updateUser({required UserEntity user});

  Future<Either<Failure, bool>> deleteUser({required String userID});

  // Future<Either<Failure, AuthUserEntity>> linkPhoneNumber({
  //   required String smsCode,
  // });
}

 // Future<Either<Failure, bool>> updateCurrentUser({
  //   required String name,
  //   required String photoURL,
  // });

//Future<Either<Failure, AuthUserEntity>> reauthenticateWithCredential();