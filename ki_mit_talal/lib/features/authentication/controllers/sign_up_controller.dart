import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ki_mit_talal/features/authentication/models/user_model.dart';
import 'package:ki_mit_talal/firebase/auth/auth.dart';
import 'package:ki_mit_talal/firebase/user_service.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Textfieldek kitoltesehez
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();

  final userRepo = Get.put(UserService());
  //A regisztracio gomb megnyomasa altal
  Future<void> registerUser(UserModel model,String pw)
   async {

    await AuthenticationFb.instance.createUser(model.email.trim(),pw.trim());
    userRepo.createUser(model);

  }


}
