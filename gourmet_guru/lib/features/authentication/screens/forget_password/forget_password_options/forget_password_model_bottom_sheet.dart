import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/texts.dart';
import '../forget_password_mail/forget_password_mail.dart';
import 'forgot_password_selector_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowExtractBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(ggDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Make a selection!",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Oops forgot subtitle",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ForgotPasswordSelectorWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: EmailLabelText,
              subtitle: EmailLabelText,
              onTap: () {
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
