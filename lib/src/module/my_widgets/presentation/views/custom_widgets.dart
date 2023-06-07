import 'package:aziko/src/util/app_constants/spaces/spaces.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';

class CustomWidgets extends StatelessWidget {
  const CustomWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: AppBar(
        title: const Text('Custom Widgets'),
        centerTitle: true,
      ),
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
                CustomElevatedButton(
                  text: const Text('Snack Bar (success)'),
                  onPressed: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message:
                            "Good job, your release is successful. Have a nice day",
                      ),
                      animationDuration: const Duration(seconds: 3),
                      reverseAnimationDuration: const Duration(seconds: 1),
                    );
                  },
                ),
                AppSized.h20,
                CustomElevatedButton(
                  text: const Text('Snack Bar (info)'),
                  onPressed: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.info(
                        message:
                            "There is some information. You need to do something with that",
                      ),
                      animationDuration: const Duration(seconds: 3),
                      reverseAnimationDuration: const Duration(seconds: 1),
                    );
                  },
                ),
                AppSized.h20,
                CustomElevatedButton(
                  text: const Text('Snack Bar (error)'),
                  onPressed: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                        message:
                            "Something went wrong. Please check your credentials and try again",
                      ),
                      animationDuration: const Duration(seconds: 3),
                      reverseAnimationDuration: const Duration(seconds: 1),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
