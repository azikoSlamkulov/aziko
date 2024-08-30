import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../routes/app_pages.dart';
// import '../../authentication/controllers/authentication_controller.dart';
// import '../controllers/admin_controller.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);

  String profileImageFile = '';
  // final AuthenticationController _authenticationController =
  //     AuthenticationController.findAuthCont!;
//bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 5.0,
        child: ListView(
          children: [
            Container(
              color: Colors.blueAccent,
              //color: AppBarTheme.of(context).backgroundColor,
              child: Center(
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Выход'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () async {
                  //await _authenticationController.signOut1();
                  BlocProvider.of<AuthBloc>(context).add(
                    SignOutEvent(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
