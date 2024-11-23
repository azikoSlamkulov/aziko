import 'package:aziko/src/module/auth/presentation/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/sign_in_widget.dart';

enum Option { signIn, signUp }

class DesktopAuthPage extends StatefulWidget {
  const DesktopAuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopAuthPage> createState() => _DesktopAuthPageState();
}

class _DesktopAuthPageState extends State<DesktopAuthPage> {
  Option selectedOption = Option.signIn;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Colors.red,
                ),
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Colors.white,
                )
              ],
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Kick Now !",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "It's easy and takes less than 30 seconds",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'HOME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (widget, animation) => ScaleTransition(
                scale: animation,
                child: widget,
              ),
              child: selectedOption == Option.signIn
                  ? SignInWidget(
                      onSignUpSelected: () {
                        setState(() {
                          selectedOption = Option.signUp;
                        });
                      },
                    )
                  : SignUpWidget(
                      onSignInSelected: () {
                        setState(() {
                          selectedOption = Option.signIn;
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
