// import 'package:dartz/dartz.dart';

// import 'package:equatable/equatable.dart';

// import '../../../../core/error/failure.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../entities/auth_user_entity.dart';
// import '../repositories/auth_repo.dart';

// class LinkSmsCode extends UseCase<AuthUserEntity, LinkSmsCodeParams> {
//   final AuthRepo authRepo;
//   LinkSmsCode(this.authRepo);

//   @override
//   Future<Either<Failure, AuthUserEntity>> call(LinkSmsCodeParams params) async {
//     return await authRepo.linkPhoneNumber(
//       smsCode: params.smsCode,
//     );
//   }
// }

// class LinkSmsCodeParams extends Equatable {
//   final String smsCode;
//   const LinkSmsCodeParams({required this.smsCode});

//   @override
//   List<Object?> get props => [smsCode];
// }
