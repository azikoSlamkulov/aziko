import 'package:aziko/src/module/home/presentation/pages/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class CheckoutTitleWidget extends StatelessWidget {
  const CheckoutTitleWidget({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.black16Bold,
    );
  }
}
