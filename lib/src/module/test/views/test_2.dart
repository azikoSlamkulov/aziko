import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/test_bloc.dart';
import '../bloc/test_event.dart';

class Test2View extends StatelessWidget {
  const Test2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MainDrawer(user: user),
      appBar: AppBar(
        title: const Text('Test_2 View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test_2 View'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TestBloc>(context).add(
                  OpenTest3Event(),
                );
              },
              child: const Text('Go to test 3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
