import 'package:dartz/dartz.dart';

import '../../../../../../core/core.dart';
import '../../domain.dart';

class GetAllBrands {
  final BrandsRepo brandRepo;
  GetAllBrands(this.brandRepo);

  Future<Either<Failure, List<BrandEntity>>> getAllBrands() async {
    return await brandRepo.getAllBrands();
  }
}
