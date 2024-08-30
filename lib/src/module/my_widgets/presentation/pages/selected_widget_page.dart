import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/util/app_constants/colors/app_colors.dart';

class SelectedWidgetPage extends StatelessWidget {
  SelectedWidgetPage({
    required this.contentWidgetWithStateFul,
    required this.contentWidgetWithBloc,
    required this.title,
    super.key,
  });

  final Widget contentWidgetWithStateFul;
  final Widget contentWidgetWithBloc;
  final String title;

  final items = ['StateFul', 'Bloc'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.bgColorMain,
          bottom: TabBar(
            //padding: REdgeInsets.symmetric(horizontal: 16),
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50), // Creates border
            //   color: Colors.black,
            // ),
            //unselectedLabelStyle: TextStyle(fontSize: 16.sp),
            //unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: items
                .map((e) => Tab(
                      text: e,
                      height: 35,
                    ))
                .toList(),
          ),
          title: Text(
            title,
            //style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: REdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              contentWidgetWithStateFul,
              contentWidgetWithBloc,
            ],
          ),
        ),
      ),
    );
  }
}
