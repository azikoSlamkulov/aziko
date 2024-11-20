import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../payment_method.dart';

class CardNumberTextFormField extends StatefulWidget {
  const CardNumberTextFormField({
    required this.controller,
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
  State<CardNumberTextFormField> createState() =>
      _CardNumberTextFormFieldState();
}

class _CardNumberTextFormFieldState extends State<CardNumberTextFormField> {
  static PaymentCardEntity paymentCard = PaymentCardEntity();

  @override
  void initState() {
    super.initState();
    paymentCard.type = CardType.others;
    widget.controller!.addListener(_getCardTypeFrmNumber);
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the Widget is removed from the Widget tree
  //   widget.controller!.removeListener(_getCardTypeFrmNumber);
  //   widget.controller!.dispose();
  //   super.dispose();
  // }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(widget.controller!.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      paymentCard.type = cardType;
    });
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputStyle = InputDecoration(
      //icon: icon,
      //focusColor: AppColors.red,
      labelText: widget.labelText,
      //labelStyle: labelStyle ?? const TextStyle(color: Colors.black26),
      //hintText: hintText!,
      //hintStyle: TextStyle(color: AppColors.black26),
      // hintStyle: AppTextStyles.mulishBlack14w600.copyWith(
      //   color: AppColors.black.withOpacity(0.5),
      // ),
      counterText: widget.counterText,
      prefixText: widget.prefixText,
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
      suffix: widget.suffix,
      suffixIcon: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        child: CardUtils.getCardIcon(paymentCard.type),
      ),
      //fillColor: fillColor ?? Colors.white,
      filled: true,
      // border: border ??
      //     OutlineInputBorder(
      //       borderSide: BorderSide(
      //         width: 0.0,
      //         style: BorderStyle.none,
      //       ),
      //     ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: enabledBorderColor ?? Colors.black26,
      //     width: 0.5,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      // border: OutlineInputBorder(
      //   borderSide: const BorderSide(
      //     color: Colors.red,
      //     width: 2.0,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      // focusedBorder: const OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Color.fromARGB(255, 13, 116, 196),
      //     //color: Color.fromARGB(255, 20, 126, 24),
      //     width: 1.0,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      // errorBorder: const OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Colors.red,
      //     width: 1.0,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      //contentPadding: REdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
      //contentPadding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // errorStyle: AppTextStyles.mulishMainColor16w600,
    );

    return SizedBox(
      height: widget.sizedBoxHeight,
      width: widget.sizedBoxWidth,
      child: TextFormField(
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(16),
          CardNumberInputFormatter()
        ],
        controller: widget.controller!,
        //style: AppTextStyles.mulishBlack16w600,
        //style: TextStyle(color: AppColors.white),
        style: const TextStyle(color: Colors.black),
        decoration: inputStyle,
        // validator: widget.validator ??
        //     (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Поле не должно быть пустым!';
        //       }
        //       return null;
        //     },
        validator: CardUtils.validateCardNum,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        //autofocus: autofocus!,
      ),
    );
  }
}
