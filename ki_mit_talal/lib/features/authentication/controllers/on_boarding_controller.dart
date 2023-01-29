import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/image_strings.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';
import '../screens/welcome/welcome_screen.dart';


class OnBoardingController extends GetxController{

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
              image: ggOnBoardingImage1,
              title: ggTitle1,
              subTitle: ggSubTitle1,
              counterText: ggCounter1,
              bgColor: ggWhite,)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: ggOnBoardingImage2,
              title: ggTitle2,
              subTitle: ggSubTitle2,
              counterText: ggCounter2,
              bgColor: ggWhite,)),
      OnBoardingPage(
          model: OnBoardingModel(
              image: ggOnBoardingImage5,
              title: ggTitle3,
              subTitle: ggSubTitle3,
              counterText: ggCounter3,
              bgColor: ggWhite,)),
    ];

    onPageChangedCallback(int activePageIndex) {
      currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() => controller.animateToPage(page: controller.currentPage + 1);


}