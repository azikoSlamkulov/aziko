import 'package:aziko/src/core/error/failure.dart';
import 'package:aziko/src/core/usecases/usecase.dart';
import 'package:aziko/src/module/test/crud/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTest extends UseCase<TestEntity, GetTestParams> {
  final TestRepo testRepo;
  GetTest(this.testRepo);

  @override
  Future<Either<Failure, TestEntity>> call(GetTestParams params) async {
    return await testRepo.getTest(
      id: params.id,
    );
  }
}

class GetTestParams extends Equatable {
  final String id;
  const GetTestParams({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
