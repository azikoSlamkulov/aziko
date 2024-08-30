import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void changeColor(Color color) {
    emit(ThemeState(theme: state.theme.copy(newColor: color)));
  }

  // ignore: avoid_positional_boolean_parameters
  void changeBrightNess(bool mode) {
    emit(ThemeState(theme: state.theme.copy(newMode: mode)));
  }
}
