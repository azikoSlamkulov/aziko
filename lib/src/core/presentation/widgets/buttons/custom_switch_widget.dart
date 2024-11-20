import 'package:aziko/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key});

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  static bool light = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 40),
      child: SizedBox(
        height: 32.h,
        width: 40.h,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
            value: light,
            activeColor: Colors.blue,
            onChanged: (bool value) {
              BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(value));
              setState(() {
                light = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
