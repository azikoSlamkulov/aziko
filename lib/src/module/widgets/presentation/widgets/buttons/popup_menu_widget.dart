import 'package:flutter/material.dart';

enum SampleItems { itemOne, itemTwo, itemThree }

class PopupMenuwidget extends StatefulWidget {
  const PopupMenuwidget({super.key});

  @override
  State<PopupMenuwidget> createState() => _PopupMenuwidgetState();
}

class _PopupMenuwidgetState extends State<PopupMenuwidget> {
  List<String> items = ['Itrm 1', 'Itrm 2', 'Itrm 3'];
  String selectedItem = '';

  void showSnackBar(SampleItems iem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 60,
          child: Center(child: Text(iem.name)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItems>(
      onSelected: (value) => showSnackBar(value),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<SampleItems>(
            value: SampleItems.itemOne,
            child: Text(SampleItems.itemOne.name),
          ),
          PopupMenuItem(
            value: SampleItems.itemTwo,
            child: Text(SampleItems.itemTwo.name),
          ),
        ];
      },
    );
  }
}
