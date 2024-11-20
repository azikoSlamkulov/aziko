import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final GetAllObjects getAllObjects;
  final GetObject getObject;
  final AddObject addObject;
  final UpdateObject updateObject;
  final DeleteObject deleteObject;
  CrudBloc({
    required this.getAllObjects,
    required this.getObject,
    required this.addObject,
    required this.updateObject,
    required this.deleteObject,
  }) : super(CrudInitial()) {
    on<GetAllObjectsEvent>(_getAllObjects);
    on<GetObjectEvent>(_getObject);
    on<AddObjectEvent>(_addObject);
    on<UpdateObjectEvent>(_updateObject);
    on<DeleteObjectEvent>(_deleteObject);
  }

  void _getAllObjects(GetAllObjectsEvent event, Emitter<CrudState> emit) async {
    emit(LoadingObjectState());
    final allObjects = await getAllObjects.getAllObjects();
    allObjects.fold(
      (error) => emit(const ObjectFailureState('')),
      (objects) => emit(LoadedAllObjectsState(objects)),
    );
  }

  void _getObject(GetObjectEvent event, Emitter<CrudState> emit) async {
    emit(LoadingObjectState());
    final object = await getObject(
      GetObjectParams(
        id: event.id,
      ),
    );
    object.fold(
      (error) => emit(const ObjectFailureState('')),
      (object) => emit(LoadedObjectState(object)),
    );
  }

  void _addObject(AddObjectEvent event, Emitter<CrudState> emit) async {
    emit(LoadingObjectState());
    final isCreated = await addObject(AddObjectParams(object: event.object));
    isCreated.fold(
      (error) => emit(const ObjectFailureState('')),
      (isCreated) async {
        emit(AddedObjectState(isCreated));
      },
    );
  }

  void _updateObject(UpdateObjectEvent event, Emitter<CrudState> emit) async {
    emit(LoadingObjectState());
    final isUpdate =
        await updateObject(UpdateObjectParams(object: event.object));
    isUpdate.fold(
      (error) => emit(const ObjectFailureState('')),
      (isUpdate) async {
        emit(UpdatedObjectState(isUpdate));
      },
    );
  }

  void _deleteObject(DeleteObjectEvent event, Emitter<CrudState> emit) async {
    emit(LoadingObjectState());
    final isDeleted = await deleteObject(DeleteObjectParams(id: event.id));
    isDeleted.fold(
      (error) => emit(const ObjectFailureState('')),
      (isDeleted) async {
        emit(DeletedObjectState(isDeleted));
      },
    );
  }
}
