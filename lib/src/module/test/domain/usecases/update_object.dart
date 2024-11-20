import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class UpdateObject extends UseCase<bool, UpdateObjectParams> {
  final CrudRepo crudRepo;
  UpdateObject(this.crudRepo);

  @override
  Future<Either<Failure, bool>> call(UpdateObjectParams params) async {
    return await crudRepo.updateObject(
      object: params.object,
    );
  }
}

class UpdateObjectParams extends Equatable {
  final CarEntity object;

  const UpdateObjectParams({
    required this.object,
  });

  @override
  List<Object?> get props => [object];
}
