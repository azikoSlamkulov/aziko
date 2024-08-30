// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// import '../../src.dart';

// /// DEVELOPMENT

// class App extends StatelessWidget {
//   const App({super.key, this.token});

//   final String? token;

//   @override
//   Widget build(BuildContext context) {
//     final router = AppRouter(context.watch<AuthCubit>().state).router;
//     return MaterialApp.router(
//       theme: context.watch<ThemeCubit>().state.theme.theme,
//       debugShowCheckedModeBanner: false,
//       locale: WidgetsBinding.instance.window.locale,
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//       ],
//       routeInformationParser: router.routeInformationParser,
//       routerDelegate: router.routerDelegate,
//       supportedLocales: AppLocalizations.supportedLocales,
//       // home: token != null ? const CounterPage() : const SignInPage(),
//     );
//   }
// }
