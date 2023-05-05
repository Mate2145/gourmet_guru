import 'package:get/get.dart';
import 'package:gourmet_guru/firebase/recipe_service.dart';

class RecipeDetailScreenController extends GetxController {
  static RecipeDetailScreenController get instance => Get.find();

  final recipeservice = Get.put(RecipeService());
  Rx<bool> isSaved = false.obs;


  void saveRecipe(int id,String title) async {
    await recipeservice.saveFavouriteRecipe(id,title);
  }

  Future<void> isRecipeSaved(int id) async {
    isSaved.value = await recipeservice.isRecipeSaved(id);
    print("isSaved: " + isSaved.value.toString());
  }
}
