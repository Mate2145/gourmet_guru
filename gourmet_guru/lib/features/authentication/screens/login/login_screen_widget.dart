import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/constants/sizes.dart';
import 'package:gourmet_guru/features/authentication/controllers/login_controller.dart';
import '../../../../constants/texts.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import '../forget_password/forget_password_options/forgot_password_selector_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginkey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: EmailLabelText,
                    hintText: EmailLabelText,
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.pw,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: PasswordLabelText,
                    hintText: PasswordLabelText,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowExtractBottomSheet(context);
                  },
                  child: Text(FORGOTTPASSWORD),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.loginkey.currentState!.validate()) {
                      LoginController.instance.login(
                          controller.email.text.trim(),
                          controller.pw.text.trim());
                    }
                  },
                  child: Text(LOGIN.toUpperCase()),
                ),
              ),
            ],
          ),
        ));
  }
}
