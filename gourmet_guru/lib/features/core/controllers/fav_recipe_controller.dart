import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gourmet_guru/features/core/models/favrecipemodell.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/firebase/recipe_service.dart';

class FavRecipeController extends GetxController {
  static FavRecipeController get instance => Get.find();

  final RecipeService service = Get.put(RecipeService());
  RxList<FavRecipeModell> recipeList = RxList<FavRecipeModell>([]);

  getRecipes() {
    return service.fetchAllFavRecipeFromLoggedInUser();
  }

  updateRecipeList() async {
    var snapshot = service.fetchAllFavRecipeFromLoggedInUser();
    if (snapshot != null) {
      recipeList.value = await snapshot;
    }
  }

  void removeRecipe(FavRecipeModell recipe) async {
    if (await service.deleteFavRecipewithID(recipe.id)) {
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