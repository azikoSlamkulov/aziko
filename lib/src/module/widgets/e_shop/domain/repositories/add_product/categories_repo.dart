import 'package:aziko/src/core/core.dart';
import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';

abstract class CategoriesRepo {
  //Future<Either<Failure, CollectionEntity>> getType({required String id});

  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    required String type,
    required String collection,
  });

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();

  Future<Either<Failure, bool>> addCategory({
    required String type,
    required String collection,
    required String category,
  });

  Future<Either<Failure, bool>> deleteCategory({
    required String id,
  });
}
