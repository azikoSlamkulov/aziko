import 'dart:developer';

import 'package:aziko/src/config/util/app_widgets/progress/progress.dart';
import 'package:aziko/src/module/test/http/domain/entities/user_entity.dart';
import 'package:aziko/src/module/test/http/presentation/bloc/all_users_cubit/all_users_bloc.dart';
import 'package:aziko/src/module/test/http/presentation/bloc/all_users_cubit/all_users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUserState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return progressIndicator.circularProgress();
        } else if (state is LoadedState) {
          return NestedWidgetsPage(
            allUsers: state.allUsers,
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}

class NestedWidgetsPage extends StatelessWidget {
  NestedWidgetsPage({
    Key? key,
    required this.allUsers,
  }) : super(key: key);

  List<FakeUserEntity> allUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: allUsers.length,
        itemBuilder: ((context, index) {
          final user = allUsers[index];
          return Card(
            color: Color.fromARGB(255, 139, 173, 232),
            child: ListTile(
              title: Text('${user.name}'),
            ),
          );
        }),
      ),
      // body: ListView.separated(
      //   itemBuilder: ((context, index) {
      //     final user = allUsers[index];
      //     return Text('${user.name}');
      //   }),
      //   separatorBuilder: (context, index) {
      //     return const Divider(
      //       color: Colors.black,
      //     );
      //   },
      //   itemCount: allUsers.length,
      // ),
    );
  }
}
