import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../auth.dart';

class SendPasswordResetEmail
    extends UseCase<bool, SendPasswordResetEmailParams> {
  final AuthRepo authRepo;

  SendPasswordResetEmail(this.authRepo);

  @override
  Future<Either<Failure, bool>> call(
      SendPasswordResetEmailParams params) async {
    return await authRepo.sendPasswordResetEmail(
      email: params.email,
    );
  }
}

class SendPasswordResetEmailParams extends Equatable {
  final String email;

  const SendPasswordResetEmailParams({
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];
}
