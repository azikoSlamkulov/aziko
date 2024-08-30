import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/util/app_constants/colors/app_colors.dart';
import '../../../../../../config/util/app_constants/text_styles/app_text_styles.dart';
import '../../../logic/multiple_toggle_btn_cubit/multiple_toogle_btn_cubit.dart';
import 'multi_toggle_btn_bloc_widget.dart';

class MultiSelectToggleBtnWithBlocPage extends StatelessWidget {
  MultiSelectToggleBtnWithBlocPage({super.key});

  final List<String> buttonList = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
    'Button 5'
  ];

  @override
  Widget build(BuildContext context) {
    List<String> selectedBtnList = [];

    return BlocProvider(
      create: (context) => MultipleToogleBtnCubit(),
      child: BlocBuilder<MultipleToogleBtnCubit, MultipleToogleBtnState>(
        builder: (context, state) {
          if (state is MultipleSelectedState) {
            selectedBtnList = state.selectedBtnsList;
          }
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
                              return Text(buttonName,
                                  style: AppTextStyles.black22);
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
                // Text(
                //   selectedBtn,
                //   style: AppTextStyles.black22,
                // ),
                100.verticalSpace,
                MultiSelectToggleBtnWithBlocWidget(
                  buttonList: buttonList,
                  state: state,
                  containerHeight: 140,
                  sizedBoxWidth: 122.h,
                  isGridView: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
