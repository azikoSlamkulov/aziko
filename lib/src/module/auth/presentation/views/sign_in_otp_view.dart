import 'dart:async';

import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:aziko/src/module/auth/presentation/logic/timer_cubit/timer_cubit.dart';
import 'package:aziko/src/module/auth/presentation/logic/timer_cubit/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../util/app_constants/assets/app_assets.dart';
import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';

class OtpView extends StatelessWidget {
  OtpView({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;
  final otpController = TextEditingController();
  final smsCodeformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AuthBloc, AuthState>(
    //   bloc: ,
    // );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 80,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppAssets.flutterLogo(width: 220, height: 180),
                  const SizedBox(height: 50),
                  const Text(
                    'Введите полученный смс код.',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _pinCodeTextField(context, smsCodeformKey),
                  const SizedBox(height: 40),
                  _customButtonWidget(context),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      //Navigator.pop(context);
                      BlocProvider.of<AuthBloc>(context).add(
                        CancelEvent(),
                      );
                    },
                    child: const Text(
                      'Отмена',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Если не получили код.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      BlocBuilder<TimerCubit, TimerState>(
                        builder: (context, state) {
                          if (state is RunTimerState) {
                            return TextButton(
                              onPressed: () {
                                // CustomSnackbar().getSnackbar(
                                //     context: context, title: 'Код отправлен');
                              },
                              child: const Text(
                                'Получить код',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black26,
                                ),
                              ),
                            );
                            // return Text('${state.time}',
                            //     style: const TextStyle(fontSize: 16));
                          } else if (state is FinishedTimerState) {
                            return TextButton(
                              onPressed: () {
                                // CustomSnackbar().getSnackbar(
                                //     context: context, title: 'Код отправлен');
                                BlocProvider.of<AuthBloc>(context).add(
                                  SignInWithPhoneNumberEvent(
                                    phoneNumber,
                                    context,
                                  ),
                                );
                                BlocProvider.of<TimerCubit>(context)
                                    .startTimer();
                              },
                              child: const Text(
                                'Получить код',
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     // CustomSnackbar().getSnackbar(
                      //     //     context: context, title: 'Код отправлен');

                      //     BlocProvider.of<TimerCubit>(context).startTimer();
                      //     //context.read<TimerCubit>().startTimer();
                      //   },
                      //   child: const Text(
                      //     'Получить код',
                      //     style: TextStyle(fontSize: 16),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _pinCodeTextField(
      BuildContext context, GlobalKey<FormState> smsCodeformKey) {
    return Form(
      key: smsCodeformKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            obscureText: true,
            obscuringCharacter: '*',
            obscuringWidget: const FlutterLogo(
              size: 24,
            ),
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            validator: (v) {
              if (v!.length < 6) {
                return "Заполните все поля";
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveColor: Colors.black26,
              inactiveFillColor: Colors.white,
            ),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            //errorAnimationController: errorController,
            controller: otpController,
            keyboardType: TextInputType.number,
            boxShadows: const [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 10,
              )
            ],

            onChanged: (code) {
              debugPrint(code);
              if (code.length == 6) {
                BlocProvider.of<AuthBloc>(context).add(
                  SendSmsCodeEvent(
                    otpController.text,
                  ),
                );
                FocusScope.of(context).requestFocus(FocusNode());
              }
              // setState(() {
              //   currentText = value;
              // });
            },
            beforeTextPaste: (text) {
              debugPrint("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          )),
    );
  }

  CustomElevatedButton _customButtonWidget(BuildContext context) {
    return CustomElevatedButton(
      text: const Text(
        'Авторизация',
        style: TextStyle(fontSize: 16),
      ),
      onPressed: () async {
        if (otpController.text.length == 6) {
          BlocProvider.of<AuthBloc>(context).add(
            SendSmsCodeEvent(
              otpController.text,
            ),
          );
        }
      },
      bgColor: AppColors.red,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
      // paddingHorizontal: MediaQuery.of(context).size.width * 0.29,
      // paddingVertical: 15,
    );
  }
}
