import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/constants/image_strings.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/authentication/controllers/on_boarding_controller.dart';
import 'package:gourmet_guru/features/authentication/models/model_on_boarding.dart';
import 'package:gourmet_guru/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:gourmet_guru/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              pages: obcontroller.pages,
              liquidController: obcontroller.controller,
              onPageChangeCallback: obcontroller.onPageChangedCallback,
              slideIconWidget: Icon(Icons.arrow_back_ios_rounded),
              enableSideReveal: true,
            ),
            Positioned(
              bottom: 50.0,
              child: OutlinedButton(
                onPressed: () => obcontroller.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                  onPrimary: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: ggDark, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: TextButton(
                onPressed: () => Get.to(() => const WelcomeScreen()),
                child: const Text("Skip", style: TextStyle(color: Colors.grey)),
              ),
            ),
            Obx(
              () => Positioned(
                  bottom: 10,
                  child: AnimatedSmoothIndicator(
                      activeIndex: obcontroller.currentPage.value,
                      effect: const WormEffect(
                        activeDotColor: Colors.black,
                        dotHeight: 5,
                      ),
                      count: 3)),
            )
          ],
        ),
      ),
    );
  }
}
