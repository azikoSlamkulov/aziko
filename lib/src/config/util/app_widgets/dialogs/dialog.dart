import 'package:flutter/material.dart';

class MyDialog {
  static getDialog({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String title,
    required VoidCallback onPressed,
    bool isError = false,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Stack(
            //overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -10.0,
                top: -10.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(title),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: textFormFieldOne ?? null,
                          // ),
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
              ),
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
