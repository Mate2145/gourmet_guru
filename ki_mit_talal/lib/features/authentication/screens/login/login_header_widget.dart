import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/texts.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(GGSplashLogoDark),
          height: size.height * 0.2,
        ),
        Text(
          ggLoginTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          ggLoginSubtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}