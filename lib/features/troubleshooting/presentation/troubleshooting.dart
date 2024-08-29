import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/widgets/main_bottom_nav_bar.dart';

class TroubleshootingPage extends StatelessWidget {
  const TroubleshootingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Troubleshooting')),
      body: const Center(child: Text('Troubleshooting Page')),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}