import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:aziko/src/module/test/go_router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoRouterHomeView extends StatelessWidget {
  const GoRouterHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_PAGE.home.toTitle),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  SignOutEvent(),
                );
              },
              child: const Text("Log out"),
            ),
            TextButton(
              onPressed: () {
                // GoRouter.of(context)
                //     .go(APP_PAGE.error.toPath, extra: "Erro from Home");
                GoRouter.of(context).go("/error");
              },
              child: const Text("Show Error"),
            ),
          ],
        ),
      ),
    );
  }
}
