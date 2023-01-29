import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/authentication/screens/login/login_screen.dart';
import 'package:ki_mit_talal/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:ki_mit_talal/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ki_mit_talal/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:ki_mit_talal/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ki_mit_talal/utils/theme/theme.dart';
import 'package:ki_mit_talal/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GGTheme.lightTheme,
      darkTheme: GGTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 500),
      home: OnBoardingScreen(),
    );
  }

}