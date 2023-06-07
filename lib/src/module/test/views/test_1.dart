import 'dart:developer';

import 'package:aziko/src/module/test/widgets/drawer.dart';
import 'package:aziko/src/util/app_constants/colors/app_colors.dart';
import 'package:aziko/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:aziko/src/util/app_widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/test_bloc.dart';
import '../bloc/test_event.dart';
import '../bloc/test_state.dart';

// class SignInPage extends StatelessWidget {
//   const SignInPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TestBloc(),
//       child: SignInScreen(),
//     );
//   }
// }

class Test1View extends StatelessWidget {
  Test1View({Key? key}) : super(key: key);

  final TextEditingController contr1000 = TextEditingController();
  final TextEditingController contr500 = TextEditingController();
  final TextEditingController contr200 = TextEditingController();
  final TextEditingController contr100 = TextEditingController();
  final TextEditingController contr50 = TextEditingController();
  final TextEditingController contr20 = TextEditingController();
  final userProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int? sum;
    return Scaffold(
      backgroundColor: AppColors.bgColorBlue,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Test_1 View'),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/Test2View');
            },
            child: const Text('Go to test 2'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<TestBloc, TestState>(
                  builder: (context, state) {
                    if (state is SumState) {
                      sum = state.sum;
                    }
                    return SizedBox(
                      child: Text(
                        '$sum',
                        style: const TextStyle(
                          fontSize: 22,
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                    controller: contr1000, labelText: '1000 сом'),
                const SizedBox(height: 20),
                CustomTextFormField(controller: contr500, labelText: '500 сом'),
                const SizedBox(height: 20),
                CustomTextFormField(controller: contr200, labelText: '200 сом'),
                const SizedBox(height: 20),
                CustomTextFormField(controller: contr100, labelText: '100 сом'),
                const SizedBox(height: 20),
                CustomTextFormField(controller: contr50, labelText: '50 сом'),
                const SizedBox(height: 20),
                CustomTextFormField(controller: contr20, labelText: '20 сом'),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  onPressed: () {
                    BlocProvider.of<TestBloc>(context).add(
                      SumEvent(
                        oneThousand: contr1000.text,
                        fiveHundred: contr500.text,
                        twoHundred: contr200.text,
                        oneHundred: contr100.text,
                        fifty: contr50.text,
                        twenty: contr20.text,
                      ),
                    );
                  },
                  text: const Text('Ok'),
                  bgColor: AppColors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
