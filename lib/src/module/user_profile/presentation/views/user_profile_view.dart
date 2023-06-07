import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:aziko/src/module/user_profile/domain/entities/user_entity.dart';
import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_bloc.dart';
import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_event.dart';
import 'package:aziko/src/module/user_profile/presentation/logic/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../locator.dart';
import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';
import '../../../../util/app_widgets/others/circle_profile_widget.dart';
import '../../../auth/domain/entities/auth_user_entity.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({
    super.key,
    required this.user,
  });

  final AuthUser user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(GetUserEvent(user.userID)),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is LoadingState) {
            //return const LoadingWidget();
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return UserProfile2View(
              user: state.user,
            );
          } else if (state is UserFailureState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
      //child: UserProfile2View(),
    );
  }
}

class UserProfile2View extends StatelessWidget {
  UserProfile2View({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserEntity user;
  String profileImageFile = '';
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: AppBar(
        title: const Text('User Profile'),
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
                  isUpdate: true,
                  onTap: () async {
                    await showBottomSheet(context);
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Имя:'),
                    const SizedBox(width: 20),
                    user.name != null
                        ? Text(
                            '${user.name}',
                            style: const TextStyle(color: Colors.red),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: const Text('Ввести имя'),
                          ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Телефон:'),
                    const SizedBox(width: 20),
                    user.phoneNumber != ''
                        ? Text(
                            '${user.phoneNumber}',
                            style: const TextStyle(color: Colors.red),
                          )
                        : TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                  LinkWithPhoneNumberEvent(
                                    '+996${phoneController.text}',
                                    context,
                                  ),
                                );

                                // BlocProvider.of<TimerCubit>(context).startTimer();
                              }
                            },
                            child: const Text('Добавить номер телефона'),
                          ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Почта:'),
                    const SizedBox(width: 20),
                    user.email != null
                        ? Text(
                            '${user.email}',
                            style: const TextStyle(color: Colors.red),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: const Text('Добавить номер эл. почту'),
                          ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Роль:'),
                    const SizedBox(width: 20),
                    Text('${user.role}'),
                  ],
                ),
                // const SizedBox(height: 60),
                // _textFormField(context),
                // const SizedBox(height: 20),
                // _customButtonWidget(context),
                // const SizedBox(height: 20),
                // _customButtonWidget(context),
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

  Form _textFormField(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        controller: phoneController,
        labelText: 'Номер телефона',
        //fillColor: AppColors.textFormFieldBgColor,
        keyboardType: TextInputType.number,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: AppColors.black,
        //     width: 1.0,
        //     //style: BorderStyle.none,
        //   ),
        // ),
        validator: (phone) {
          if (phone == null || phone.isEmpty) {
            return 'Поле не должно быть пустым!';
          }
          if (phone.length < 9) {
            return 'Номер должен состоять из 9 цифр!';
          }
          return null;
        },
        onChanged: (phone) {
          if (phoneController.text.length == 9) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
      ),
    );
  }

  CustomElevatedButton _customButtonWidget(BuildContext context) {
    return CustomElevatedButton(
      text: const Text(
        'Связать номер',
        style: TextStyle(fontSize: 16),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<AuthBloc>(context).add(
            LinkWithPhoneNumberEvent(
              '+996${phoneController.text}',
              context,
            ),
          );

          // BlocProvider.of<TimerCubit>(context).startTimer();
        }
      },
      bgColor: AppColors.blue,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.85,
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          color: AppColors.mainColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          // if (initialPage == 0) {
                          //   controller.getProfileImage(ImageSource.gallery);
                          //   Navigator.pop(context);
                          // } else {
                          //   controller.getAutoImage(ImageSource.gallery);
                          //   Navigator.pop(context);
                          // }
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.image,
                          color: AppColors.mainColor,
                        ),
                        iconSize: 40,
                      ),
                      //const SizedBox(height: 2),
                      const Text(
                        'Галерея',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 60),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          // if (controller.initialPage == 0) {
                          //   controller.getProfileImage(ImageSource.camera);
                          //   Navigator.pop(context);
                          // } else {
                          //   controller.getAutoImage(ImageSource.camera);
                          //   Navigator.pop(context);
                          // }
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.camera,
                          color: AppColors.mainColor,
                        ),
                        iconSize: 40,
                      ),
                      //const SizedBox(height: 10),
                      const Text(
                        'Камера',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



// import 'dart:developer';

// import 'package:flutter/material.dart';

// import '../../domain/usecases/user/get_user.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GetUser user;
//   int _counter = 0;

//   _MyHomePageState(this.user);

//   Future<void> _incrementCounter() async {
//     setState(() async {
//       final _user = await user(GetUserParams(userID: '1'));
//       _user.fold(
//         (error) => const Text('sdsd'),
//         (_users) {
//           log('$_users');
//           return _users;
//         },
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Text(
//             //   '${_users}',
//             // ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
