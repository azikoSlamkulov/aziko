import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failure.dart';
import '../domain.dart';

class GetAllObjects {
  final CrudRepo crudRepo;
  GetAllObjects(this.crudRepo);

  Future<Either<Failure, List<CarEntity>>> getAllObjects() async {
    return await crudRepo.getAllObjects();
  }
}
