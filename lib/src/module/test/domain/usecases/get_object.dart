import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetObject extends UseCase<CarEntity, GetObjectParams> {
  final CrudRepo crudRepo;
  GetObject(this.crudRepo);

  @override
  Future<Either<Failure, CarEntity>> call(GetObjectParams params) async {
    return await crudRepo.getObject(id: params.id);
  }
}

class GetObjectParams extends Equatable {
  final String id;
  const GetObjectParams({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
