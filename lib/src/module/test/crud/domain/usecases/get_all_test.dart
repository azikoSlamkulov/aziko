import 'package:aziko/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../test.dart';

class GetAllTest {
  final TestRepo testRepo;
  GetAllTest(this.testRepo);

  Future<Either<Failure, List<TestEntity>>> getAllTest() async {
    return await testRepo.getAllTest();
  }
}
