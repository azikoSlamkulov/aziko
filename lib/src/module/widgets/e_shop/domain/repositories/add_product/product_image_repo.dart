import 'package:aziko/src/core/core.dart';
import 'package:aziko/src/module/widgets/e_shop/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class ProductImageRepo {
  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages();
  Future<Either<Failure, List<String>>> getAllProductBigImages(
      {required String folderName});

  Future<Either<Failure, String>> setProductImage({
    required String filePath,
    required String fileName,
  });
}
