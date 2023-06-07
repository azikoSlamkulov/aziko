import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../util/app_constants/colors/app_colors.dart';
import '../../../util/app_widgets/others/circle_profile_widget.dart';
import '../../auth/domain/entities/auth_user_entity.dart';

import '../widgets/drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final AuthUser user;
  String profileImageFile = '';
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      drawer: MainDrawer(user: user),
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleProfileWidget(
                  imageUrl: user.photoURL ?? profileImageFile,
                  icon: FontAwesomeIcons.user,
                  size: 60,
                  isUpdate: false,
                  onTap: () async {
                    //await showBottomSheet(context);
                  },
                ),
                const SizedBox(height: 30),
                const Text('Имя:'),
                const SizedBox(height: 10),
                Text(
                  '${user.name}',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 30),
                const Text('Телефон:'),
                const SizedBox(height: 10),
                Text(
                  '${user.phoneNumber}',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 30),
                const Text('Почта:'),
                const SizedBox(height: 10),
                Text(
                  '${user.email}',
                  style: const TextStyle(color: Colors.red),
                ),
                // const Text('Фото:'),
                // const SizedBox(height: 10),
                // Text(
                //   '${user.photoURL}',
                //   style: const TextStyle(color: Colors.red),
                // ),
                // const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
