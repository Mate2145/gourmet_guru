import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:gourmet_guru/features/authentication/models/user_model.dart';
import 'package:gourmet_guru/firebase/auth/auth.dart';
import 'package:gourmet_guru/firebase/user_service.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  final userRepo = Get.put(UserService());

  Future<void> registerUser(UserModel model, String pw) async {
    await AuthenticationFb.instance.createUser(model.email.trim(), pw.trim());
    userRepo.createUser(model);
  }
}
