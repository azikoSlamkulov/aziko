import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_bloc.dart';
import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_event.dart';
import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';

class TestView extends StatelessWidget {
  TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is LoadingState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return HomeView(user: state.user);
        }
        return const Text('data');
      }),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key, required this.user}) : super(key: key);

  UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sdsd'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${user.name}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => BlocProvider.of<UserBloc>(context).add(
              const GetUserEvent('1'),
            )),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
