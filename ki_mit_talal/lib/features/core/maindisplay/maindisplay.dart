import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/features/core/controllers/maindisplay_controller.dart';
import 'package:ki_mit_talal/features/core/screens/add_recipe/addRecipe.dart';
import 'package:ki_mit_talal/utils/theme/theme.dart';

import '../screens/calculator/calculator.dart';
import '../screens/dashboard/dashboard.dart';
import '../screens/navbar/navigationbar.dart';
import '../screens/profile/profile.dart';
import '../screens/search/search.dart';

class MainDisplay extends StatelessWidget {
  MainDisplayController mainDisplayController =
      Get.put(MainDisplayController());
  MainDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final screen = [DashBoard(), Search(), AddRecipe(), Profile()];

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: mainDisplayController.currentIndex.value,
            children: screen,
          )),
      bottomNavigationBar: Obx(() => 
          NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(txtTheme.bodyText1)),
          child: NavigationBar(
            height: 65,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 2),
            onDestinationSelected: (value) {
              mainDisplayController.changeIndex(value);
            },
            selectedIndex: mainDisplayController.currentIndex.value,
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.search_off_outlined),
                  selectedIcon: Icon(Icons.search),
                  label: "Search"),
              NavigationDestination(
                  icon: Icon(Icons.add),
                  selectedIcon: Icon(Icons.add_outlined),
                  label: "Add"),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
