import 'package:aziko/src/module/auth/presentation/views/sign_in_vew.dart';
import 'package:flutter/material.dart';

class AuthCheckView extends StatelessWidget {
  const AuthCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //padding: const EdgeInsets.only(
          // right: index == allProducts.length - 1 ? 15 : 0,
          // left: index == allProducts.length - 1 ? 15 : 15,
          //),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // BlocProvider.of<AuthBloc>(context).add(
                //   SignOutEvent(),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInView(),
                  ),
                );
              },
              child: const Text('Вход'),
            ),
          ],
        ),
      ),
    );
  }
}
