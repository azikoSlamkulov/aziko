part of 'crud_bloc.dart';

sealed class CrudState extends Equatable {
  const CrudState();

  @override
  List<Object> get props => [];
}

final class CrudInitial extends CrudState {}

class LoadingObjectState extends CrudState {}

class LoadedObjectState extends CrudState {
  final CarEntity object;
  const LoadedObjectState(this.object);
  @override
  List<Object> get props => [object];
}

class LoadedAllObjectsState extends CrudState {
  final List<CarEntity> allObject;
  const LoadedAllObjectsState(this.allObject);
  @override
  List<Object> get props => [allObject];
}

class AddedObjectState extends CrudState {
  final bool isCreated;
  const AddedObjectState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
}

class UpdatedObjectState extends CrudState {
  final bool isUpdate;
  const UpdatedObjectState(this.isUpdate);
  @override
  List<Object> get props => [isUpdate];
}

class DeletedObjectState extends CrudState {
  final bool isDelete;
  const DeletedObjectState(this.isDelete);
  @override
  List<Object> get props => [isDelete];
}

class AddedProductState extends CrudState {
  final bool isCreated;
  const AddedProductState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
}

class ObjectFailureState extends CrudState {
  final String message;
  const ObjectFailureState(this.message);
  @override
  List<Object> get props => [message];
}
