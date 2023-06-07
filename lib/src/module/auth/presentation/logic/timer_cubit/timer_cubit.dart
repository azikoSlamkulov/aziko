import 'dart:async';

import 'package:aziko/src/module/auth/presentation/logic/timer_cubit/timer_state.dart';
import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(InitialState());

  int time = 30;

  void startTimer() {
    time = 30;
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (time == 0) {
        timer.cancel();
        emit(FinishedTimerState(time));
      } else {
        time--;
        emit(RunTimerState(time));
      }
    });
  }
}

///final timer = context.select((TimerCubit cubit) => cubit.state);
///
///context.read<TimerCubit>().startTimer();
///


//------------------------------------------------------
//int start = 30;

// void startTimer() {
  //   const onsec = Duration(seconds: 1);
  //   Timer timer = Timer.periodic(onsec, (timer) {
  //     if (start == 0) {
  //       // setState(() {
  //       //   timer.cancel();
  //       // });
  //       timer.cancel();
  //     } else {
  //       // setState(() {
  //       //   start--;
  //       // });
  //       start--;
  //     }
  //   });
  // }
