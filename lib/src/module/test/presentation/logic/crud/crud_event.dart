part of 'crud_bloc.dart';

sealed class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}

class GetAllObjectsEvent extends CrudEvent {}

class GetObjectEvent extends CrudEvent {
  final String id;

  const GetObjectEvent(this.id);
}

class AddObjectEvent extends CrudEvent {
  final CarEntity object;

  const AddObjectEvent(this.object);
}

class UpdateObjectEvent extends CrudEvent {
  final CarEntity object;

  const UpdateObjectEvent(this.object);
}

class DeleteObjectEvent extends CrudEvent {
  final String id;

  const DeleteObjectEvent(this.id);
}
