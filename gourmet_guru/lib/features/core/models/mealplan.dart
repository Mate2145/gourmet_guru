import 'package:gourmet_guru/features/core/models/mealplanrecipe.dart';
import 'package:gourmet_guru/features/core/models/nutrients.dart';

import '../../../models/recipe.dart';

class MealPlan{
  List<MealPlanRecipe> recipes;
  Nutrients nutrients;

  MealPlan({ required this.recipes, required this.nutrients});

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      recipes: List<MealPlanRecipe>.from(json['meals'].map((meal) => MealPlanRecipe.fromJson(meal))),
      nutrients: Nutrients.fromJson(json['nutrients']),
    );
  }
  
}
