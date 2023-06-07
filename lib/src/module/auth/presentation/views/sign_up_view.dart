import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_in_vew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../locator.dart';
import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';
import '../../../../util/app_widgets/others/circle_profile_widget.dart';
import '../../../../util/app_widgets/others/custom_divider.dart';
import '../../../../util/app_widgets/progress/progress.dart';
import '../../../home/views/admin_view.dart';
import '../../../home/views/home_view.dart';
import '../logic/auth_bloc/auth_state.dart';

// class SignUpView extends StatelessWidget {
//   const SignUpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<AuthBloc>(),
//       child: SignUp2View(),
//     );
//   }
// }

class SignUpView extends StatelessWidget {
  SignUpView({
    //this.userCredential,
    Key? key,
  }) : super(key: key);
  //final UserCredential? userCredential;

  //XFile? _file;
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController mainPhoneNumberCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController repeatPasswordCont = TextEditingController();
  final userProfileFormKey = GlobalKey<FormState>();
  final eMailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final repeatPasswordFormKey = GlobalKey<FormState>();

  //RxString carController = ''.obs;
  bool isLoadingImage = false;
  String profileImageUrl = '';
  String autoImageUrl = '';
  bool isTextField = false;
  bool isCreatingUser = false;
  String autoImageFile = '';
  String profileImageFile = '';
  //int initialPage = 0;

  String dropdownvalue = 'user';
  var items = [
    'user',
    'admin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //AppAssets.emblem(width: 210, height: 210),
                //const SizedBox(height: 10),
                const Text(
                  'Регистрация',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    //fontFamily:
                  ),
                ),
                const SizedBox(height: 10),
                CircleProfileWidget(
                  imageUrl: profileImageFile,
                  icon: FontAwesomeIcons.user,
                  size: 60,
                  isUpdate: true,
                  onTap: () async {
                    await showBottomSheet(context);
                  },
                ),
                const SizedBox(height: 10),
                Form(
                  key: userProfileFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: emailCont,
                        sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
                        labelText: 'Почта',
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: passwordCont,
                        sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
                        labelText: 'Пароль',
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: repeatPasswordCont,
                        sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
                        labelText: 'Повтор пароля',
                      ),
                      const SizedBox(height: 30),
                      const CustomDivider(
                        text: 'Личная информация',
                        alignColor: AppColors.bgColorMain,
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: nameCont,
                        sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
                        labelText: 'Имя',
                      ),
                      // const SizedBox(height: 20),
                      // CustomTextFormField(
                      //   controller: mainPhoneNumberCont,
                      //   labelText: 'Номер телефона',
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _button(context),
                TextButton(
                  onPressed: () {
                    //Navigator.pop(context);
                    // BlocProvider.of<AuthBloc>(context).add(
                    //   UnAuthenticatedEvent(),
                    // );
                  },
                  child: const Text(
                    'Отмена',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _button(BuildContext context) {
    return CustomElevatedButton(
      bgColor: AppColors.red,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
      text: const Text(
        'Сохранить',
        style: TextStyle(
          //color: AppColors.blue,
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          //fontFamily:
        ),
      ),
      onPressed: () async {
        if (userProfileFormKey.currentState!.validate()) {
          BlocProvider.of<AuthBloc>(context).add(
            SignUpEvent(
              email: emailCont.text,
              password: passwordCont.text,
              name: nameCont.text,
              mainPhoneNumber: '',
              photoURL: '',
            ),
          );
        }
      },
      // onPressed: () async {
      //   if (controller.createAccountFormKey.currentState!.validate() &&
      //       controller.dropdownvalue.value == 'user') {
      //     await controller.createAccount(
      //       userID: userCredential!.user!.uid,
      //       firstName: controller.firstNameCont.text,
      //       lastName: controller.lastNameCont.text,
      //       mainPhoneNumber: userCredential!.user!.phoneNumber,
      //       secondPhoneNumber: controller.secondPhoneNumberCont.text,
      //       car: controller.carCont.value.text,
      //       carNumber: controller.carNumberCont.text,
      //       profilePhoto: controller.profileImageUrl.value,
      //     );
      //   } else if (controller.createAccountFormKey.currentState!.validate() &&
      //       controller.dropdownvalue.value == 'admin') {
      //     // TODO Доделать админ
      //     CustomFormFieldDialog().getDialog(
      //       title: 'Пароль',
      //       hintText: '',
      //       keyboardType: TextInputType.number,
      //       autofocus: true,
      //       controller: controller.passwordCont,
      //       key: controller.passFormKey,
      //       validator: (value) {
      //         if (value == null || value.isEmpty) {
      //           return 'Поле не должно быть пустым!';
      //         }
      //         if (value != controller.password) {
      //           return 'Не верный пороль!';
      //         }
      //         return null;
      //       },
      //       onTap: () {
      //         Get.back();
      //         controller.passwordCont.clear();
      //       },
      //       // onPressed: () async {
      //       //   if (controller.passFormKey.currentState!.validate() &&
      //       //       controller.passwordCont.text == controller.password) {
      //       //     await controller.createAccount(
      //       //       userID: userCredential!.user!.uid,
      //       //       firstName: controller.firstNameCont.text,
      //       //       lastName: controller.lastNameCont.text,
      //       //       mainPhoneNumber: userCredential!.user!.phoneNumber,
      //       //       secondPhoneNumber: controller.secondPhoneNumberCont.text,
      //       //       profilePhoto: controller.profileImageUrl.value,
      //       //     );
      //       //     controller.passwordCont.clear();
      //       //     Get.back();
      //       //   }
      //       // },
      //     );
      //   }
      // },
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

// profileImageUrl: profileImageFile,
// carImageUrl: autoImageFile,
// carOnTap: () async {
//   await showBottomSheet(context);
// },

//SizedBox(height: 25),
// Container(
//   alignment: Alignment.topRight,
//   child: Container(
//     //alignment: Alignment.topLeft,
//     padding: EdgeInsets.symmetric(horizontal: 12),
//     decoration: BoxDecoration(
//       color: AppColors.white,
//       borderRadius: BorderRadius.circular(7),
//     ),
//     child: DropdownButton(
//       value: dropdownvalue,
//       icon: const Icon(Icons.keyboard_arrow_down),
//       items: items.map((String items) {
//         return DropdownMenuItem(
//           value: items,
//           child: Text(items),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         dropdownvalue = newValue!;
//       },
//     ),
//   ),
// ),
