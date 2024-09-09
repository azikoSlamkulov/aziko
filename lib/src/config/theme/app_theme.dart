import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Theme.of(context).colorScheme.primary,
//TextTheme textTheme = Theme.of(context).textTheme;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  // brightness: Brightness.light,
  // primaryColor: Colors.red,

  colorScheme: ColorScheme.fromSeed(
    //primary: Colors.red,
    secondary: Colors.grey,
    seedColor: Colors.red,
    brightness: Brightness.light,
  ),

  //scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16.0.sp,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 11.0.sp,
      color: Colors.black,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      color: Colors.red,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      color: Colors.grey,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  // brightness: Brightness.dark,
  // primaryColor: const Color(0xFF0A0E21),

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0A0E21),
    brightness: Brightness.dark,
  ),

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0.sp,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0.sp,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0.sp,
      color: Colors.white,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      color: Colors.red,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      color: Colors.grey,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
);
