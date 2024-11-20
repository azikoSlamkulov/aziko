import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class DeleteObject extends UseCase<bool, DeleteObjectParams> {
  final CrudRepo crudRepo;
  DeleteObject(this.crudRepo);

  @override
  Future<Either<Failure, bool>> call(DeleteObjectParams params) async {
    return await crudRepo.deleteObject(
      id: params.id,
    );
  }
}

class DeleteObjectParams extends Equatable {
  final String id;

  const DeleteObjectParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
