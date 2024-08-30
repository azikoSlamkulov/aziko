import 'package:flutter/material.dart';

class ShowDialog {
  static getDialog({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('В разработке!'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: const Text("Ok"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// ShowDialog.getShowDialog(
//   context: context,
//   title: 'Добавить водителя',
//   formKey: provider.formKey,
//   textFormFieldOne: CustomTextFormField(
//     hintText: 'Имя',
//     autofocus: true,
//     textEditingController: provider.driverNameTextController,
//   ),
//   function:  
// ),
