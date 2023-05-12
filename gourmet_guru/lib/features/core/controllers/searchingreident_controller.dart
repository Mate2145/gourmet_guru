import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/filter.dart';
import '../models/steps.dart';

class SearchByIngredientsController extends GetxController {
  Rx<String> query = "".obs;
  var ingredientlist = <String>[].obs;

  SearchByIngredientsController(){
    ingredientlist.add("");
  }

  String? validateQuery(String value) {
    if (value.isEmpty) {
      return "You have to fill this";
    } else if (value.isNum) {
      return "Search a recipe";
    }
    return null;
  }

  String appendIngredients()
  {
    return this.ingredientlist.join(',+');
  }



  Filter? createFilterfromForm() {
    var filter = new Filter(query: this.query.value);

    return filter;
  }  

    void backToDefault() {
    ingredientlist.value = [];
  }

  void addEmptyIngredient(int index) {
    ingredientlist.add("");
  }

  void removeIngredientatIndex(int index) {
    ingredientlist.removeAt(index);
  }

}