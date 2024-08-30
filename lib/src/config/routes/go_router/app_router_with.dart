import 'package:aziko/src/config/navbar/stateful_shell_route/stateful_shell_route_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import '../../../module/auth/presentation/views/sign_in_vew.dart';
import '../../../module/auth/presentation/views/sign_up_view.dart';
import '../../../module/home/pages/home_page.dart';
import '../../../module/my_widgets/presentation/pages/widgets_list_page.dart';

class AppRouterTest {
  AppRouterTest(
    this.authBloc,
  );

  final AuthBloc authBloc;
  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    initialLocation: '/main',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return StatefulShellRouteNavbar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/main',
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        const WidgetsListPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/tabB',
                builder: (BuildContext context, GoRouterState state) =>
                    WidgetsListPage(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) =>
                        SignInView(),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ],
  );
}
