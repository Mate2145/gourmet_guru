import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/filter.dart';

class SimpleSearchController extends GetxController {
  Rx<String> query = "".obs;


  String? validateQuery(String value) {
    if (value.isEmpty) {
      return "You have to fill this";
    } else if (value.isNum) {
      return "Search a recipe";
    }
    return null;
  }

  Filter? createFilterfromForm() {
    var filter = new Filter(query: this.query.value);

    return filter;
  }  
}