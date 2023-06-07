import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Test3View extends StatelessWidget {
  const Test3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MainDrawer(user: user),
      appBar: AppBar(
        title: const Text('Test_3 View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test_3 View'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go to test 3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/Test2View');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
