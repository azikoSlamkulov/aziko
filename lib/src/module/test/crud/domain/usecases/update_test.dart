import 'package:aziko/src/core/error/failure.dart';
import 'package:aziko/src/core/usecases/usecase.dart';
import 'package:aziko/src/module/test/crud/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateTest extends UseCase<bool, CreatTestParams> {
  final TestRepo testRepo;
  UpdateTest(this.testRepo);

  @override
  Future<Either<Failure, bool>> call(CreatTestParams params) async {
    return await testRepo.updateTest(
      object: params.object,
    );
  }
}

class UpdateTestParams extends Equatable {
  final TestEntity object;
  const UpdateTestParams({
    required this.object,
  });

  @override
  List<Object?> get props => [
        object,
      ];
}
