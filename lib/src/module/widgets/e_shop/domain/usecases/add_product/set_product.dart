import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/core.dart';
import '../../domain.dart';

class SetProduct extends UseCase<bool, SetProductParams> {
  final ProductRepo productRepo;
  SetProduct(this.productRepo);

  @override
  Future<Either<Failure, bool>> call(SetProductParams params) async {
    return await productRepo.setProduct(
      productDatail: params.product,
    );
  }
}

class SetProductParams extends Equatable {
  final ProductDatailEntity product;

  const SetProductParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
