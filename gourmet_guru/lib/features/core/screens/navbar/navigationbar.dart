import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet_guru/features/core/screens/calculator/calculator.dart';
import 'package:gourmet_guru/features/core/screens/dashboard/dashboard.dart';
import 'package:gourmet_guru/features/core/screens/profile/profile.dart';
import 'package:gourmet_guru/features/core/screens/search/search.dart';

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(txtTheme.bodyText1)),
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: Duration(seconds: 2),
        selectedIndex: 0,
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_max_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.search_off_outlined),
              selectedIcon: Icon(Icons.search),
              label: "Search"),
          NavigationDestination(
              icon: Icon(Icons.restaurant_outlined),
              selectedIcon: Icon(Icons.restaurant),
              label: "Calculator"),
          NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: "Profile"),
        ],
      ),
    );
  }
}
