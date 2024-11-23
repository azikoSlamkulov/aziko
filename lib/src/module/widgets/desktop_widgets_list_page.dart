import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/presentation/widgets/widgets.dart';
import 'widgets_data.dart';

class DesktopWidgetsListPage extends StatelessWidget {
  const DesktopWidgetsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetsList = WidgetsData.widgetsList;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Widgets Page'),
      //   centerTitle: true,
      //   actions: const [CustomSwitchWidget()],
      // ),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
        child: Center(
          child: widgetsList.isNotEmpty
              ? Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: widgetsList.length,
                        itemBuilder: ((context, index) {
                          final widget = widgetsList[index];
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => widget.root,
                                  ),
                                );
                              },
                              title: Text(
                                widget.widgetName,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    'Empty',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
        ),
      ),
    );
  }
}
