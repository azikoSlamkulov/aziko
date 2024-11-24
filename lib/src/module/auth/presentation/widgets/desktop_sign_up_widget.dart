import 'package:aziko/src/module/auth/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../auth.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
    required this.onSignInSelected,
  });

  final Function onSignInSelected;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
                      //   'Sign up',
                      //   style: TextStyle(
                      //     //color: Colors.grey[700],
                      //     color: Colors.black,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // const SizedBox(height: 8),
                      // const SizedBox(
                      //   width: 30,
                      //   child: const Divider(
                      //     color: Colors.red,
                      //     thickness: 2,
                      //   ),
                      // ),
                      // const SizedBox(height: 32),
                      TextFormField(
                        decoration: const InputDecoration(
                          //hintText: 'Name',
                          // hintStyle: TextStyle(fontSize: 18),
                          label: Text('Name'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.person_outlined),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: const InputDecoration(
                          //hintText: 'Email',
                          // hintStyle: TextStyle(fontSize: 18),
                          label: Text('Email'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: const InputDecoration(
                          //hintText: 'Password',
                          //hintStyle: TextStyle(fontSize: 18),
                          label: Text('Password'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.lock_clock_outlined),
                        ),
                      ),
                      const SizedBox(height: 64),
                      actionButton('SIGN UP', () {
                        // BlocProvider.of<AuthBloc>(context).add(
                        //   SignInWithGoogleEvent(),
                        // );
                      }),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          widget.onSignInSelected();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Or sign up with social account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
