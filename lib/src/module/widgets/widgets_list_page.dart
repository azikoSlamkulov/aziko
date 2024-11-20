import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/presentation/widgets/widgets.dart';
import 'widgets_data.dart';

class WidgetsListPage extends StatelessWidget {
  const WidgetsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetsList = WidgetsData.widgetsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Page'),
        centerTitle: true,
        actions: const [CustomSwitchWidget()],
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          child: widgetsList.isNotEmpty
              ? ListView.builder(
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
                        title: Text(widget.widgetName),
                      ),
                    );
                  }),
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
