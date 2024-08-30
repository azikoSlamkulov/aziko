import 'package:aziko/src/core/error/exception.dart';
import 'package:aziko/src/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../test.dart';

class TestRepoImpl extends TestRepo {
  final RemoteTest remoteTest;

  TestRepoImpl({required this.remoteTest});

  @override
  Future<Either<Failure, bool>> deleteTest() async {
    // TODO: implement deleteTest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TestEntity>> getTest({required String id}) async {
    try {
      final test = await remoteTest.getTest(id: id);
      return Right(test);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createTest({required TestEntity object}) async {
    try {
      //final List objectList;
      // if (object != ObjectEntity()) {
      //   final objectModel = ObjectModel(text: object.text);
      //   objectList.add(objectModel);
      // }
      final testId = await remoteTest.getTestId();
      final isAdded = await remoteTest.setTest(
        object: TestModel(
          id: object.id ?? testId,
          object: object.object,
        ),
      );
      return Right(isAdded);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateTest({required TestEntity object}) async {
    try {
      final isUpdated = await remoteTest.updateTest(
        object: TestModel(
          id: object.id,
          object: object.object,
        ),
      );
      return Right(isUpdated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TestEntity>>> getAllTest() async {
    try {
      final allTest = await remoteTest.getAllTest();
      return Right(allTest);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
