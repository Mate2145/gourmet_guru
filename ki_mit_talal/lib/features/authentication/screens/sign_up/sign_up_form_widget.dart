import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/texts.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ggFormHeight-10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Full Name"),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            SizedBox(height: ggFormHeight - 10,),
            TextFormField(
              decoration: InputDecoration(
                label: Text(EmailLabelText),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: ggFormHeight - 10,),
            TextFormField(
              decoration: InputDecoration(
                label: Text(PasswordLabelText),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            SizedBox(height: ggFormHeight - 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                child: Text(SIGN_UP.toUpperCase())),
            ),
          ],
        )),
    );
  }
}