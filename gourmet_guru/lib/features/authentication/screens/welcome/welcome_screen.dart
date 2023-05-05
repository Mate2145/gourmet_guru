import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/common_widgets/fade_in_animation/animation_model.dart';
import 'package:gourmet_guru/common_widgets/fade_in_animation/fade_in_controller.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/constants/image_strings.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/authentication/screens/login/login_screen.dart';
import 'package:gourmet_guru/features/authentication/screens/sign_up/sign_up_screen.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    var height = MediaQuery.of(context).size.height;
    controller.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          FadeInAnimation(
            durationInMs: 1000,
            animatePosition: GGAnimatePosition(
              bottomAfter: 0,
              bottomBefore: -100,
              leftAfter: 0,
              leftBefore: 0,
              topAfter: 0,
              topBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(ggWelcomeScreen),
                      height: height * 0.5,
                    ),
                    Column(
                      children: [
                        Text(
                          ggwelcomeTitle,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          ggwelcomeSubtitle,
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () =>
                                    Get.to(() => const LoginScreen()),
                                child: Text(LOGIN.toUpperCase()))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(() => const SignUpScreen()),
                              child: Text(SIGN_UP.toUpperCase())),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
