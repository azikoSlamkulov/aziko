import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../auth.dart';

class SignInWithEmail extends UseCase<UserEntity, SignInWithEmailParams> {
  final AuthRepo authRepo;

  SignInWithEmail(this.authRepo);

  @override
  Future<Either<Failure, UserEntity>> call(SignInWithEmailParams params) async {
    return await authRepo.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInWithEmailParams extends Equatable {
  final String email;
  final String password;

  const SignInWithEmailParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
