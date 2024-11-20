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

import 'package:aziko/src/core/presentation/pages/navbar/navbar.dart';
import 'package:aziko/src/core/domain/routes/go_router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../module/module.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  AppRouter();
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: AppPage.home.toPath,
    routes: <GoRoute>[
      /// Loading
      GoRoute(
        path: AppPage.loading.toPath,
        name: AppPage.loading.toName,
        builder: (context, state) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: const Center(
            //child: progressIndicator.circularProgress(),
            child: CircularProgressIndicator(),
          ),
        ),
      ),

      /// Home
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            mobile: HomePage(),
            tablet: HomePage(),
          ),
        ),
      ),

      /// Widgets
      GoRoute(
        path: AppPage.widgets.toPath,
        name: AppPage.widgets.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            mobile: WidgetsListPage(),
            tablet: WidgetsListPage(),
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
            currentIndex: 2,
            mobile: FavoritesPage(),
            tablet: FavoritesPage(),
          ),
        ),
      ),

      /// Test
      GoRoute(
        path: AppPage.test.toPath,
        name: AppPage.test.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 3,
            mobile: TestListPage(),
            tablet: TestListPage(),
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
            mobile: ProfilePage(),
            tablet: ProfilePage(),
          ),
        ),
      ),
    ],

    // Error
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          state.extra.toString(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    ),
  );
}
