import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
    this.sizedBoxHeight = 48.0,
    this.sizedBoxWidth = double.infinity,
    this.borderRadius = 5.0,
    this.bgColor,
    this.textColor = Colors.black,
    this.isBorderSide = false,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double paddingHorizontal;
  final double paddingVertical;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double borderRadius;
  final Color? bgColor;
  final Color textColor;
  final bool isBorderSide;

  @override
  Widget build(BuildContext context) {
    ButtonStyle btnStyle = ElevatedButton.styleFrom(
      // padding: EdgeInsets.symmetric(
      //     horizontal: paddingHorizontal, vertical: paddingVertical),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: isBorderSide
            ? const BorderSide(color: Color(0xFF9B9B9B))
            : BorderSide.none,
      ),
      //primary: bgColor,
      // backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary,
      backgroundColor: bgColor ?? Theme.of(context).primaryColor,
      textStyle: TextStyle(color: Colors.white),
    );

    return Container(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      // padding: EdgeInsets.symmetric(
      //   horizontal: paddingHorizontal,
      //   vertical: paddingVertical,
      // ),
      child: ElevatedButton(
        style: btnStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? TextStyle(color: Colors.black, fontSize: 14.sp),
        ),
      ),
    );
  }
}
