import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        actions: const [CustomSwitchWidget()],
      ),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
