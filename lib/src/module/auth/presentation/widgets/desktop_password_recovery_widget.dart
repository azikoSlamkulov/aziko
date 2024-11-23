import 'package:aziko/src/module/auth/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryWidget extends StatefulWidget {
  const PasswordRecoveryWidget({
    super.key,
    required this.onCanceled,
  });

  final Function onCanceled;

  @override
  State<PasswordRecoveryWidget> createState() => _PasswordRecoveryWidgetState();
}

class _PasswordRecoveryWidgetState extends State<PasswordRecoveryWidget> {
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
                      //   'Forgot password',
                      //   style: TextStyle(
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
                      // const SizedBox(height: 70),
                      const Text(
                        'Please, enter your email address. You will receive a link to create a new password via email.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 70),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          // hintStyle: TextStyle(fontSize: 18),
                          label: Text('Email'),
                          //labelStyle: TextStyle(fontSize: 18),
                          suffixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 64),
                      actionButton('SEND'),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          widget.onCanceled();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
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
