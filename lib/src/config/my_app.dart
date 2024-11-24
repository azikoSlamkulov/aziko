import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/domain/routes/routes.dart';
import '../module/auth/auth.dart';
import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;

    return ScreenUtilInit(
      designSize: const Size(393, 873), // note 12 pro
      // designSize: const Size(393, 851),
      //designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // return MaterialApp.router(
        //   debugShowCheckedModeBanner: false,
        //   theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //     useMaterial3: true,
        //   ),
        //   routerConfig: router,
        // );
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
