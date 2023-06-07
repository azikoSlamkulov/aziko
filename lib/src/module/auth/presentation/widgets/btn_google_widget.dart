import 'package:flutter/material.dart';

import '../../../../util/app_constants/assets/app_assets.dart';

class WidgetBtnGoogle extends StatelessWidget {
  final VoidCallback? onTap;

  const WidgetBtnGoogle({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffFFF1F0),
              border: Border.all(
                width: 0.5,
                color: Color.fromARGB(255, 240, 129, 121),
              ),
              shape: BoxShape.rectangle),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AppAssets.googleLogo(
                  width: 24,
                  height: 24,
                ),
              ),
              Text(
                'Google',
                //style: FONT_CONST.REGULAR_GRAY4_12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
