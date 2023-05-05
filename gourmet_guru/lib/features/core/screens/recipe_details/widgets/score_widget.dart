import 'package:flutter/material.dart';
import 'package:gourmet_guru/features/core/screens/recipe_details/widgets/score_circle.dart';

class ScoreWidget extends StatelessWidget {
  final int? weightWatcherSmartPoints;
  final num? healthScore;
  final num? spoonacularScore;
  final bool? glutenFree;
  final bool? ketogenic;
  final bool? lowFodmap;
  final bool? sustainable;
  final bool? vegan;
  final bool? vegetarian;
  final bool? veryHealthy;
  final bool? veryPopular;
  final bool? whole30;

  const ScoreWidget({
    Key? key,
    required this.weightWatcherSmartPoints,
    required this.healthScore,
    required this.spoonacularScore,
    required this.glutenFree,
    required this.ketogenic,
    required this.lowFodmap,
    required this.sustainable,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    required this.whole30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (this.weightWatcherSmartPoints != null)
              ScoreCircle(
                label: 'WWSP',
                value: weightWatcherSmartPoints.toString(),
                color: Colors.blue,
              ),
            const SizedBox(width: 20),
            if (this.healthScore != null && veryHealthy != null)
              ScoreCircle(
                label: 'HEALTH',
                value: healthScore!.toStringAsFixed(0),
                color: veryHealthy! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
            if (this.spoonacularScore != null && this.veryPopular != null)
              ScoreCircle(
                label: 'SPOON',
                value: spoonacularScore!.toStringAsFixed(0),
                color: veryPopular! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (glutenFree != null)
              ScoreCircle(
                label: 'GLUTEN-FREE',
                value: "",
                color: glutenFree! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
            if (ketogenic != null)
              ScoreCircle(
                label: 'KETO',
                value: "",
                color: ketogenic! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
            if (lowFodmap != null)
              ScoreCircle(
                label: 'LOW FODMAP',
                value: "",
                color: lowFodmap! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            if (vegan != null)
              ScoreCircle(
                label: 'VEGAN',
                value: "",
                color: vegan! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
            if (vegetarian != null)
              ScoreCircle(
                label: 'VEGETARIAN',
                value: "",
                color: vegetarian! ? Colors.green : Colors.red,
              ),
            const SizedBox(width: 20),
            if (whole30 != null)
              ScoreCircle(
                label: 'WHOLE30',
                value: "",
                color: whole30! ? Colors.green : Colors.red,
              ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
