// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatelessWidget {
//   String hintText;
//   bool autofocus;
//   TextEditingController textEditingController;
//   TextInputType keyboardType;
//   Function onChanged;

//   CustomTextFormField({
//     @required this.hintText,
//     @required this.autofocus,
//     @required this.textEditingController,
//     this.keyboardType,
//     this.onChanged,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: onChanged,
//       //autocorrect: true,
//       keyboardType: keyboardType,
//       controller: textEditingController,
//       autofocus: autofocus,
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(),
//         hintText: hintText,
//       ),
//     );
//   }
// }
