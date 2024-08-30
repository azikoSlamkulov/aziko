import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repo.dart';

import '../data_source/local_data_source/local_user.dart';
import '../data_source/remote_data_source/remote_user.dart';

class UserRepoImpl implements UserRepo {
  final RemoteUser remoteUser;
  final LocalUser localUser;

  UserRepoImpl({
    required this.remoteUser,
    required this.localUser,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser({required String userID}) async {
    try {
      final user = await remoteUser.getUser(userID: userID);
      return Right(user);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final allUsers = await remoteUser.getAllUsers();
      return Right(allUsers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, UserEntity>> createNewUser(
  //     {required UserEntity user}) async {
  //   try {
  //     final isUser = await remoteUser.createNewUser(user: user);
  //     if (isUser) {
  //       final userEntity = await remoteUser.getUser(
  //         userID: user.userID!,
  //       );
  //       localUser.addUserToCache(userEntity);
  //       return Right(userEntity);
  //     } else {
  //       return Left(ServerFailure());
  //     }
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<Failure, bool>> updateUser({required UserEntity user}) async {
    try {
      final isUser = await remoteUser.updateUser(user: user);
      return Right(isUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser({required String userID}) async {
    try {
      final isDelete = await remoteUser.deleteUser(
        userID: userID,
      );
      return Right(isDelete);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

 // @override
  // Future<Either<Failure, bool>> updateCurrentUser({
  //   required String name,
  //   required String photoURL,
  // }) async {
  //   // TODO: implement updateCurrentUser
  //   throw UnimplementedError();
  //   // try {
  //   //   final currentUser = await remoteAuth.getCurrentUser();
  //   //   final isUpdateDisplayName = await remoteAuth.updateDisplayName(
  //   //     name: name,
  //   //     currentUser: currentUser!,
  //   //   );
  //   //   final isUpdatePhotoURL = await remoteAuth.updatePhotoURL(
  //   //     photoURL: photoURL,
  //   //     currentUser: currentUser,
  //   //   );
  //   //   if (isUpdateDisplayName || isUpdatePhotoURL) {
  //   //     return const Right(true);
  //   //   }
  //   // } on ServerException {
  //   //   return Left(ServerFailure());
  //   // }
  // }

    // @override
  // Future<Either<Failure, AuthUserEntity>> linkPhoneNumber({
  //   required String smsCode,
  // }) async {
  //   try {
  //     final userModel = await remoteAuth.linkValidateOtp(smsCode: smsCode);
  //     //localAuth.addUserToCache(userModel);

  //     return Right(userModel);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

   // @override
  // Future<Either<Failure, AuthUserEntity>> reauthenticateWithCredential() async {
  //   try {
  //     final userFromCache = localAuth.getUserFromCache();
  //     log('_userFromCache ===>>> $userFromCache');
  //     if (userFromCache != null) {
  //       localAuth.clearCache();
  //       remoteAuth.reauthenticateWithCredential(credential: );
  //       return Right(userFromCache);
  //     } else {
  //       final currentUser = AuthUserEntity();
  //       log('_currentUser ===>>> $currentUser');
  //       return Right(currentUser);
  //     }
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
