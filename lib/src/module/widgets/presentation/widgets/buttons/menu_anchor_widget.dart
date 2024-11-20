import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class MenuAnchorWidget extends StatefulWidget {
  const MenuAnchorWidget({super.key});

  @override
  State<MenuAnchorWidget> createState() => _MenuAnchorWidgetState();
}

class _MenuAnchorWidgetState extends State<MenuAnchorWidget> {
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_horiz),
          tooltip: 'Show menu',
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        3,
        (int index) => MenuItemButton(
          onPressed: () =>
              setState(() => selectedMenu = SampleItem.values[index]),
          child: Text('Item ${index + 1}'),
        ),
      ),
    );
  }
}
