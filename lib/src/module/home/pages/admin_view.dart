import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //drawer: MainDrawer(user: user),
        appBar: AppBar(
          title: const Text('Home View'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Aamin View'),
        ));
  }
}
