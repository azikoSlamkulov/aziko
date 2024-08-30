part of 'crud_test_bloc.dart';

class CrudTestEvent extends Equatable {
  const CrudTestEvent();

  @override
  List<Object> get props => [];
}

class CreatTestEvent extends CrudTestEvent {
  final TestEntity object;

  const CreatTestEvent({required this.object});
}

class GetAllTestEvent extends CrudTestEvent {}
