import 'package:flutter/material.dart';

//Theme.of(context).colorScheme.primary,
//TextTheme textTheme = Theme.of(context).textTheme;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  //brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
    brightness: Brightness.light,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  //brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0A0E21),
    brightness: Brightness.dark,
  ),
);
