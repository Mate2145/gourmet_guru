import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/firebase/auth/auth.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final loginkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final pw = TextEditingController();
  void login(String email, String pw) {
    AuthenticationFb.instance.loginUser(email, pw);
  }
}
