import 'package:flutter/material.dart';

const List<Widget> fruits = <Widget>[
  Text('Apple'),
  Text('Banana'),
  Text('Orange')
];

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots')
];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  final List<bool> _selectedFruits = <bool>[true, false, false];
  final List<bool> _selectedVegetables = <bool>[false, true, false];
  final List<bool> _selectedWeather = <bool>[false, false, true];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ToggleButtons with a single selection.
            const Text(
              'Single-select',
              // style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
            ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedFruits.length; i++) {
                    _selectedFruits[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              selectedBorderColor: Colors.red,
              selectedColor: Colors.white,
              fillColor: Colors.red,
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedFruits,
              children: fruits,
            ),
            const SizedBox(height: 20),
            // ToggleButtons with a multiple selection.
            Text(
              'Multi-select',
              //style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
            ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                // All buttons are selectable.
                setState(() {
                  _selectedVegetables[index] = !_selectedVegetables[index];
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              selectedBorderColor: Colors.red,
              selectedColor: Colors.white,
              fillColor: Colors.red,
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedVegetables,
              children: vegetables,
            ),
            const SizedBox(height: 20),
            // ToggleButtons with icons only.
            Text(
              'Icon-only',
              //style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
            ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedWeather.length; i++) {
                    _selectedWeather[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              selectedBorderColor: Colors.red,
              selectedColor: Colors.white,
              fillColor: Colors.red,
              color: Colors.black,
              isSelected: _selectedWeather,
              children: icons,
            ),
          ],
        ),
      ),
    );
  }
}
