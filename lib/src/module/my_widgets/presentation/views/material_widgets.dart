import 'package:aziko/src/util/app_constants/spaces/spaces.dart';
import 'package:flutter/material.dart';

import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/dialogs/custom_snackbar.dart';

class MaterialWidgets extends StatelessWidget {
  const MaterialWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: AppBar(
        title: const Text('Material Widgets'),
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
                  text: const Text('Snack Bar'),
                  onPressed: () {
                    CustomSnackbar().getSnackbar(
                      context: context,
                      title: '',
                    );
                  },
                ),
                AppSized.h20,
                CustomElevatedButton(
                  text: const Text('Snack Bar'),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Yay! A SnackBar!'),
                      backgroundColor: AppColors.red,
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
