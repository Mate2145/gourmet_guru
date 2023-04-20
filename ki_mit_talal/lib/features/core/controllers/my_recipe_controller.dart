import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_mit_talal/features/core/models/recipe_detail.dart';
import 'package:ki_mit_talal/firebase/recipe_service.dart';

class MyRecipeController extends GetxController{
  static MyRecipeController get instance => Get.find();

  final RecipeService service = Get.put(RecipeService());
  RxList<RecipeDetailed> recipeList = RxList<RecipeDetailed>([]);

  getRecipes(){
    return service.fetchAllRecipeFromLoggedInUser();
  }

  updateRecipeList() async{
    var snapshot = service.fetchAllRecipeFromLoggedInUser();
    if(snapshot != null){
      recipeList.value = await snapshot;
    }
    
  }

  void removeRecipe(RecipeDetailed recipe) async
  {
    if(await service.deleteRecipewithID(recipe.id)){
      Get.snackbar("Delete","Delete sucess",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green.withOpacity(0.3),colorText: Colors.white);
      updateRecipeList();
      update();
    }
    else{
      Get.snackbar("Error", "Something went wrong",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red.withOpacity(0.3),colorText: Colors.black);
      update();
    }
    
  }
}