import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/authentication/controllers/sign_up_controller.dart';
import 'package:gourmet_guru/features/authentication/models/user_model.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/texts.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final signupkey = GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: ggFormHeight - 10),
      child: Form(
          key: signupkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: InputDecoration(
                  label: Text("Full Name"),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              SizedBox(
                height: ggFormHeight - 10,
              ),
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                  label: Text(EmailLabelText),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: ggFormHeight - 10,
              ),
              TextFormField(
                controller: controller.password,
                decoration: InputDecoration(
                  label: Text(PasswordLabelText),
                  prefixIcon: Icon(Icons.fingerprint),
                ),
              ),
              SizedBox(
                height: ggFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (signupkey.currentState!.validate()) {
                        final user = UserModel(
                            email: controller.email.text.trim(),
                            fullName: controller.fullName.text.trim());
                        SignUpController.instance.registerUser(
                            user, controller.password.text.trim());
                      }
                    },
                    child: Text(SIGN_UP.toUpperCase())),
              ),
            ],
          )),
    );
  }
}
