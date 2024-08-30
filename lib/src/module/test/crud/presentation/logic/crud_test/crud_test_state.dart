part of 'crud_test_bloc.dart';

class CrudTestState extends Equatable {
  const CrudTestState();

  @override
  List<Object> get props => [];
}

class CrudTestInitial extends CrudTestState {}

class LoadingCrudTest extends CrudTestState {}

class LoadedAllTestState extends CrudTestState {
  final List<TestEntity> allTest;
  const LoadedAllTestState(this.allTest);
  @override
  List<Object> get props => [allTest];
}

class CreatedCrudTest extends CrudTestState {
  final bool isCreated;

  const CreatedCrudTest(this.isCreated);

  @override
  List<Object> get props => [isCreated];
}

class CrudTestFailureState extends CrudTestState {
  final Failure message;
  const CrudTestFailureState(this.message);
  @override
  List<Object> get props => [message];
}
