import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_bloc.dart';
import 'package:aziko/src/app/routes/redirect/redirect_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bootstrap.dart';
import 'src/app/routes/go_router/app_router.dart';
import 'src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';

import 'src/module/test/http/presentation/views/1_test/test.dart';
import 'src/module/user_profile/presentation/views/user_profile_view.dart';

void main() {
  bootstrap(() => const GoRouterApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => RedirectView(),
      //   "UserProfileView": (context) => UserProfileView(user: ,),
      //   // "UserProfileView": (context) => BlocProvider.value(
      //   //       value: UserBloc(),
      //   //       child: UserProfileView(),
      //   //     ),
      // }
      home: Test(),
    );
  }
}

//GoRouter
class GoRouterApp extends StatelessWidget {
  const GoRouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}


/// Adaptive

// void main() {
//   bootstrap(() => const MyAppAdaptive());
//   // -------
//   //await ScreenUtil.ensureScreenSize();
//   //runApp(const MyAppAdaptive3());
// }

// class MyAppAdaptive extends StatelessWidget {
//   const MyAppAdaptive({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final router = AppRouter(context.watch<AuthBloc>()).router;

//     return ScreenUtilInit(
//       designSize: const Size(393, 851),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//             //canvasColor: Colors.transparent,
//           ),
//           routeInformationProvider: router.routeInformationProvider,
//           routeInformationParser: router.routeInformationParser,
//           routerDelegate: router.routerDelegate,
//         );
//       },
//       //child: const MyHomePage(title: 'First Method'),
//     );
//   }
// }

// //Первый метод
// class MyAppAdaptive2 extends StatelessWidget {
//   const MyAppAdaptive2({Key? key}) : super(key: key);

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
//           title: 'First Method',
//           // You can use the library anywhere in the app even in theme
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//           ),
//           home: child,
//         );
//       },
//       child: const HomeView(),
//     );
//   }
// }

//Второй метод. Нужно внести изменения в Main.
// class MyAppAdaptive3 extends StatelessWidget {
//   const MyAppAdaptive3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //final router = AppRouter(context.watch<AuthBloc>()).router;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'First Method',
//       // You can use the library anywhere in the app even in theme
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         //textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//       ),
//       home: const HomeView(),
//     );
//   }
// }

//ScreenUtil.init(context, designSize: const Size(393, 851));
