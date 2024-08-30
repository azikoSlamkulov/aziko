import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.bgColorMain,
      //drawer: MainDrawer(user: user),
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/test');
          },
          child: const Text('Ok'),
        ),
      ),
    );
  }
}
