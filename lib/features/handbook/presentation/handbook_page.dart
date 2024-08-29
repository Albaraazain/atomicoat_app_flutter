import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/widgets/main_bottom_nav_bar.dart';

class HandbookPage extends StatelessWidget {
  const HandbookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Handbook')),
      body: const Center(child: Text('Handbook Page')),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}