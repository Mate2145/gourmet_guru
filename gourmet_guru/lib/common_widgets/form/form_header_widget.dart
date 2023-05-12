import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/texts.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {Key? key,
      this.imagecolor,
      required this.image,
      required this.title,
      required this.subtitle,
      this.imageHeight = 0.2,
      this.heightBetween,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  final String image, title, subtitle;
  final Color? imagecolor;
  final double imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * imageHeight,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
