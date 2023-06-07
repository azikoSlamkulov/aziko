// GoRouter.of(context).goNamed(
//   APP_PAGE.shopCatalog.toName,
// );
// --------------------------------------------------------------------
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => MobileCatalogView(
//       type: type,
//       collection: collection,
//       category: category.name!,
//     ),
//   ),
// );
// --------------------------------------------------------------------

import 'package:aziko/src/app/navbar/navbar.dart';
import 'package:aziko/src/app/routes/go_router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import '../../../module/auth/presentation/logic/auth_bloc/auth_state.dart';

import '../../../module/auth/presentation/views/sign_in_vew.dart';
import '../../../module/auth/presentation/views/sign_up_view.dart';
import '../../../module/test/http/presentation/views/1_test/test.dart';
import '../../../util/app_constants/colors/app_colors.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  final AuthBloc authBloc;
  GoRouter get router => _goRouter;

  AppRouter(
    this.authBloc,
  );

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: AppPage.home.toPath,
    routes: <GoRoute>[
      /// Admin
      // GoRoute(
      //   path: AppPage.admin.toPath,
      //   name: AppPage.admin.toName,
      //   //builder: (context, state) => const MobileProfileViwe(),
      //   pageBuilder: (context, state) => const MaterialPage<void>(
      //     key: _pageKey,
      //     child: RootLayout(
      //       key: _scaffoldKey,
      //       currentIndex: 2,
      //       mobile: MobileFavoritesVew(),
      //       tablet: MobileBagViwe(),
      //     ),
      //   ),
      // ),

      /// Loading
      GoRoute(
        path: AppPage.loading.toPath,
        name: AppPage.loading.toName,
        builder: (context, state) => const Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            //child: progressIndicator.circularProgress(),
            child: CircularProgressIndicator(),
          ),
        ),
      ),

      /// Auth
      GoRoute(
        path: AppPage.signUp.toPath,
        name: AppPage.signUp.toName,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: AppPage.signIn.toPath,
        name: AppPage.signIn.toName,
        builder: (context, state) => SignInView(),
      ),

      // GoRoute(
      //   path: AppPage.passwordRecovery.toPath,
      //   name: AppPage.passwordRecovery.toName,
      //   builder: (context, state) => PasswordRecoveryView(),
      // ),

      /// Home
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            mobile: Test(),
            tablet: Test(),
          ),
        ),
      ),

      /// Shop
      GoRoute(
        path: AppPage.collections.toPath,
        name: AppPage.collections.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            mobile: Test(),
            tablet: Test(),
          ),
        ),
      ),

      /// Bag
      GoRoute(
        path: AppPage.bag.toPath,
        name: AppPage.bag.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            //child: BagViwe(),
            mobile: Test(),
            tablet: Test(),
          ),
        ),
      ),

      /// Favorites
      GoRoute(
        path: AppPage.favorites.toPath,
        name: AppPage.favorites.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 3,
            //child: FavoritesViwe(),
            mobile: Test(),
            tablet: Test(),
          ),
        ),
      ),

      /// Profile
      GoRoute(
        path: AppPage.profile.toPath,
        name: AppPage.profile.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 4,
            //child: ProfileViwe(),
            mobile: Test(),
            tablet: Test(),
          ),
        ),
      ),
    ],

    // Error
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          state.extra.toString(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    ),

    // Redirect
    redirect: (context, state) {
      // --- 1 ---
      final bool loggedIn = authBloc.state is AuthenticatedState;
      final bool loggingIn = state.subloc == AppPage.home.toPath;
      final bool onBoarding = state.subloc == AppPage.onBoarding.toPath;
      final bool signUp = state.subloc == AppPage.signUp.toPath;
      final bool signIn = state.subloc == AppPage.signIn.toPath;
      final bool passwordRecovery =
          state.subloc == AppPage.passwordRecovery.toPath;
      final bool loading = authBloc.state is AuthLoadingState;
      //final bool loading = state.subloc == AppPage.loading.toPath;

      if (loading) {
        return AppPage.loading.toPath;
      } else if (!loggedIn) {
        return signIn ? null : AppPage.signIn.toPath;
      } else if (loggingIn) {
        return AppPage.home.toPath;
      }
      return null;

      //   if (loading) {
      //     return loading ? null : AppPage.loading.toPath;
      //   } else if (!loggedIn &&
      //       !signUp &&
      //       !signIn &&
      //       !passwordRecovery &&
      //       !onBoarding) {
      //     return onBoarding ? null : AppPage.onBoarding.toPath;
      //   } else if (!loggedIn &&
      //       signUp &&
      //       !signIn &&
      //       !passwordRecovery &&
      //       !onBoarding) {
      //     return signUp ? null : AppPage.signUp.toPath;
      //   } else if (!loggedIn &&
      //       !signUp &&
      //       signIn &&
      //       !passwordRecovery &&
      //       !onBoarding) {
      //     return signIn ? null : AppPage.signIn.toPath;
      //   } else if (!loggedIn &&
      //       !signUp &&
      //       !signIn &&
      //       passwordRecovery &&
      //       !onBoarding) {
      //     return passwordRecovery ? null : AppPage.passwordRecovery.toPath;
      //   } else if (loggingIn) {
      //     return AppPage.home.toPath;
      //   }
      //   return null;
    },

    // --- 2 ----
    // redirect: (context, state) {
    //   final homeLocation = state.subloc == APP_PAGE.home.toPath;
    //   final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
    //   final onBoardingLocation = state.subloc == APP_PAGE.onBoarding.toPath;
    //   final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
    //   final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
    //   final passwordRecoveryLocation =
    //       state.subloc == APP_PAGE.passwordRecovery.toPath;
    //   //final errorLocation = state.subloc == APP_PAGE.error.toPath;

    //   final isLoading = authBloc.state is LoadingState;
    //   final isAuthenticated = authBloc.state is AuthenticatedState;
    //   final isUnAuthenticated = authBloc.state is UnAuthenticatedState;
    //   final isOpenSignUp = authBloc.state is OpenSignUpState;
    //   final isOpenSignIn = authBloc.state is OpenSignInState;
    //   final isOpenPasswordRecovery =
    //       authBloc.state is OpenPasswordRecoveryState;

    //   final isGoingToLogin = state.subloc == signInLocation;
    //   final isGoingToSignUp = state.subloc == signUpLocation;
    //   // final isGoingToInit = state.subloc == splashLocation;
    //   final isGoingToOnboard = state.subloc == onBoardingLocation;

    //   if (isLoading) {
    //     log('1');
    //     return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   } else if (isUnAuthenticated) {
    //     log('2');
    //     // return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //     return APP_PAGE.onBoarding.toPath;
    //   } else if (isAuthenticated) {
    //     log('5');
    //     //return homeLocation ? null : APP_PAGE.home.toPath;
    //     return null;
    //   }
    //   return null;

    // ---- 3 ----
    // redirect: (context, state) {
    //   final homeLocation = state.subloc == APP_PAGE.home.toPath;
    //   final loadingLocation = state.subloc == APP_PAGE.loading.toPath;
    //   final onBoardingLocation = state.subloc == APP_PAGE.onBoarding.toPath;
    //   final signInLocation = state.subloc == APP_PAGE.signIn.toPath;
    //   final signUpLocation = state.subloc == APP_PAGE.signUp.toPath;
    //   final passwordRecoveryLocation =
    //       state.subloc == APP_PAGE.passwordRecovery.toPath;
    //   //final errorLocation = state.subloc == APP_PAGE.error.toPath;

    //   final isLoading = authBloc.state is LoadingState;
    //   final isAuthenticated = authBloc.state is AuthenticatedState;
    //   final isUnAuthenticated = authBloc.state is UnAuthenticatedState;
    //   final isOpenSignUp = authBloc.state is OpenSignUpState;
    //   final isOpenSignIn = authBloc.state is OpenSignInState;
    //   final isOpenPasswordRecovery =
    //       authBloc.state is OpenPasswordRecoveryState;

    //   final isGoingToLogin = state.subloc == signInLocation;
    //   final isGoingToSignUp = state.subloc == signUpLocation;
    //   // final isGoingToInit = state.subloc == splashLocation;
    //   final isGoingToOnboard = state.subloc == onBoardingLocation;

    //   // if (isLoading) {
    //   //   log('1');
    //   //   return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   // } else if (!isAuthenticated &&
    //   //     !signUpLocation &&
    //   //     signInLocation &&
    //   //     passwordRecoveryLocation) {
    //   //   log('3');
    //   //   return "/signUp";
    //   //   //return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (!isAuthenticated &&
    //   //     signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('3');
    //   //   return "/signIn";
    //   //   //return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (!isAuthenticated &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('3');
    //   //   return "/passwordRecovery";
    //   //   //return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (isAuthenticated) {
    //   //   log('4');
    //   //   return null;
    //   // }

    //   // if (!isInitialized && !isGoingToInit) {
    //   //   return splashLocation;
    //   //   // If not onboard and not going to onboard redirect to OnBoarding
    //   // } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
    //   //   return onboardLocation;
    //   //   // If not logedin and not going to login redirect to Login
    //   // } else if (isInitialized &&
    //   //     isOnboarded &&
    //   //     !isLogedIn &&
    //   //     !isGoingToLogin) {
    //   //   return loginLocation;
    //   //   // If all the scenarios are cleared but still going to any of that screen redirect to Home
    //   // } else if ((isLogedIn && isGoingToLogin) ||
    //   //     (isInitialized && isGoingToInit) ||
    //   //     (isOnboarded && isGoingToOnboard)) {
    //   //   return homeLocation;
    //   // } else {
    //   //   // Else Don't do anything
    //   //   return null;
    //   // }

    //   if (isLoading) {
    //     log('1');
    //     return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   } else if (isUnAuthenticated) {
    //     log('2');
    //     // return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //     return APP_PAGE.onBoarding.toPath;

    //     // } else if (isOpenSignUp) {
    //     //   log('2');
    //     //   return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //     // } else if (isOpenSignIn) {
    //     //   log('3');
    //     //   return signInLocation ? null : APP_PAGE.signIn.toPath;
    //     // } else if (isOpenPasswordRecovery) {
    //     //   log('4');
    //     //   return passwordRecoveryLocation
    //     //       ? null
    //     //       : APP_PAGE.passwordRecovery.toPath;
    //   } else if (isAuthenticated) {
    //     log('5');
    //     //return homeLocation ? null : APP_PAGE.home.toPath;
    //     return null;
    //   }
    //   return null;

    //   // if (isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('1');
    //   //   return loadingLocation ? null : APP_PAGE.loading.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return onBoardingLocation ? null : APP_PAGE.onBoarding.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     signUpLocation &&
    //   //     !signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     signInLocation &&
    //   //     !passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return signInLocation ? null : APP_PAGE.signIn.toPath;
    //   // } else if (!isLoading &&
    //   //     !isAuthenticated &&
    //   //     !onBoardingLocation &&
    //   //     !signUpLocation &&
    //   //     !signInLocation &&
    //   //     passwordRecoveryLocation) {
    //   //   log('2');
    //   //   return passwordRecoveryLocation
    //   //       ? null
    //   //       : APP_PAGE.passwordRecovery.toPath;

    //   //   //return APP_PAGE.onBoarding.toPath;

    //   //   // } else if (isOpenSignUp) {
    //   //   //   log('2');
    //   //   //   return signUpLocation ? null : APP_PAGE.signUp.toPath;
    //   //   // } else if (isOpenSignIn) {
    //   //   //   log('3');
    //   //   //   return signInLocation ? null : APP_PAGE.signIn.toPath;
    //   //   // } else if (isOpenPasswordRecovery) {
    //   //   //   log('4');
    //   //   //   return passwordRecoveryLocation
    //   //   //       ? null
    //   //   //       : APP_PAGE.passwordRecovery.toPath;
    //   // } else if (homeLocation) {
    //   //   log('5');
    //   //   return homeLocation ? null : APP_PAGE.home.toPath;
    //   //   return null;
    //   // }
    //   // return null;
    // },
  );
}
