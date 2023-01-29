import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_mit_talal/common_widgets/form/form_header_widget.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/image_strings.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';

import 'sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(ggDefaultSize),
              child: Column(
                children: [
                  const FormHeaderWidget(image: GGSplashLogoDark, title: ggLoginTitle, subtitle: ggLoginSubtitle),
                  const SignUpFormWidget(),
                  Column(
                    children: [
                      const Text(OR),
                      const SizedBox(height: ggFormHeight-10,),
                      SizedBox(width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: null,
                        icon: const Image(image: AssetImage(ggGoogleIcon),width: 20,),
                        label: Text(SIGNWITHGOOGLE.toUpperCase()),)
                        ,),
                      TextButton(
                        onPressed: null,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: ALREADYHAVEACCOUNT,
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                    text: LOGIN,
                                    style: TextStyle(color: ggPrimaryColor)
                                  ),
                                ]),
                            ]
                          ),
                        ))
                    ],
                  )
                ]),
            ), 
          ),
        ),
    );
  }
}

