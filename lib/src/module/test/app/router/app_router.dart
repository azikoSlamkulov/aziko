// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../module/home/page/view/home_page.dart';
// import '../../src.dart';
// import 'destinations.dart';
// import 'root_layout.dart';

// const _pageKey = ValueKey('_pageKey');
// const _scaffoldKey = ValueKey('_scaffoldKey');

// class AppRouter {
//   AppRouter(this.authState);

//   final AuthState authState;

//   late final router = GoRouter(
//     debugLogDiagnostics: true,

//     routes: [
//       /// Example Page
//       // GoRoute(
//       //   path: '/',
//       //   pageBuilder: (context, state) => const MaterialPage<void>(
//       //     key: _pageKey,
//       //     child: SeninBarakchan(),
//       //   ),
//       // ),

//       /// home
//       GoRoute(
//         path: '/',
//         pageBuilder: (context, state) => const MaterialPage<void>(
//           key: _pageKey,
//           child: RootLayout(
//             key: _scaffoldKey,
//             currentIndex: 0,
//             child: HomePage(),
//           ),
//         ),
//       ),
// =======
//     routes: authState.token != null
//         ? [
//             /// home
//             GoRoute(
//               path: '/',
//               pageBuilder: (context, state) => const MaterialPage<void>(
//                 key: _pageKey,
//                 child: RootLayout(
//                   key: _scaffoldKey,
//                   currentIndex: 0,
//                   child: HomePage(),
//                 ),
//               ),
//             ),


//       /// Authentication
//       GoRoute(
//         path: '/login',
//         pageBuilder: (context, state) => const MaterialPage<void>(
//           key: _pageKey,
//           child: SignInPage(),
//         ),
//       ),

//       /// counter
//       GoRoute(
//         path: '/counter',
//         pageBuilder: (context, state) => const MaterialPage<void>(
//           key: _pageKey,
//           child: RootLayout(
//             key: _scaffoldKey,
//             currentIndex: 1,
//             child: CounterPage(),
//           ),
//         ),
//       ),

//       /// shelf
//       GoRoute(
//         path: '/shelf',
//         pageBuilder: (context, state) => const MaterialPage<void>(
//           key: _pageKey,
//           child: RootLayout(
//             key: _scaffoldKey,
//             currentIndex: 2,
//             child: ShelfView(),
//           ),
//         ),
//       ),

//       /// profile
//       GoRoute(
//         path: '/profile',
//         pageBuilder: (context, state) => const MaterialPage<void>(
//           key: _pageKey,
//           child: RootLayout(
//             key: _scaffoldKey,
//             currentIndex: 3,
//             child: ProfileView(),
//           ),
//         ),
//       ),


//       /// destinations
//       for (final route in destinations.skip(4))
//         GoRoute(
//           path: route.route,
//           pageBuilder: (context, state) => MaterialPage<void>(
//             key: _pageKey,
//             child: RootLayout(
//               key: _scaffoldKey,
//               currentIndex: destinations.indexOf(route),
//               child: const SizedBox(),
//             ),
//           ),
//         ),
//     ],
//     redirect: (state) {
//       final loggedIn = authState.token != null;
//       final loggingIn = state.subloc == '/login';
//       if (!loggedIn) return loggingIn ? null : '/login';

//       if (loggingIn) return '/';

//       return null;
//     },

//             /// destinations
//             for (final route in destinations.skip(4))
//               GoRoute(
//                 path: route.route,
//                 pageBuilder: (context, state) => MaterialPage<void>(
//                   key: _pageKey,
//                   child: RootLayout(
//                     key: _scaffoldKey,
//                     currentIndex: destinations.indexOf(route),
//                     child: const SizedBox(),
//                   ),
//                 ),
//               ),
//           ]
//         : [
            
         
//           ],

//   );
// }
