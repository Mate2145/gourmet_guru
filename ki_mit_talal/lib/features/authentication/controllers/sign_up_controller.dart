import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/firebase/auth/auth.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Textfieldek kitoltesehez
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();

  //A regisztracio gomb megnyomasa altal
  void registerUser(String email, String password) {
    AuthenticationFb.instance.createUser(email, password);
  }
}
