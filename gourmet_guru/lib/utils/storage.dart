import 'package:gourmet_guru/features/core/models/analyedinstructionlist.dart';

import '../features/core/models/recipe_detail.dart';

class MapStorage {
  static final Map<int, AnalyzedInstructionsList> _analyzedInstructionsMap = {};
  static final Map<int, RecipeDetails> recipeDetails = {};

  static void addAnalyzedInstructions(
      int recipeId, AnalyzedInstructionsList analyzedInstructions) {
    _analyzedInstructionsMap[recipeId] = analyzedInstructions;
  }

  static void addRecipeDetails(int recipeId, RecipeDetails recipe) {
    recipeDetails[recipeId] = recipe;
  }

  static AnalyzedInstructionsList? getAnalyzedInstructions(int recipeId) {
    return _analyzedInstructionsMap[recipeId];
  }

  static RecipeDetails? getRecipeDetails(int recipeId) {
    return recipeDetails[recipeId];
  }

  static bool isContainsRecipeDetailbyID(int id) {
    return recipeDetails.containsKey(id) ? true : false;
  }

  static bool isContainsID(int id) {
    return _analyzedInstructionsMap.containsKey(id) ? true : false;
  }
}
