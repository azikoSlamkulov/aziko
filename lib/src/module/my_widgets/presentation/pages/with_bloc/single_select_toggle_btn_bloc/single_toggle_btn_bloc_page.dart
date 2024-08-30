import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/util/app_constants/text_styles/app_text_styles.dart';
import '../../../logic/single_toggle_btn/single_toggle_btn_cubit.dart';
import 'single_toggle_btn_bloc_widget.dart';

class SingleToggleBtnWithBlocPage extends StatelessWidget {
  SingleToggleBtnWithBlocPage({super.key});

  final List<String> buttonList = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
    'Button 5'
  ];

  @override
  Widget build(BuildContext context) {
    String selectedBtn = 'UnSelect';

    return BlocProvider(
      create: (context) => SingleToggleBtnCubit(),
      child: BlocBuilder<SingleToggleBtnCubit, SingleToggleBtnState>(
        builder: (context, state) {
          if (state is SingleToggleBtnSelectedState) {
            selectedBtn = state.selectedName;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedBtn,
                  style: AppTextStyles.black22,
                ),
                100.verticalSpace,
                SingleSelectToggleBtnWithBlocWidget(
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
