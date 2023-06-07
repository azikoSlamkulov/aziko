import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(InvisibleState());

  void showInput(bool isEmail) {
    if (isEmail) {
      emit(VisibleState());
    } else {
      emit(InvisibleState());
    }
    // if (isEmail) {
    //   emit(InvisibleState());
    // } else {
    //   emit(VisibleState());
    // }
  }
}
