import 'package:aziko/src/core/error/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'crud_test_event.dart';
part 'crud_test_state.dart';

class CrudTestBloc extends Bloc<CrudTestEvent, CrudTestState> {
  final GetAllTest getAllTest;
  final CreatTest setTest;
  CrudTestBloc({
    required this.getAllTest,
    required this.setTest,
  }) : super(CrudTestInitial()) {
    on<CreatTestEvent>(_creatCrudTest);
    on<GetAllTestEvent>(_getAllCrudTest);
  }

  void _getAllCrudTest(
      GetAllTestEvent event, Emitter<CrudTestState> emit) async {
    emit(LoadingCrudTest());
    final allTest = await getAllTest.getAllTest();
    allTest.fold(
      (error) => emit(CrudTestFailureState(error)),
      (_allTest) => emit(LoadedAllTestState(_allTest)),
    );
  }

  void _creatCrudTest(CreatTestEvent event, Emitter<CrudTestState> emit) async {
    emit(LoadingCrudTest());
    final isCreated = await setTest(CreatTestParams(object: event.object));
    isCreated.fold(
      (error) => emit(CrudTestFailureState(error)),
      (_isCreated) => emit(CreatedCrudTest(_isCreated)),
    );
  }
}
