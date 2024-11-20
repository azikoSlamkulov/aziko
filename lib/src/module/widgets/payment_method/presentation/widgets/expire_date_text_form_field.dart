import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../payment_method.dart';

class ExpireDateTextFormField extends StatelessWidget {
  const ExpireDateTextFormField({
    required this.controller,
    required this.paymentCard,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.counterText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.fillColor,
    this.enabledBorderColor,
    //this.border,
    this.autofocus,
    this.sizedBoxHeight,
    this.sizedBoxWidth,
    this.maxLines,
    this.enabled = true,
    this.icon,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final PaymentCardEntity? paymentCard;
  final String? counterText;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? enabledBorderColor;
  //final InputBorder? border;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final double? sizedBoxHeight;
  final double? sizedBoxWidth;
  final int? maxLines;
  final bool enabled;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputStyle = InputDecoration(
      labelText: labelText,
      hintText: 'MM/YY',
      filled: true,
    );

    return SizedBox(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      child: TextFormField(
        enabled: enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
          CardMonthInputFormatter()
        ],
        //controller: controller!,
        //style: AppTextStyles.mulishBlack16w600,
        //style: TextStyle(color: AppColors.white),
        style: const TextStyle(color: Colors.black),
        decoration: inputStyle,
        validator: CardUtils.validateDate,
        // onSaved: (value) {
        //   List<int> expiryDate = CardUtils.getExpiryDate(value!);
        //   paymentCard!.month = expiryDate[0];
        //   paymentCard!.year = expiryDate[1];
        // },
        //autofocus: autofocus!,
      ),
    );
  }
}
