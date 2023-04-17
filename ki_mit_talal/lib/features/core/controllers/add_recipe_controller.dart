import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/core/models/ingredients.dart';

class AddRecipeController extends GetxController {

  final formkey = GlobalKey<FormState>();

  var ingredients = <Ingredients>[].obs;
  final ingredientNameController = TextEditingController();
  final ingredientAmountController = TextEditingController();
  final ingredientMeasureController = TextEditingController();



  void addIngredient(Ingredients ingredient){
    ingredients.add(ingredient);
  }


}