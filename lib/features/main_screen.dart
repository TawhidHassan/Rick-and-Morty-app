import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/config/color/custom_color.dart';

import '../core/config/Strings/strings.dart';
import '../core/custom_assets/assets.gen.dart';
import '../core/routes/route_path.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index,BuildContext context) {
    if(index==1){
      context.goNamed(Routes.CastPage,extra: false);
    }else{
      navigationShell.goBranch(
        index,
        // A common pattern when using bottom navigation bars is to support
        // navigating to the initial location when tapping the item that is
        // already active. This example demonstrates how to support this behavior,
        // using the initialLocation parameter of goBranch.
        initialLocation: index == navigationShell.currentIndex,
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColor.primaryDarkColor,
        currentIndex: navigationShell.currentIndex,
        unselectedLabelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        unselectedItemColor: Colors.white,
        selectedItemColor: CustomColor.kPrimaryColorx,
        // selectedIndex:
        items:  [
          BottomNavigationBarItem(
            label: Strings.Home,
            icon: Assets.icons.home.svg(),
            activeIcon: Assets.icons.home.svg(color: CustomColor.kPrimaryColorx),
          ),
          BottomNavigationBarItem(
            label: Strings.Cast,
            icon: Assets.icons.cast.svg(),
            activeIcon: Assets.icons.cast.svg(color: CustomColor.kPrimaryColorx),
          ),
          BottomNavigationBarItem(
            label: Strings.Episodes,
            icon: Assets.icons.episode.svg(),
            activeIcon: Assets.icons.episode.svg(color: CustomColor.kPrimaryColorx),
          ),BottomNavigationBarItem(
            label: Strings.Locations,
            icon: Assets.icons.location.svg(),
            activeIcon: Assets.icons.location.svg(color: CustomColor.kPrimaryColorx),
          ),
          // NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          // NavigationDestination(label: 'Image Generate', icon: Icon(Icons.image)),
        ],
        // destinations: const [
        //
        // ],
        onTap:(index)=> _goBranch(index,context),
        // onDestinationSelected: ,

      ),
    );
  }
}
