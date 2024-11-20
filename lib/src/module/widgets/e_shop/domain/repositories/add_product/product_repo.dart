import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../entities/entities.dart';

abstract class ProductRepo {
  Future<Either<Failure, bool>> setProduct(
      {required ProductDatailEntity productDatail});

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, ProductDatailEntity>> getProductDatails({
    required String productId,
  });
}
