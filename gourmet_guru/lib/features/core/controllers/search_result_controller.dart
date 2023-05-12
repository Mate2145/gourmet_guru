import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/recipe.api.dart';
import '../../../models/recipe.dart';

class SearchResultController extends GetxController {
  late List<Recipe> _recipes;
  bool isloading = true;

  SearchResultController(List<Recipe> searchList) {
    getRecipes(searchList);
  }

  List<Recipe> get recipes => _recipes;

  Future<void> getRecipes(List<Recipe> searchList) async {
    _recipes = searchList;
    isloading = false;
    update();
    print(_recipes);
  }
}
