import 'package:aziko/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'single_toggle_btn_state_ful_widget.dart';

class SingleToggleBtnWithStateFulPage extends StatefulWidget {
  const SingleToggleBtnWithStateFulPage({super.key});

  @override
  State<SingleToggleBtnWithStateFulPage> createState() =>
      _SingleToggleBtnWithStateFulPageState();
}

class _SingleToggleBtnWithStateFulPageState
    extends State<SingleToggleBtnWithStateFulPage> {
  final List<String> buttonList = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
    'Button 5'
  ];

  String selectedBtn = 'UnSelect';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedBtn,
            style: AppTextStyles.black22,
          ),
          100.verticalSpace,
          SingleSelectToggleBtnWithStateFulWidget(
            buttonList: buttonList,
            selectedBtnCallback: (value) {
              selectedBtn = value;
              setState(() {});
            },
            isGridView: true,
            containerHeight: 140,
            sizedBoxWidth: 122.h,
          ),
        ],
      ),
    );
  }
}
