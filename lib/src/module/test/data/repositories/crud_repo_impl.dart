import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../test.dart';

class CrudRepoImpl implements CrudRepo {
  CrudRepoImpl({
    required this.remoteCrud,
  });

  final RemoteCrud remoteCrud;

  @override
  Future<Either<Failure, List<CarEntity>>> getAllObjects() async {
    try {
      final allObject = await remoteCrud.getAllObject();
      return Right(allObject);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, CarEntity>> getObject({
    required String id,
  }) async {
    try {
      final object = await remoteCrud.getObject(id: id);
      return Right(object);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> addObject({
    required CarEntity object,
  }) async {
    try {
      final objectId = await remoteCrud.getId();
      final isAdded = await remoteCrud.addObject(
        object: carToModel(
          objectId,
          object,
        ),
      );
      return Right(isAdded);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> updateObject(
      {required CarEntity object}) async {
    try {
      final isUpdate = await remoteCrud.updateObject(
        object: carToModel(
          object.id!,
          object,
        ),
      );
      return Right(isUpdate);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteObject({required String id}) async {
    try {
      final isDelete = await remoteCrud.deleteObject(
        id: id,
      );
      return Right(isDelete);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
