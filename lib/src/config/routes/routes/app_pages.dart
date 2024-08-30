import 'package:aziko/src/config/navbar/navbar.dart';
import 'package:aziko/src/module/test/crud/presentation/views/views.dart';
import 'package:flutter/material.dart';

import '../../../module/home/pages/home_page.dart';

class AppPages {
  AppPages._();

  static const initial = '/';

  static final routes = <String, WidgetBuilder>{
    '/': (context) => const MyNavigationBar(
          currentIndex: 0,
          page: HomePage(),
        ),
    '/widgets': (context) => const MyNavigationBar(
          currentIndex: 1,
          page: CrudTestView(),
        ),
  };

  // static final routes = <String, WidgetBuilder>{
  //   '/': (context) => const RootLayout(
  //         currentIndex: 0,
  //         mobile: HomePage(),
  //         tablet: HomePage(),
  //       ),
  //   '/widgets': (context) => const RootLayout(
  //         currentIndex: 1,
  //         mobile: TestPage(),
  //         tablet: TestPage(),
  //       ),
  // };
}
