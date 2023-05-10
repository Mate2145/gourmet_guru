import 'package:get/get.dart';

import '../../../models/recipe.api.dart';
import '../models/recipe_detail.dart';

class RecipeDetailController extends GetxController {
  RecipeDetails? _recipeDetails;

  RecipeDetails? get recipeDetails => _recipeDetails;

  void setRecipeDetails(RecipeDetails? recipeDetails) {
    _recipeDetails = recipeDetails;
    update();
  }

  Future<void> fetchRecipeDetails(int recipeId) async {
    try {
      final recipeDetails = await RecipeAPI.fetchRecipeDetails(recipeId);
      setRecipeDetails(recipeDetails);
    } catch (e) {
      print('Error loading recipe details: $e');
    }
  }
}