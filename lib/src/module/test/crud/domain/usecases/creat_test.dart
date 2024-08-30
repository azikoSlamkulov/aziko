import 'package:aziko/src/core/error/failure.dart';
import 'package:aziko/src/core/usecases/usecase.dart';
import 'package:aziko/src/module/test/crud/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreatTest extends UseCase<bool, CreatTestParams> {
  final TestRepo testRepo;
  CreatTest(this.testRepo);

  @override
  Future<Either<Failure, bool>> call(CreatTestParams params) async {
    return await testRepo.createTest(
      object: params.object,
    );
  }
}

class CreatTestParams extends Equatable {
  final TestEntity object;
  const CreatTestParams({
    required this.object,
  });

  @override
  List<Object?> get props => [
        object,
      ];
}
