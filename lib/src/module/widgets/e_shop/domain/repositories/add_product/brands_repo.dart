import 'package:aziko/src/core/core.dart';
import 'package:aziko/src/module/widgets/e_shop/domain/entities/add_product/brand_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BrandsRepo {
  Future<Either<Failure, List<BrandEntity>>> getAllBrands();

  Future<Either<Failure, bool>> addBrand({required String brandName});

  Future<Either<Failure, bool>> deleteBrand({
    required String id,
  });
}
