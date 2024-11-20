import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/widgets.dart';

class ButtonWidgetsPage extends StatefulWidget {
  const ButtonWidgetsPage({super.key});

  @override
  State<ButtonWidgetsPage> createState() => _ButtonWidgetsPageState();
}

class _ButtonWidgetsPageState extends State<ButtonWidgetsPage> {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 60,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button widgets'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            divader('Buttons'),
            Padding(
              padding: REdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButtonWidget(
                    onPressed: () => showSnackBar('Elevated Button'),
                    text: 'Elevated Button',
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlineButtonWidget(
                        onPressed: () => showSnackBar('Outlined Button'),
                        text: 'Outlined Button',
                      ),
                      TextButtonWidget(
                        onPressed: () => showSnackBar('Text Button'),
                        text: 'Text Button',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            divader('Toggle button'),
            Padding(
                padding:
                    REdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: const ToggleButtonWidget()),
            divader('Check box'),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Is checked'),
                  40.horizontalSpace,
                  const CheckBoxWidget(),
                ],
              ),
            ),
            divader('Popup menu & Menu Anchor'),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text('Popup menu'),
                  20.horizontalSpace,
                  const PopupMenuwidget(),
                  50.horizontalSpace,
                  const Text('Menu anchor'),
                  20.horizontalSpace,
                  const MenuAnchorWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  divader(String text) {
    return Container(
      color: Colors.blueGrey,
      height: 30.h,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
