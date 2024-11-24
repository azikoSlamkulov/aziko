import 'package:aziko/src/module/auth/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../auth.dart';
import 'widgets.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    super.key,
    required this.onSignUpSelected,
    required this.onPasswordRecoverySelected,
    required this.onSocialSelected,
  });

  final Function onSignUpSelected;
  final Function onPasswordRecoverySelected;
  final Function onSocialSelected;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 200,
            ),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 420,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Text(
                      //   'Login',
                      //   style: TextStyle(
                      //     // fontSize: 18,
                      //     // color: Colors.grey[700],
                      //     color: Colors.black,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // const SizedBox(height: 8),
                      // const SizedBox(
                      //   width: 30,
                      //   child: Divider(
                      //     color: Colors.red,
                      //     thickness: 2,
                      //   ),
                      // ),
                      // const SizedBox(height: 45),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          // hintStyle: TextStyle(fontSize: 18),
                          label: Text('Email'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.email_outlined),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Colors.white,
                          //     width: 0.5,
                          //     style: BorderStyle.solid,
                          //   ),
                          // ),
                          // border: const OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     //color: Colors.white,
                          //     width: 0.5,
                          //     style: BorderStyle.solid,
                          //   ),
                          // ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          //hintStyle: TextStyle(fontSize: 18),
                          label: Text('Password'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.lock_clock_outlined),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          widget.onPasswordRecoverySelected();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            AppAssets.arrowRight(
                              width: 30,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 64),
                      actionButton('LOGIN', () {
                        BlocProvider.of<AuthBloc>(context).add(
                          const SignInWithEmailEvent('', ''),
                        );
                      }),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          widget.onSignUpSelected();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You do not have an account?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(width: 8),
                            // Icon(
                            //   Icons.arrow_forward,
                            //   color: Colors.red,
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      // GestureDetector(
                      //   onTap: () {
                      //     widget.onSocialSelected();
                      //   },
                      //   child: const Text(
                      //     'Or login with social account',
                      //     style: TextStyle(
                      //       color: Colors.blue,
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      // ),
                      const Text(
                        'Or login with social account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // WidgetBtnFacebook(onTap: () {}),
                          // AppSized.w20,
                          // WidgetBtnGoogle(
                          //   onTap: () => BlocProvider.of<AuthBloc>(context).add(
                          //     SignInWithGoogleEvent(),
                          //   ),
                          // ),
                          IconButton(
                            //iconSize: 50.h,
                            icon: AppAssets.facebookLogo(width: 30, height: 30),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 30),
                          IconButton(
                            //iconSize: 47.h,
                            icon: AppAssets.googleLogo(width: 27, height: 27),
                            onPressed: () {
                              // BlocProvider.of<AuthBloc>(context).add(
                              //   SignInWithGoogleEvent(),
                              // );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
