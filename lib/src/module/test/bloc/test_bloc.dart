import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'test_event.dart';
import 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  int oneThousand = 0;
  int fiveHundred = 0;
  int twoHundred = 0;
  int oneHundred = 0;
  int fifty = 0;
  int twenty = 0;
  int sum = 0;
  TestBloc() : super(LoadingState()) {
    on<OpenTest1Event>(_openTest1);
    on<OpenTest2Event>(_openTest2);
    on<OpenTest3Event>(_openTest3);
    on<SumEvent>(_sum);
    //on<CancelEvent>(_cansel);
  }

  void _openTest1(OpenTest1Event event, Emitter<TestState> emit) {
    emit(OpenedTest1State());
  }

  void _openTest2(OpenTest2Event event, Emitter<TestState> emit) {
    emit(OpenedTest2State());
  }

  void _openTest3(OpenTest3Event event, Emitter<TestState> emit) {
    emit(OpenedTest3State());
  }

  void _sum(SumEvent event, Emitter<TestState> emit) async {
    //emit(LoadingState());
    final sum = (int.parse(event.oneThousand) * 1000) +
        (int.parse(event.fiveHundred) * 500) +
        (int.parse(event.twoHundred) * 200) +
        (int.parse(event.oneHundred) * 100) +
        (int.parse(event.fifty) * 50) +
        (int.parse(event.twenty) * 20);
    log('$sum');
    emit(SumState(sum: sum));
  }

  // void _cancel(CancelEvent event, Emitter<TestState> emit) {
  //   emit(UnAuthenticatedState());
  // }
}


          // BlocProvider.of<AuthBloc>(context).add(
          //   SignUpEvent(
          //     email: emailCont.text,
          //     password: passwordCont.text,
          //     name: nameCont.text,
          //     mainPhoneNumber: '',
          //     photoURL: '',
          //   ),
          // );
