import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/widgets/main_bottom_nav_bar.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation')),
      body: const Center(child: Text('Reservation Page')),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}