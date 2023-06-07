import 'dart:developer';

import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_in_vew.dart';
import 'package:aziko/src/module/test/go_router/router_utils.dart';
import 'package:aziko/src/module/test/go_router/views/error_page.dart';
import 'package:aziko/src/module/test/go_router/views/go_router_home_view.dart';
import 'package:aziko/src/module/test/go_router/views/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;
  GoRouter get router => _goRouter;

  AppRouter(
    this.authBloc,
  );

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: APP_PAGE.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: APP_PAGE.home.toPath,
        name: APP_PAGE.home.toName,
        builder: (context, state) => const GoRouterHomeView(),
      ),
      GoRoute(
        path: APP_PAGE.loading.toPath,
        name: APP_PAGE.loading.toName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: APP_PAGE.login.toPath,
        name: APP_PAGE.login.toName,
        builder: (context, state) => SignInView(),
      ),
      // GoRoute(
      //   path: APP_PAGE.onBoarding.toPath,
      //   name: APP_PAGE.onBoarding.toName,
      //   builder: (context, state) => const OnBoardingPage(),
      // ),
      GoRoute(
        path: APP_PAGE.error.toPath,
        name: APP_PAGE.error.toName,
        builder: (context, state) => ErrorPage(error: state.extra.toString()),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    redirect: (context, state) {
      final homeLocation = state.subloc == APP_PAGE.home.toPath;
      final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
      final signInLocation = state.subloc == APP_PAGE.login.toPath;
      final errorLocation = state.subloc == APP_PAGE.error.toPath;

      final isLoading = authBloc.state is AuthLoadingState;
      final isAuthenticated = authBloc.state is AuthenticatedState;
      final isUnAuthenticated = authBloc.state is UnAuthenticatedState;

      final isGoingToLoading = state.subloc == loadingLocation;
      final isGoingToSignIn = state.subloc == signInLocation;
      //final isGoingToOnboard = state.subloc == onboardLocation;

      if (isLoading) {
        log('1');
        return loadingLocation ? null : APP_PAGE.loading.toPath;
      } else if (isUnAuthenticated) {
        log('2');
        return signInLocation ? null : APP_PAGE.login.toPath;
      } else if (isAuthenticated) {
        log('3');
        return homeLocation ? null : APP_PAGE.home.toPath;
      } else {
        log('4');
        return null;
      }

      // if (isLoading && isGoingToLoading) {
      //   log('1');
      //   return isGoingToLoading ? null : APP_PAGE.splash.toPath;
      // } else if (!isUnAuthenticated && !isGoingToSignIn) {
      //   log('2');
      //   return signInLocation ? null : APP_PAGE.login.toPath;
      // } else if (!isAuthenticated) {
      //   log('3');
      //   return homeLocation ? null : APP_PAGE.home.toPath;
      // } else {
      //   log('4');
      //   return null;
      // }
    },
  );
}

// GoRouter.of(context).go('/CounterPage');


// // If not Initialized and not going to Initialized redirect to Splash
      // // Если не инициализировано и не будет инициализировано перенаправление на Splash
      // if (!isInitialized && !isGoingToInit) {
      //   return splashLocation;
      //   // If not onboard and not going to onboard redirect to OnBoarding
      //   // Если нет на борту и не собирается на борту перенаправить на OnBoarding
      // } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
      //   return onboardLocation;
      //   // If not logedin and not going to login redirect to Login
      //   // Если вы не вошли в систему и не собираетесь входить в систему, перенаправление на вход
      // } else if (isInitialized &&
      //     isOnboarded &&
      //     !isLogedIn &&
      //     !isGoingToLogin) {
      //   return loginLocation;
      //   // If all the scenarios are cleared but still going to any of that screen redirect to Home
      //   // Если все сценарии очищены, но все еще переходят на любой из этих экранов, перенаправляйтесь на «Домой».
      // } else if ((isLogedIn && isGoingToLogin) ||
      //     (isInitialized && isGoingToInit) ||
      //     (isOnboarded && isGoingToOnboard)) {
      //   return homeLocation;
      // } else {
      //   // Else Don't do anything
      //   // Иначе ничего не делай
      //   return null;
      // }
