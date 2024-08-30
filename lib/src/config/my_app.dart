//import 'package:aziko/src/config/navbar/navbar.dart';
// import 'package:aziko/src/config/routes/redirect/redirect_view.dart';
import 'package:aziko/src/config/routes/go_router/app_router.dart';
import 'package:aziko/src/config/theme/bloc/theme_bloc.dart';
// import 'package:aziko/src/module/favorites/presentation/pages/widgets_page.dart';
// import 'package:aziko/src/module/home/views/home_view.dart';
// import 'package:aziko/src/module/my_widgets/presentation/pages/widgets_list_page.dart';
// import 'package:aziko/src/module/test/pages/test.dart';
// import 'package:aziko/src/module/user_profile/presentation/views/profile_viwe.dart';
// import 'package:aziko/src/module/user_profile/presentation/views/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import '../module/home/pages/home_page.dart';
import '../module/test/pages/test_page.dart';
import 'navbar/navbar.dart';
import 'routes/go_router/app_router_with.dart';
import 'routes/routes/app_pages.dart';
import 'theme/theme.dart';

//const _scaffoldKey = ValueKey('_scaffoldKey');

// Navigation 2.0 (GoRouter)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;

    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: state,
              darkTheme: darkTheme,
              routerConfig: router,
            );
          },
        );
      },
    );
  }
}

/// Navigation 1.0

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => RedirectView(),
//         //"UserProfileView": (context) => UserProfileView(user: ,),
//         // "UserProfileView": (context) => BlocProvider.value(
//         //       value: UserBloc(),
//         //       child: UserProfileView(),
//         //     ),
//       },
//       home: Test(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //final router = AppRouter(context.watch<AuthBloc>()).router;

//     return ScreenUtilInit(
//       designSize: const Size(393, 851),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           //title: 'Flutter Demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//             //canvasColor: Colors.transparent,
//           ),
//           initialRoute: AppPages.initial,
//           routes: AppPages.routes,
//           //home: NavigationTest(),
//         );
//       },
//     );
//   }
// }
