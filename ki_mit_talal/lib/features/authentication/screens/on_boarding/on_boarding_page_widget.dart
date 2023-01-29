import 'package:flutter/material.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(20),
        color: model.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(model.image),
              height: size.height * 0.4,
            ),
            Column(
              children: [
                Text(
                  model.title,
                  style: TextStyle(fontSize: 25,color: ggDark,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  model.subTitle,
                  style: TextStyle(fontSize: 15,color: ggDark),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(model.counterText,
            style: TextStyle(fontSize: 16,color: ggDark),),
            SizedBox(height: 50.0)
          ],
        ));
  }
}