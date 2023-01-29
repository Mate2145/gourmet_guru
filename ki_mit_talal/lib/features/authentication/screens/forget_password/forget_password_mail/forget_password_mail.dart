import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_mit_talal/common_widgets/form/form_header_widget.dart';
import 'package:ki_mit_talal/constants/image_strings.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(ggDefaultSize),
        child: Column(
          children: const [
            SizedBox(height: ggDefaultSize * 4,),
            FormHeaderWidget(image: ggForgotPassword, title: ggForgotPasswordTitle, subtitle: ggForgotPasswordSubTitle),
          ],
        ),
      ),
    );
  }
}