import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_mit_talal/features/core/models/recipe_detail.dart';
import 'package:ki_mit_talal/firebase/recipe_service.dart';

class MyRecipeController extends GetxController{
  static MyRecipeController get instance => Get.find();

  final RecipeService service = Get.put(RecipeService());

  getRecipes(){
    return service.fetchAllRecipeFromLoggedInUser();
  }

  void removeRecipe(RecipeDetailed recipe) async
  {
    if(await service.deleteRecipewithID(recipe.id)){
      Get.snackbar("Delete","Delete sucess");
    }
    else{
      Get.snackbar("Error", "Something went wrong");
    }
    
  }
}