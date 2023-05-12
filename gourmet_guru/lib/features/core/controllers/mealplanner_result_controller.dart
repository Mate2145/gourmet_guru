import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gourmet_guru/features/core/models/mealplan.dart';
import 'package:gourmet_guru/features/core/models/mealplanrecipe.dart';
import 'package:gourmet_guru/features/core/models/nutrients.dart';

import '../../../models/recipe.api.dart';
import '../../../models/recipe.dart';

class MealPlannerResultController extends GetxController {
  late List<MealPlanRecipe> _recipes;
  late Nutrients nutrients;
  bool isloading = true;

  MealPlannerResultController(MealPlan mealPlan) {
    getRecipes(mealPlan);
  }

  List<MealPlanRecipe> get recipes => _recipes;

  Future<void> getRecipes(MealPlan mealPlan) async {
    _recipes = mealPlan.recipes;
    nutrients = mealPlan.nutrients;
    isloading = false;
    update();
    print(_recipes);
  }
}
