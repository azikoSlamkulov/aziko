import 'package:aziko/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/util/app_constants/colors/app_colors.dart';
import 'multi_toggle_btn_state_ful_widget.dart';

class MultiToggleBtnWithStateFulPage extends StatefulWidget {
  const MultiToggleBtnWithStateFulPage({super.key});

  @override
  State<MultiToggleBtnWithStateFulPage> createState() =>
      _MultiToggleBtnWithStateFulPageState();
}

class _MultiToggleBtnWithStateFulPageState
    extends State<MultiToggleBtnWithStateFulPage> {
  final List<String> buttonList = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
    'Button 5'
  ];

  List<String> selectedBtnList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180.h,
            color: AppColors.bgColorMain,
            child: selectedBtnList.isNotEmpty
                ? Center(
                    child: ListView.builder(
                      //scrollDirection: Axis.horizontal,
                      padding: REdgeInsets.all(14),
                      itemCount: selectedBtnList.length,
                      itemBuilder: (context, index) {
                        final buttonName = selectedBtnList[index];
                        return Text(buttonName, style: AppTextStyles.black22);
                      },
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: Text(
                      'UnSelect',
                      style: AppTextStyles.grey16,
                    ),
                  ),
          ),
          100.verticalSpace,
          MultiSelectToggleBtnWithStateFulWidget(
            buttonList: buttonList,
            selectedBtnsCallback: (value) {
              selectedBtnList = value;
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
