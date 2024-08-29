import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../routes/app_router.gr.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,  // Ensures the items don't shift
      currentIndex: _calculateSelectedIndex(context),
      onTap: (int index) => _onItemTapped(index, context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 24),
          label: 'System',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt, size: 24),
          label: 'Recipe',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor, size: 24),
          label: 'Monitoring',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build, size: 24),
          label: 'Troubleshoot',
        ),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 24,  // Ensure consistent icon size
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = AutoRouterDelegate.of(context).urlState.path;
    if (location.startsWith('/system')) return 0;
    if (location.startsWith('/recipe')) return 1;
    if (location.startsWith('/monitoring')) return 2;
    if (location.startsWith('/troubleshooting')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.router.push(const SystemRoute());
        break;
      case 1:
        context.router.push(const RecipeRoute());
        break;
      case 2:
        context.router.push(const MonitoringRoute());
        break;
      case 3:
        context.router.push(const TroubleshootingRoute());
        break;
    }
  }
}
