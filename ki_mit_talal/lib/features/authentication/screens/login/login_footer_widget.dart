import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/texts.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(OR),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
              image: AssetImage(ggGoogleIcon),
              width: 20,
            ),
            onPressed: () {},
            label: Text(SIGNWITHGOOGLE),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: ALREADYHAVEACCOUNT,
              style: Theme.of(context).textTheme.bodyText1,
              children: const [
                TextSpan(text: SIGN_UP,
                style: TextStyle(color: ggPrimaryColor),
                )
              ] 
            ),
          ),
          )
      ],
    );
  }
}