import 'package:aziko/src/module/home/presentation/pages/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/widgets/widgets.dart';
import '../../../widgets/presentation/widgets/widgets.dart';
import '../../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaymentMethodsPage();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home Page'),
    //     centerTitle: true,
    //     actions: const [CustomSwitchWidget()],
    //   ),
    //   // appBar: const AnimatedSearchAppBar(),
    //   // body: Center(child: AweseomSnackBarContentPackage()),
    //   body: Padding(
    //     padding: REdgeInsets.all(16.0),
    //     child: Center(
    //         //child: Text('Home Page'),
    //         child: Column(
    //       children: [
    //         // ElevatedButtonWidget(
    //         //   onPressed: () {},
    //         //   text: 'Button',
    //         // ),
    //         // 20.verticalSpace,
    //         // const Card(
    //         //   child: ListTile(
    //         //     title: Text('ListTile'),
    //         //   ),
    //         // ),
    //       ],
    //     )),
    //   ),
    // );
  }
}
