import 'package:aziko/src/module/home/pages/home_page.dart';
import 'package:aziko/src/module/test/pages/test_page.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_items.dart' as my_des;

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({
    required this.currentIndex,
    required this.page,
    super.key,
  });

  final int currentIndex;
  final Widget page;

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomePage(),
    const TestPage(),
  ];

  void onSelectTab(int index) {
    setState(() {
      _currentIndex = widget.currentIndex;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onSelectTab,
        items: my_des.myDestinations,
      ),
    );
  }
}
