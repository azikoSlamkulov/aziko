enum AppPage {
  /// Auth
  onBoarding,
  loading,
  signIn,
  signUp,
  passwordRecovery,

  /// Home
  home,

  /// Widgets
  widgets,

  /// Favorites
  favorites,

  /// Test
  test,

  /// Profile
  profile,

  /// Error
  error,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      /// Auth
      case AppPage.loading:
        return "/splash";
      case AppPage.onBoarding:
        return "/start";
      case AppPage.signUp:
        return "/signUp";
      case AppPage.signIn:
        return "/signIn";
      case AppPage.passwordRecovery:
        return "/passwordRecovery";

      /// Home
      case AppPage.home:
        return "/";

      /// Widgets
      case AppPage.widgets:
        return "/widgets";

      /// Favorites
      case AppPage.favorites:
        return "/favorites";

      /// Test
      case AppPage.test:
        return "/test";

      /// Profile
      case AppPage.profile:
        return "/profile";

      /// Error
      case AppPage.error:
        return "/error";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      ///Auth
      case AppPage.onBoarding:
        return "START";
      case AppPage.loading:
        return "LOADING";
      case AppPage.signIn:
        return "SIGNIN";
      case AppPage.signUp:
        return "SIGNUP";
      case AppPage.passwordRecovery:
        return "PASSWORDRECOVERY";

      /// Home
      case AppPage.home:
        return "HOME";

      /// Widgets
      case AppPage.widgets:
        return "WIDGETS";

      /// Favorites
      case AppPage.favorites:
        return "FAVORITES";

      /// Test
      case AppPage.test:
        return "TEST";

      /// Profile
      case AppPage.profile:
        return "PROFILE";

      /// Error
      case AppPage.error:
        return "ERROR";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      /// Auth
      case AppPage.onBoarding:
        return "Welcome to My App";
      case AppPage.signIn:
        return "Sign In";
      case AppPage.signUp:
        return "Sign Up";
      case AppPage.passwordRecovery:
        return "Password Recovery";

      /// Home
      case AppPage.home:
        return "Home";

      /// Widgets
      case AppPage.widgets:
        return "Widgets";

      /// Favorites
      case AppPage.favorites:
        return "Favorites";

      /// Test
      case AppPage.test:
        return "Test";

      /// Profile
      case AppPage.profile:
        return "Profile";

      case AppPage.error:
        return "My App Error";

      default:
        return "Home";
    }
  }
}
