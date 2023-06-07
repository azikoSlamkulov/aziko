import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

import '../entities/auth_user_entity.dart';
import '../repositories/auth_repo.dart';

class SendSmsCode extends UseCase<AuthUser, SmsCodeParams> {
  final AuthRepo authRepo;
  SendSmsCode(this.authRepo);

  @override
  Future<Either<Failure, AuthUser>> call(SmsCodeParams params) async {
    return await authRepo.sendSmsCode(
      smsCode: params.smsCode,
    );
  }
}

class SmsCodeParams extends Equatable {
  final String smsCode;
  const SmsCodeParams({required this.smsCode});

  @override
  List<Object?> get props => [smsCode];
}
