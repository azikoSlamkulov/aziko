// import 'dart:developer';

// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../../locator.dart';
// import '../../../../util/app_constants/colors/app_colors.dart';
// import '../../../../util/app_constants/spaces/spaces.dart';
// import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
// import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';
// import '../../../../util/app_widgets/others/circle_profile_widget.dart';
// import '../../../../util/app_widgets/others/custom_divider.dart';
// import '../../../../util/app_widgets/progress/progress.dart';
// import '../logic/auth_bloc/auth_bloc.dart';
// import '../logic/auth_bloc/auth_event.dart';
// import '../widgets/btn_facebook_widget.dart';
// import '../widgets/btn_google_widget.dart';

// // class SignUpView extends StatelessWidget {
// //   const SignUpView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (context) => sl<AuthBloc>(),
// //       child: SignUp2View(),
// //     );
// //   }
// // }

// class SignUpView extends StatelessWidget {
//   SignUpView({
//     Key? key,
//   }) : super(key: key);

//   final TextEditingController nameCont = TextEditingController();
//   final TextEditingController emailCont = TextEditingController();
//   final TextEditingController passwordCont = TextEditingController();
//   final TextEditingController repeatPasswordCont = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   final nameFormKey = GlobalKey<FormState>();
//   final eMailFormKey = GlobalKey<FormState>();
//   final passwordFormKey = GlobalKey<FormState>();
//   final repeatPasswordFormKey = GlobalKey<FormState>();

//   bool isEmail(String input) => EmailValidator.validate(input);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColorMain,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 15,
//             vertical: 30,
//           ),
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       Icon(
//                         Icons.chevron_left_sharp,
//                         size: 30,
//                       ),
//                     ],
//                   ),
//                   AppSized.h25,
//                   const Text(
//                     'Регистрация',
//                     style: TextStyle(
//                       color: AppColors.blue,
//                       fontSize: 33,
//                       fontWeight: FontWeight.bold,
//                       //fontFamily:
//                     ),
//                   ),
//                   AppSized.h70,
//                   _name(context),
//                   AppSized.h5,
//                   _eMail(context),
//                   AppSized.h5,
//                   _password(context),
//                   _TextButtonIcon(context),
//                   AppSized.h30,
//                   _button(context),
//                   AppSized.h100,
//                   const Text(
//                     'Или зарегистрируйтесь с помощью соц. сетей.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   AppSized.h30,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       WidgetBtnFacebook(
//                         onTap: () {},
//                       ),
//                       AppSized.w20,
//                       WidgetBtnGoogle(
//                         onTap: () {
//                           BlocProvider.of<AuthBloc>(context).add(
//                             SignInWithGoogleEvent(),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _name(BuildContext context) {
//     return CustomTextFormField(
//       controller: nameCont,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       labelText: 'Имя',
//     );
//   }

//   _eMail(BuildContext context) {
//     return CustomTextFormField(
//       controller: emailCont,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       labelText: 'Почта',
//       validator: (value) {
//         if (!isEmail(value!)) {
//           return 'Введите эл.почту.';
//         } else if (value.isEmpty) {
//           return 'Поле не должно быть пустым!';
//         }
//         return null;
//       },
//     );
//   }

//   _password(BuildContext context) {
//     return CustomTextFormField(
//       controller: passwordCont,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       labelText: 'Пароль',
//     );
//   }

//   _repeatPassword(BuildContext context) {
//     return CustomTextFormField(
//       controller: repeatPasswordCont,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       labelText: 'Повтор пароля',
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Поле не должно быть пустым!';
//         } else if (passwordCont.text != repeatPasswordCont.text) {
//           return 'Пароли не совпадают';
//         }
//         return null;
//       },
//     );
//   }

//   _TextButtonIcon(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         TextButton.icon(
//             onPressed: () {},
//             icon: const Text(
//               'У вас уже есть аккаунт?',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: AppColors.black,
//               ),
//             ),
//             label: Icon(Icons.arrow_right)),
//       ],
//     );
//   }

//   _button(BuildContext context) {
//     return CustomElevatedButton(
//       bgColor: AppColors.red,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       text: const Text(
//         'Регистрация',
//         style: TextStyle(
//           //color: AppColors.blue,
//           fontSize: 18,
//           //fontWeight: FontWeight.bold,
//           //fontFamily:
//         ),
//       ),
//       onPressed: () async {
//         if (formKey.currentState!.validate()) {
//           log('reg');
//           BlocProvider.of<AuthBloc>(context).add(
//             SignUpEvent(
//               name: nameCont.text,
//               email: emailCont.text,
//               password: passwordCont.text,
//             ),
//           );
//         }
//       },
//     );
//   }
// }
