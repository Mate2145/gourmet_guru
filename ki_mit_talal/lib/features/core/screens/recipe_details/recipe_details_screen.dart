import 'package:flutter/material.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/features/core/models/ingredients.dart';
import 'package:ki_mit_talal/features/core/models/recipe_detail.dart';
import 'package:ki_mit_talal/features/core/models/temperature.dart';
import 'package:ki_mit_talal/features/core/screens/recipe_details/recipe_details_appbar.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../../utils/storage.dart';
import '../../../../models/recipe.api.dart';
import '../../models/analyedinstructionlist.dart';
import '../../models/analyzedInstructions.dart';
import 'widgets/score_widget.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeDetailed recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          RecipeDetailAppBar(
            foodPicture: this.recipe.image,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    this.recipe.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 8.0),
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: ggDark),
                    child: Row(
                      children: [
                        Text(this.recipe.servings.toString() + " serving"),
                        const SizedBox(width: 8.0),
                        Container(
                          height: 5.0,
                          width: 5.0,
                          decoration: const BoxDecoration(
                            color: ggDark,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(this.recipe.readyInMinutes.toString() + " min"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 32.0,
                            width: 32.0,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ggPrimaryColor,
                            ),
                            child: Icon(Icons.favorite),
                          ),
                          Text(
                            this.recipe.aggregateLikes.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: ggSecondaryColor, height: 1.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Html(data: this.recipe.summary),
                  const SizedBox(height: 16.0),
                  Text(
                    'Scores',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  ScoreWidget(
                    weightWatcherSmartPoints: recipe.weightWatcherSmartPoints,
                    healthScore: recipe.healthScore,
                    spoonacularScore: recipe.spoonacularScore,
                    glutenFree: recipe.glutenFree,
                    ketogenic: recipe.ketogenic,
                    lowFodmap: recipe.lowFodmap,
                    sustainable: recipe.sustainable,
                    vegan: recipe.vegan,
                    vegetarian: recipe.vegetarian,
                    veryHealthy: recipe.veryHealthy,
                    veryPopular: recipe.veryPopular,
                    whole30: recipe.whole30,
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(color: ggPrimaryColor, height: 2.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: this
                        .recipe
                        .extendedIngredients
                        .map((e) => _buildIngredientItem(context, e))
                        .toList(),
                  ),
                  //const Divider(color: ggSecondaryColor, height: 1.0),
                  //const SizedBox(height: 16.0),
                  Text(
                    'Steps ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  //const SizedBox(height: 16.0),
                  ////////////////////////////
                  AnalyedInstructionWidget(recipe: recipe),
                  //////////////////////////////
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(
    BuildContext context,
    Ingredients ingredient,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            height: 24.0,
            width: 24.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE3FFF8),
            ),
            child: Icon(Icons.check_box),
          ),
          Text(
            ingredient.name +
                " " +
                ingredient.amount.ceil().toString() +
                " " +
                ingredient.unit,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class AnalyedInstructionWidget extends StatelessWidget {
  AnalyedInstructionWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final RecipeDetailed recipe;
  Map<int, AnalyzedInstructions> AnalyzedInstructionsMap = {};

  @override
  Widget build(BuildContext context) {
    if (MapStorage.isContainsID(recipe.id)) {
      final analyzedInstructions =
          MapStorage.getAnalyzedInstructions(recipe.id)!;
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: analyzedInstructions.instructions.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (analyzedInstructions.instructions[index].name != null &&
                  analyzedInstructions.instructions[index].name.isNotEmpty)
                Text(
                  analyzedInstructions.instructions[index].name,
                  style: Theme.of(context).textTheme.headline4,
                ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    analyzedInstructions.instructions[index].steps.length,
                itemBuilder: (context, stepindex) {
                  final step =
                      analyzedInstructions.instructions[index].steps[stepindex];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24.0,
                        width: 24.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ggDark,
                        ),
                        child: Text(
                          '${stepindex + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step.step,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            if (step.length != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Length: ' +
                                      step.length!.number.toString() +
                                      " " +
                                      step.length!.unit,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            if (step.ingredients != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Ingredients:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            for (final ingredient in step.ingredients ?? [])
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  '- ${ingredient.name}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ////////////////////////////////////
                            if (step.equipment != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Equipment:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            for (final equipment in step.equipment ?? [])
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  '- ${equipment.name}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            for (final equipment in step.equipment ?? [])
                              if (equipment.temperature != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    'Temperature: ' +
                                        equipment.temperature.number.ceil()
                                            .toString() + " " +
                                        equipment.temperature.unit,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      return FutureBuilder<AnalyzedInstructionsList>(
        future: RecipeAPI.getAnalyedInstructionsListbyID(recipe.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final analyzedInstructions =
                snapshot.data as AnalyzedInstructionsList;
            MapStorage.addAnalyzedInstructions(recipe.id, analyzedInstructions);
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: analyzedInstructions.instructions.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (analyzedInstructions.instructions[index].name != null &&
                        analyzedInstructions
                            .instructions[index].name.isNotEmpty)
                      Text(
                        analyzedInstructions.instructions[index].name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    const SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          analyzedInstructions.instructions[index].steps.length,
                      itemBuilder: (context, stepindex) {
                        final step = analyzedInstructions
                            .instructions[index].steps[stepindex];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 24.0,
                              width: 24.0,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 16.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ggDark,
                              ),
                              child: Text(
                                '${stepindex + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step.step,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  if (step.length != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'Length: ' +
                                            step.length!.number.toString() +
                                            " " +
                                            step.length!.unit,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  if (step.ingredients != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'Ingredients:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  for (final ingredient
                                      in step.ingredients ?? [])
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        '- ${ingredient.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ////////////////////////////////////
                                  if (step.equipment != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'Equipment:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  for (final equipment in step.equipment ?? [])
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        '- ${equipment.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  for (final equipment in step.equipment ?? [])
                                    if (equipment.temperature != null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          'Temperature: ' +
                                              equipment.temperature.number
                                                  .toString() + " " +
                                              equipment.temperature.unit,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                  const SizedBox(height: 30.0),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    }
  }
}
