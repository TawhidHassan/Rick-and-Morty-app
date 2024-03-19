import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../core/config/Strings/strings.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        // selectedIndex:
        items:  [
          BottomNavigationBarItem(label: Strings.Home, icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: Strings.Cart, icon: Icon(Icons.shopping_cart)),
          // NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          // NavigationDestination(label: 'Image Generate', icon: Icon(Icons.image)),
        ],
        // destinations: const [
        //
        // ],
        onTap: _goBranch,
        // onDestinationSelected: ,

      ),
    );
  }
}
