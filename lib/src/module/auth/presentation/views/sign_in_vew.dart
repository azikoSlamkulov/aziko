import 'dart:developer';

import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:aziko/src/module/auth/presentation/logic/password_cubit/password_cubit.dart';
import 'package:aziko/src/module/auth/presentation/logic/timer_cubit/timer_cubit.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_in_otp_view.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_up_view.dart';
import 'package:aziko/src/util/app_constants/spaces/spaces.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/app_constants/assets/app_assets.dart';
import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';
import '../../../../util/app_widgets/others/custom_divider.dart';
import '../widgets/btn_facebook_widget.dart';
import '../widgets/btn_google_widget.dart';

class SignInView extends StatelessWidget {
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();

  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 60,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppAssets.flutterLogo(width: 220, height: 180),
                  AppSized.h30,
                  const Text(
                    'Авторизуйтесть с помощью эл. почты или номера телефона.',
                    style: TextStyle(fontSize: 22),
                  ),
                  AppSized.h40,
                  _textFormField(context),
                  BlocBuilder<PasswordCubit, PasswordState>(
                    builder: (context, state) {
                      if (state is InvisibleState) {
                        return const SizedBox();
                      } else if (state is VisibleState) {
                        return _passwordFormField(context);
                      }
                      return const SizedBox();
                    },
                  ),
                  AppSized.h20,
                  _customButtonWidget(context),
                  AppSized.h10,
                  TextButton(
                    onPressed: () {},
                    child: const Text('Забыли пароль?'),
                  ),
                  AppSized.h10,
                  const CustomDivider(
                    text: 'или',
                    alignColor: AppColors.bgColorMain,
                  ),
                  AppSized.h30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetBtnFacebook(
                        onTap: () {},
                      ),
                      AppSized.w20,
                      WidgetBtnGoogle(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInWithGoogleEvent(),
                          );
                        },
                      ),
                    ],
                  ),
                  AppSized.h30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Если нет учетной записи.',
                        style: TextStyle(fontSize: 16),
                      ),
                      AppSized.w10,
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ),
                          );
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   OpenSignUpEvent(),
                          // );
                        },
                        child: const Text(
                          'Регистрация',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  //const SizedBox(height: 10),
                ],
              ),
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
        controller: textController,
        sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
        labelText: 'Номер телефона или эл. почта',
        //fillColor: AppColors.textFormFieldBgColor,
        //keyboardType: TextInputType.number,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: AppColors.black,
        //     width: 1.0,
        //     //style: BorderStyle.none,
        //   ),
        // ),
        validator: (value) {
          if (!isEmail(value!) && !isPhone('+996$value')) {
            return 'Введите номер телефона или эл.почту.';
          } else if (value.isEmpty) {
            return 'Поле не должно быть пустым!';
          }
          // else if (isPhone(value.runes.length.toString() < 9)) {
          //   return 'Номер должен состоять из 9 цифр!';
          // }
          return null;
        },
        onChanged: (value) {
          if (isPhone('+996$value')) {
            if (value.length == 9) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          } else if (isEmail(value)) {
            BlocProvider.of<PasswordCubit>(context).showInput(isEmail(value));
          } else {
            BlocProvider.of<PasswordCubit>(context).showInput(false);
          }
        },
      ),
    );
  }

  Column _passwordFormField(BuildContext context) {
    return Column(
      children: [
        AppSized.h20,
        Form(
          key: passwordFormKey,
          child: CustomTextFormField(
            controller: passwordController,
            sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
            labelText: 'Пароль',
            //fillColor: AppColors.textFormFieldBgColor,
            //keyboardType: TextInputType.number,
            validator: (phone) {
              if (phone == null || phone.isEmpty) {
                return 'Поле не должно быть пустым!';
              }
              return null;
            },
            // onChanged: (phone) {

            //   // if (controller.phoneController.text.length == 9) {
            //   //   FocusScope.of(context).requestFocus(FocusNode());
            //   // }
            // },
          ),
        ),
      ],
    );
  }

  CustomElevatedButton _customButtonWidget(BuildContext context) {
    return CustomElevatedButton(
      bgColor: AppColors.red,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
      text: const Text(
        'Авторизация',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => OtpView(phoneNumber: ''),
        //   ),
        // );
        if (formKey.currentState!.validate()) {
          if (isPhone('+996${textController.text}')) {
            log('phone');
            BlocProvider.of<AuthBloc>(context).add(
              SignInWithPhoneNumberEvent(
                '+996${textController.text}',
                context,
              ),
            );
            BlocProvider.of<TimerCubit>(context).startTimer();
          } else if (isEmail(textController.text)) {
            log('eMail');
            BlocProvider.of<AuthBloc>(context).add(
              SignInWithEmailEvent(
                textController.text,
                passwordController.text,
              ),
            );
          }
        }
      },
    );
  }
}
