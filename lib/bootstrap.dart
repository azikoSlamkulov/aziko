import 'dart:async';
import 'dart:developer';

import 'package:aziko/locator.dart';
import 'package:aziko/src/module/auth/presentation/logic/password_cubit/password_cubit.dart';

import 'package:aziko/src/module/test/bloc/test_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'src/module/auth/presentation/logic/timer_cubit/timer_cubit.dart';
import 'src/module/test/http/presentation/bloc/all_users_cubit/all_users_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await init();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
        ),
        BlocProvider<TestBloc>(create: (context) => TestBloc()),
        //BlocProvider<UserBloc>(create: (context) => sl<UserBloc>()),
        BlocProvider<TimerCubit>(create: (context) => TimerCubit()),
        BlocProvider<PasswordCubit>(create: (context) => PasswordCubit()),
        BlocProvider<AllUsersCubit>(
          create: (context) => sl<AllUsersCubit>()..loadAllUsers(),
        ),
      ],
      child: await builder(),
    ),
  );

  // await runZonedGuarded(
  //   () async {
  //     await BlocOverrides.runZoned(
  //       //() async => runApp(await builder()),
  //       () async => runApp(
  //         MultiBlocProvider(
  //           providers: [
  //             BlocProvider<AuthBloc>(
  //               create: (context) => sl<AuthBloc>()..add(GetCurrentUserEvent()),
  //             ),
  //             BlocProvider<TestBloc>(create: (context) => TestBloc()),
  //             //BlocProvider<UserBloc>(create: (context) => sl<UserBloc>()),
  //             BlocProvider<TimerCubit>(create: (context) => TimerCubit()),
  //           ],
  //           child: await builder(),
  //         ),
  //       ),
  //       blocObserver: AppBlocObserver(),
  //     );
  //   },
  //   (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  // );
}
