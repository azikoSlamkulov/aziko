// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class PasswordRecoveryView extends StatelessWidget {
//   const PasswordRecoveryView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailCont = TextEditingController();
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//     bool isEmail(String input) => EmailValidator.validate(input);
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is AuthFailureState) {
//           showTopSnackBar(
//             Overlay.of(context),
//             CustomSnackBar.error(
//               message: state.message.toString(),
//             ),
//           );
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => MyErrorWidget(
//           //       //message: state.message,
//           //     ),
//           //   ),
//           // );
//         }
//         if (state is SentPasswordState) {
//           showTopSnackBar(
//             Overlay.of(context),
//             CustomSnackBar.error(
//               message: 'Письмо отправлено на почту.',
//             ),
//           );
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => MyErrorWidget(
//           //       //message: state.message,
//           //     ),
//           //   ),
//           // );
//         }
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.bgColorMain,
//         appBar: CustomAppBar(title: '', bgColor: AppColors.bgColorMain),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: REdgeInsets.only(left: 15, right: 15, top: 15, bottom: 25),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Восстановление пароля',
//                         style: AppTextStyles.black30Bold,
//                       ),
//                     ],
//                   ),
//                   70.verticalSpace,
//                   Text(
//                     'Пожалуйста, введите свой адрес электронной почты. Вы получите ссылку для создания нового пароля по электронной почте.',
//                     style: AppTextStyles.black16,
//                   ),

//                   /// Email
//                   30.verticalSpace,

//                   CustomTextFormField(
//                     controller: emailCont,
//                     sizedBoxWidth: double.infinity,
//                     labelText: 'Эл. почта',
//                     validator: (value) {
//                       if (value != null && value.isEmpty) {
//                         return 'Поле не должно быть пустым!';
//                       } else if (!isEmail(value!)) {
//                         return 'Пример: your@email.com';
//                       }
//                       return null;
//                     },
//                   ),

//                   /// Button
//                   70.verticalSpace,

//                   CustomButton(
//                     // sizedBoxHeight: 48.h,
//                     // sizedBoxWidth: double.infinity,
//                     //borderRadius: 30,
//                     text: 'Отправить',
//                     textStyle: AppTextStyles.white18Bold,
//                     // text: Text(
//                     //   'Отправить',
//                     //   style: AppTextStyles.white18Bold,
//                     // ),
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         log('reg');
//                         context.read<AuthBloc>().add(
//                               SendPasswordResetEmailEvent(
//                                 email: emailCont.text.trim(),
//                               ),
//                             );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
