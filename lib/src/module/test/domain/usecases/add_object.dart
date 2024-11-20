import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class AddObject extends UseCase<bool, AddObjectParams> {
  final CrudRepo crudRepo;
  AddObject(this.crudRepo);

  @override
  Future<Either<Failure, bool>> call(AddObjectParams params) async {
    return await crudRepo.addObject(
      object: params.object,
    );
  }
}

class AddObjectParams extends Equatable {
  final CarEntity object;

  const AddObjectParams({
    required this.object,
  });

  @override
  List<Object?> get props => [object];
}
