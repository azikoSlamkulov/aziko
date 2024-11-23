import 'package:aziko/src/module/auth/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    super.key,
    required this.onSignUpSelected,
  });

  final Function onSignUpSelected;

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
                      Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 30,
                        child: Divider(
                          color: Colors.red,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
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
                      SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          //hintStyle: TextStyle(fontSize: 18),
                          label: Text('Password'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.lock_clock_outlined),
                        ),
                      ),
                      SizedBox(height: 64),
                      actionButton('Sign In'),
                      SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          widget.onSignUpSelected();
                        },
                        child: Row(
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
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      )
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
