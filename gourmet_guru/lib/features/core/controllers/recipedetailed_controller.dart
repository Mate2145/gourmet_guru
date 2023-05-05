import 'package:get/get.dart';

import '../../../models/recipe.api.dart';
import '../models/recipe_detail.dart';

class RecipeDetailController extends GetxController {
  RecipeDetailed? _recipeDetails;

  RecipeDetailed? get recipeDetails => _recipeDetails;

  void setRecipeDetails(RecipeDetailed? recipeDetails) {
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