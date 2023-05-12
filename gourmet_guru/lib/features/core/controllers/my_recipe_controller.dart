import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/firebase/recipe_service.dart';

class MyRecipeController extends GetxController {
  static MyRecipeController get instance => Get.find();

  final RecipeService service = Get.put(RecipeService());
  RxList<RecipeDetails> recipeList = RxList<RecipeDetails>([]);

  getRecipes() {
    return service.fetchAllRecipeFromLoggedInUser();
  }

  updateRecipeList() async {
    var snapshot = service.fetchAllRecipeFromLoggedInUser();
    if (snapshot != null) {
      recipeList.value = await snapshot;
    }
  }

  void removeRecipe(RecipeDetails recipe) async {
    if (await service.deleteRecipewithID(recipe.id)) {
      Get.snackbar("Delete", "Delete sucess",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.3),
          colorText: Colors.white);
      updateRecipeList();
      update();
    } else {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.3),
          colorText: Colors.black);
      update();
    }
  }
}
