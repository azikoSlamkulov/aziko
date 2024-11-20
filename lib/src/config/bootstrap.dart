import 'dart:async';
import 'dart:developer';

import 'package:aziko/src/core/domain/di/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/widgets/e_shop/e_shop.dart';
import 'theme/bloc/theme_bloc.dart';

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
  await init();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => sl<ThemeBloc>(),
        ),
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        // //BlocProvider<ProductCubit>(create: (context) => sl<ProductCubit>()),
        BlocProvider<CategoriesBloc>(create: (context) => sl<CategoriesBloc>()),
        BlocProvider<BrandsBloc>(create: (context) => sl<BrandsBloc>()),
        BlocProvider<BigImageCubit>(
          create: (context) => sl<BigImageCubit>(),
        ),
      ],
      child: await builder(),
    ),
  );
}
