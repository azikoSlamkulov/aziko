import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/widgets.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Page'),
        centerTitle: true,
        actions: const [CustomSwitchWidget()],
      ),
      body: const Center(
        child: Text('Favorites Page'),
      ),
    );
  }
}
