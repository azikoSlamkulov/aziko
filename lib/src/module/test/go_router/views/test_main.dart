
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final SharedPreferences sharedPreferences =
//       await SharedPreferences.getInstance();
//   runApp(MyApp(sharedPreferences: sharedPreferences));
// }

// class GoRouter2App extends StatefulWidget {
//   GoRouter2App({Key? key, required this.sharedPreferences}) : super(key: key);

//   final SharedPreferences sharedPreferences;

//   @override
//   State<GoRouter2App> createState() => _GoRouter2AppState();
// }

// class _GoRouter2AppState extends State<GoRouter2App> {
//   late AppService appService;
//   late AuthService authService;
//   late StreamSubscription<bool> authSubscription;

//   @override
//   void initState() {
//     appService = AppService(widget.sharedPreferences);
//     authService = AuthService();
//     authSubscription = authService.onAuthStateChange.listen(onAuthStateChange);
//     super.initState();
//   }

//   void onAuthStateChange(bool login) {
//     appService.loginState = login;
//   }

//   @override
//   void dispose() {
//     authSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AppService>(create: (_) => appService),
//         Provider<AppRouter>(create: (_) => AppRouter(appService)),
//         Provider<AuthService>(create: (_) => authService),
//       ],
//       child: Builder(
//         builder: (context) {
//           final GoRouter goRouter =
//               Provider.of<AppRouter>(context, listen: false).router;
//           return MaterialApp.router(
//             title: "Router App",
//             routeInformationParser: goRouter.routeInformationParser,
//             routerDelegate: goRouter.routerDelegate,
//           );
//         },
//       ),
//     );
//   }
// }