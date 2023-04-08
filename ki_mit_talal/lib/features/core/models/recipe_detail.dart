import 'package:flutter/foundation.dart';
import 'package:ki_mit_talal/features/core/models/ingredients.dart';

class RecipeDetailed {
  final int id;
  final String title;
  final String image;
  final String imageType;
  final String summary;
  final int servings;
  final int readyInMinutes;
  final int aggregateLikes;
  final num healthScore;
  final num spoonacularScore;
  final num pricePerServing;
  final String instructions;
  final bool glutenFree;
  final bool ketogenic;
  final bool lowFodmap;
  final bool sustainable;
  final bool vegan;
  final bool vegetarian;
  final bool veryHealthy;
  final bool veryPopular;
  final bool whole30;
  final List<dynamic> analyzedInstructions;
  final int weightWatcherSmartPoints;
  final List<dynamic> dishTypes;
  final List<Ingredients> extendedIngredients;

RecipeDetailed({
  required this.id,
  required this.title,
  required this.summary,
  required this.image,
  required this.instructions,
  required this.imageType,
  required this.servings,
  required this.readyInMinutes,
  required this.aggregateLikes,
  required this.healthScore,
  required this.spoonacularScore,
  required this.pricePerServing,
  required this.glutenFree,
  required this.ketogenic,
  required this.lowFodmap,
  required this.sustainable,
  required this.vegan,
  required this.vegetarian,
  required this.veryHealthy,
  required this.veryPopular,
  required this.whole30,
  required this.analyzedInstructions,
  required this.weightWatcherSmartPoints,
  required this.dishTypes,
  required this.extendedIngredients,
});

  factory RecipeDetailed.fromJson(Map<String, dynamic> json) {
    return RecipeDetailed(
      id: json['id'],
      summary: json['summary'],
      instructions: json['instructions'] ?? "",
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      aggregateLikes: json['aggregateLikes'] ?? 0,
      healthScore: json['healthScore'] ?? 0,
      spoonacularScore: json['spoonacularScore'] ?? 0,
      pricePerServing: json['pricePerServing'] ?? 0,
      analyzedInstructions: json['analyzedInstructions'] ?? [],
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] ?? 0,
      dishTypes: json['dishTypes'],
      glutenFree: json['glutenFree'] ?? false,
      ketogenic: json['ketogenic'] ?? false,
      lowFodmap: json['lowFodmap'] ?? false,
      sustainable: json['sustainable'] ?? false,
      vegan: json['vegan'] ?? false,
      vegetarian: json['vegetarian'] ?? false,
      veryHealthy: json['veryHealthy'] ?? false,
      veryPopular: json['veryPopular'] ?? false,
      whole30: json['whole30'] ?? false,
      extendedIngredients: List<Ingredients>.from(
        (json['extendedIngredients'] ?? [])
            .map((ingredient) => Ingredients.fromJson(ingredient)),
      ),
    );
  }
}
