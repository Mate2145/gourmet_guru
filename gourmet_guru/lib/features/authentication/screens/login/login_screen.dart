import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:gourmet_guru/common_widgets/form/form_header_widget.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/constants/image_strings.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/authentication/screens/login/login_screen_widget.dart';
import 'login_footer_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormHeaderWidget(
                  image: GGSplashLogoDark,
                  title: ggLoginTitle,
                  subtitle: ggLoginSubtitle,
                ),
                const LoginForm(),
                const LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
