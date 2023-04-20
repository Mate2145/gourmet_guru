import 'package:get/get.dart';
import 'package:ki_mit_talal/firebase/recipe_service.dart';

class RecipeDetailScreenController extends GetxController{
    static RecipeDetailScreenController get instance => Get.find();

    final recipeservice = Get.put(RecipeService());
    Rx<bool> isSaved = false.obs;

  RecipeDetailScreenController(int id) {
    isRecipeSaved(id);
    print("isSavedController: " + isSaved.value.toString());
  }
   void saveRecipe(int id) async{
      await recipeservice.saveFavouriteRecipe(id);
   }

   Future<void> isRecipeSaved(int id) async{
      isSaved.value = await recipeservice.isRecipeSaved(id);
      print("isSaved: " + isSaved.value.toString());
   }
}