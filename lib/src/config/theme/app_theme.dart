import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//Theme.of(context).colorScheme.primary,
//TextTheme textTheme = Theme.of(context).textTheme;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Colors.red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.secularOneTextTheme(),

  // colorScheme: ColorScheme.fromSeed(
  //   primary: Colors.red,
  //   secondary: Colors.grey,
  //   seedColor: Colors.red,
  //   brightness: Brightness.light,
  // ),

  scaffoldBackgroundColor: const Color(0xFFF4F4F4),
  // Color(0xFFA37A74)
  // Color(0xFFE49273)

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(size: 10),
    //titleTextStyle: TextStyle(color: Colors.red),
  ),
  // textTheme: TextTheme(
  //   bodyLarge: TextStyle(
  //     fontSize: 16.0.sp,
  //     color: Colors.red,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodyMedium: TextStyle(
  //     fontSize: 14.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  // ),

  // inputDecorationTheme: InputDecorationTheme(
  //   contentPadding: REdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
  //   labelStyle: const TextStyle(color: Colors.black26),
  //   hintStyle: const TextStyle(color: Colors.black26),
  //   // enabledBorder: OutlineInputBorder(
  //   //   borderSide: BorderSide(
  //   //     color: Colors.white,
  //   //     width: 0.5,
  //   //     style: BorderStyle.solid,
  //   //   ),
  //   // ),
  //   border: const OutlineInputBorder(
  //     borderSide: BorderSide(
  //       //color: Colors.white,
  //       width: 0.5,
  //       style: BorderStyle.solid,
  //     ),
  //   ),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      minimumSize: Size.infinite,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      side: const BorderSide(color: Colors.red),
      foregroundColor: Colors.red,
      minimumSize: Size.infinite,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  // iconButtonTheme: IconButtonThemeData(
  //   style: IconButton.styleFrom(
  //     backgroundColor: Colors.red,
  //   ),
  // ),

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
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

//////////////////////////////////////////////////////////////////////////////////

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF0A0E21),

  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: const Color(0xFF0A0E21),
  //   brightness: Brightness.dark,
  // ),

  // static const activeCardColour = Color(0xFF1D1E33);
  // static const inactiveCardColour = Color(0xFF111328);
  // static const bottomContainerColour = Color(0xFFEB1555);
// Color(0xFF1D1E33)
// Color(0xFF0A0E21)
//primaryColorDark: Color(0xFF0A0E21),
  //buttonColor: Color(0xFF1D1E33),
  //backgroundColor: Color(0xFF1D1E33),
  //selectedRowColor: Colors.white,
  //unselectedWidgetColor: Colors.grey[600],
  // cardColor: Color(0xFF1D1E33),
  //canvasColor: Color(0xFF1D1E33),

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    //titleTextStyle: TextStyle(color: Colors.red),
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

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      minimumSize: Size.infinite,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      side: const BorderSide(color: Colors.white),
      foregroundColor: Colors.white,
      minimumSize: Size.infinite,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: REdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
    labelStyle: const TextStyle(color: Colors.white38),
    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Colors.white,
    //     width: 0.5,
    //     style: BorderStyle.solid,
    //   ),
    // ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 0.5,
        style: BorderStyle.solid,
      ),
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

  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

// textTheme: TextTheme(
  //   displayLarge: TextStyle(
  //     fontSize: 48.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   displayMedium: TextStyle(
  //     fontSize: 44.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   displaySmall: TextStyle(
  //     fontSize: 34.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   headlineLarge: TextStyle(
  //     fontSize: 30.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   headlineMedium: TextStyle(
  //     fontSize: 24.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   headlineSmall: TextStyle(
  //     fontSize: 24.0.sp,
  //     color: Colors.black,
  //   ),
  //   titleLarge: TextStyle(
  //     fontSize: 20.0.sp,
  //     color: Colors.black,
  //   ),
  //   titleMedium: TextStyle(
  //     fontSize: 18.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   titleSmall: TextStyle(
  //     fontSize: 18.0.sp,
  //     color: Colors.black,
  //   ),
  //   bodyLarge: TextStyle(
  //     fontSize: 16.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodyMedium: TextStyle(
  //     fontSize: 16.0.sp,
  //     color: Colors.black,
  //   ),
  //   bodySmall: TextStyle(
  //     fontSize: 14.0.sp,
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   labelLarge: TextStyle(
  //     fontSize: 14.0.sp,
  //     color: Colors.black,
  //   ),
  //   labelMedium: TextStyle(
  //     fontSize: 11.0.sp,
  //     color: Colors.black,
  //   ),
  //   labelSmall: TextStyle(
  //     fontSize: 8.0.sp,
  //     color: Colors.black,
  //   ),
  // ),
