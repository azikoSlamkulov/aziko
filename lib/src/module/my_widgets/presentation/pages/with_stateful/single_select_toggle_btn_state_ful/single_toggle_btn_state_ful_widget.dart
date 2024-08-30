import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/util/app_constants/colors/app_colors.dart';

class SingleSelectToggleBtnWithStateFulWidget extends StatefulWidget {
  const SingleSelectToggleBtnWithStateFulWidget({
    required this.buttonList,
    required this.selectedBtnCallback,
    required this.isGridView,
    this.crossAxisCount = 3,
    this.bgColor = AppColors.bgColorMain,
    this.containerHeight = 88,
    this.sizedBoxHeight = 40,
    this.sizedBoxWidth = 40,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 10.0,
    Key? key,
  }) : super(key: key);

  final List<String> buttonList;
  final ValueSetter<String> selectedBtnCallback;
  final bool isGridView;
  final int crossAxisCount;
  final Color bgColor;
  final double containerHeight;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double paddingHorizontal;
  final double paddingVertical;

  @override
  State<SingleSelectToggleBtnWithStateFulWidget> createState() =>
      _SingleSelectToggleBtnWithStateFulWidgetState();
}

class _SingleSelectToggleBtnWithStateFulWidgetState
    extends State<SingleSelectToggleBtnWithStateFulWidget> {
  final List<bool> isSelectedList = [];
  String selectedButtonName = '';

  @override
  Widget build(BuildContext context) {
    return !widget.isGridView
        ? Container(
            height: widget.containerHeight.h,
            color: widget.bgColor,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: REdgeInsets.all(14),
              itemCount: widget.buttonList.length,
              itemBuilder: (context, index) {
                final button = widget.buttonList[index];
                isSelectedList.add(false);
                return singleToggleButton(index, button);
              },
              separatorBuilder: (context, index) => SizedBox(width: 18.h),
            ),
          )
        : Container(
            height: widget.containerHeight.h,
            color: widget.bgColor,
            child: GridView.builder(
              padding: REdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 17.h,
                mainAxisExtent: 60.h,
                crossAxisCount: widget.crossAxisCount,
              ),
              itemCount: widget.buttonList.length,
              itemBuilder: (context, index) {
                final button = widget.buttonList[index];
                isSelectedList.add(false);
                return singleToggleButton(index, button);
              },
            ),
          );
  }

  Padding singleToggleButton(int buttonIndex, String buttonName) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: widget.paddingVertical.h),
      child: SizedBox(
        height: widget.sizedBoxHeight.h,
        width: widget.sizedBoxWidth.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: REdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: isSelectedList[buttonIndex]
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFF9B9B9B)),
            ),
            backgroundColor: isSelectedList[buttonIndex]
                ? AppColors.mainColor
                : Colors.white,
          ),
          onPressed: () {
            for (int index = 0; index < isSelectedList.length; index++) {
              if (index == buttonIndex) {
                setState(() {
                  isSelectedList[index] = true;
                  widget.selectedBtnCallback(buttonName);
                });
              } else {
                setState(() => isSelectedList[index] = false);
              }
            }
          },
          child: Text(
            buttonName,
            style: TextStyle(
              color: isSelectedList[buttonIndex] ? Colors.white : Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
