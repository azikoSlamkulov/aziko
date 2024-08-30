import 'package:aziko/src/module/my_widgets/presentation/pages/selected_widget_page.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';

class WidgetsListPage extends StatelessWidget {
  const WidgetsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetsList = Data.widgetsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widgetsList.length,
        itemBuilder: ((context, index) {
          final widget = widgetsList[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedWidgetPage(
                      contentWidgetWithStateFul: widget.stateFul!,
                      contentWidgetWithBloc: widget.bloc!,
                      title: widget.name!,
                    ),
                  ),
                );
              },
              title: Text(widget.name!),
            ),
          );
        }),
      ),
    );
  }
}
