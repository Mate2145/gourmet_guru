import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/common_widgets/fade_in_animation/animation_model.dart';
import 'package:ki_mit_talal/common_widgets/fade_in_animation/fade_in_controller.dart';
import 'package:ki_mit_talal/constants/image_strings.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation(
      {Key? key, required this.durationInMs,this.animatePosition, required this.child})
      : super(key: key);

  final int durationInMs;
  final fadeInController = Get.put(FadeInAnimationController());
  final GGAnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: fadeInController.animate.value
            ? animatePosition!.topAfter
            : animatePosition!.topBefore,
        left: fadeInController.animate.value
            ? animatePosition!.leftAfter
            : animatePosition!.leftBefore,
        bottom: fadeInController.animate.value
            ? animatePosition!.bottomAfter
            : animatePosition!.bottomBefore,
        right: fadeInController.animate.value
            ? animatePosition!.rightAfter
            : animatePosition!.rightBefore,
        child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: fadeInController.animate.value ? 1 : 0,
            child: child),
      ),
    );
  }
}
