import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../domain.dart';

class GetAllProductSmallImages {
  final ProductImageRepo productImageRepo;
  GetAllProductSmallImages(this.productImageRepo);

  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages() async {
    return await productImageRepo.getAllProductSmallImages();
  }
}
