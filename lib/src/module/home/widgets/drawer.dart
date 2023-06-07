import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:aziko/src/module/my_widgets/presentation/views/custom_widgets.dart';
import 'package:aziko/src/module/my_widgets/presentation/views/material_widgets.dart';
import 'package:aziko/src/util/app_constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../util/app_widgets/others/circle_profile_widget.dart';
import '../../auth/domain/entities/auth_user_entity.dart';

import '../../user_profile/presentation/views/user_profile_view.dart';
// import '../../../routes/app_pages.dart';
// import '../../authentication/controllers/authentication_controller.dart';
// import '../controllers/admin_controller.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key, required this.user}) : super(key: key);

  final AuthUser user;
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
                    children: [
                      //profileImageFile.isNotEmpty
                      user.photoURL != null
                          ? CircleProfileWidget(
                              imageUrl: user.photoURL ?? profileImageFile,
                              icon: FontAwesomeIcons.user,
                              size: 40,
                              isUpdate: false,
                              onTap: () async {},
                            )
                          : const SizedBox(height: 120),
                      user.name != null
                          ? Text(
                              '${user.name}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                            )
                          : Text(
                              '${user.phoneNumber}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text('Профиль'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileView(user: user),
                    ),
                  ).then(
                    (value) => Navigator.pop(context),
                  );
                  // Navigator.pushNamed(context, 'UserProfileView',
                  //     arguments: user);
                  // Get.back();
                  // //controller.getUsersByIsWorking();
                  // Get.toNamed(Routes.USER_PROFILE);
                },
              ),
            ),
            Card(
              child: ExpansionTile(
                //leading: ,
                title: const Text('Виджеты'),
                children: [
                  ListTile(
                    title: const Text('Сторонние'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomWidgets(),
                        ),
                      ).then(
                        (value) => Navigator.pop(context),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Material'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MaterialWidgets(),
                        ),
                      ).then(
                        (value) => Navigator.pop(context),
                      );
                    },
                  ),
                ],
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
            // Card(
            //   child: ListTile(
            //     title: const Text('Пользователи'),
            //     trailing: const Icon(Icons.keyboard_arrow_right),
            //     onTap: () {
            //       Get.back();
            //       controller.getUsersByIsWorking();
            //       Get.toNamed(Routes.ACCOUNTS);
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     title: const Text('Добавить'),
            //     trailing: const Icon(Icons.keyboard_arrow_right),
            //     onTap: () {
            //       Get.back();
            //       //controller.getUsersByIsWorking();
            //       Get.toNamed(Routes.CREATE_ACCOUNT);
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     title: const Text('Сообщение'),
            //     trailing: const Icon(Icons.keyboard_arrow_right),
            //     onTap: () {
            //       Navigator.pop(context);
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialogWidget(
            //             title: 'Сообщение',
            //             textFormFieldOne: CustomTextFormField(
            //               onChanged: (value) {
            //                 //provider.countTextController = value;
            //               },
            //               textEditingController:
            //                   provider.messageTextController,
            //               autofocus: true,
            //               hintText: 'Сообщение',
            //             ),
            //             function: () {
            //               //Navigator.pop(context);
            //               provider.getMessage(context);
            //               // ShowSnackBar().showSnackBar(
            //               //   context,
            //               //   Text(
            //               //       'Другое: ${provider.othersTextController.text}'),
            //               // );
            //             },
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     title: const Text('Расход'),
            //     trailing: const Icon(Icons.keyboard_arrow_right),
            //     onTap: () {
            //       // Navigator.pop(context);
            //       // showDialog(
            //       //   context: context,
            //       //   builder: (BuildContext context) {
            //       //     return AlertDialogWidget();
            //       //   },
            //       // );
            //     },
            //   ),
            // ),
            // Card(
            //   child: ExpansionTile(
            //     //leading: ,
            //     title: const Text('План'),
            //     children: [
            //       ListTile(
            //         leading: const SizedBox(width: 50),
            //         title: const Text('Дроугое'),
            //         trailing: Text('${provider.othersTextController.text}'),
            //         onTap: () {
            //           Navigator.pop(context);
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return AlertDialogWidget(
            //                 title: 'Другое число',
            //                 numberTextFormFieldOne: CustomTextFormField(
            //                   onChanged: (value) {
            //                     //provider.countTextController = value;
            //                   },
            //                   keyboardType: TextInputType.number,
            //                   textEditingController:
            //                       provider.othersTextController,
            //                   autofocus: true,
            //                   hintText: 'Число',
            //                 ),
            //                 function: () {
            //                   //Navigator.pop(context);
            //                   provider.getOthers(context);
            //                   ShowSnackBar().showSnackBar(
            //                     context,
            //                     Text(
            //                         'Другое: ${provider.othersTextController.text}'),
            //                   );
            //                 },
            //               );
            //             },
            //           );
            //         },
            //       ),
            //       ListTile(
            //         title: const Text('Выключено'),
            //         leading: Radio(
            //             value: Planes.planeFalse,
            //             groupValue: provider.plane,
            //             onChanged: (Planes value) {
            //               provider.addPlane(value);
            //             }),
            //       ),
            //       ListTile(
            //         title: const Text('План - 1700'),
            //         leading: Radio(
            //             value: Planes.plane1700,
            //             groupValue: provider.plane,
            //             onChanged: (Planes value) {
            //               provider.addPlane(value);
            //             }),
            //       ),
            //       ListTile(
            //         title: const Text('План - 800'),
            //         leading: Radio(
            //             value: Planes.plane700,
            //             groupValue: provider.plane,
            //             onChanged: (Planes value) {
            //               provider.addPlane(value);
            //             }),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
