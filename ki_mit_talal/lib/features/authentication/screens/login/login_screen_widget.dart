import 'package:flutter/material.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import '../../../../constants/texts.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import '../forget_password/forget_password_options/forgot_password_selector_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
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
              onPressed: () {},
              child: Text(LOGIN.toUpperCase()),
            ),
          ),
        ],
      ),
    ));
  }
}
