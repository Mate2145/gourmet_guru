import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/authentication/screens/login/login_screen.dart';
import 'package:ki_mit_talal/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:ki_mit_talal/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ki_mit_talal/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:ki_mit_talal/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ki_mit_talal/features/core/maindisplay/maindisplay.dart';
import 'package:ki_mit_talal/features/core/screens/dashboard/dashboard.dart';
import 'package:ki_mit_talal/firebase/auth/auth.dart';
import 'package:ki_mit_talal/firebase_options.dart';
import 'package:ki_mit_talal/utils/theme/theme.dart';
import 'package:ki_mit_talal/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationFb()));
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
      home: MainDisplay(),
    );
  }
}
