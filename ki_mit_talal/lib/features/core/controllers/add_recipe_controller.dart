import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/core/models/equipment.dart';
import 'package:ki_mit_talal/features/core/models/ingredients.dart';
import 'package:ki_mit_talal/features/core/models/steps.dart';
import 'package:ki_mit_talal/features/core/models/units.dart';

class AddRecipeController extends GetxController {

  final formkey = GlobalKey<FormState>();

  var ingredients = <Ingredients>[].obs;
  var steps = <Steps>[].obs;
  var equipment =  <Equipment>[].obs;
  Rx<IngUnit> selectedUnit = IngUnit.none.obs;
  final ingredientNameController = TextEditingController();
  final equipmentController = TextEditingController();
  final stepController = TextEditingController();
  final ingredientAmountController = TextEditingController();
  final ingredientMeasureController = TextEditingController();

  AddRecipeController(){
    ingredients.add(new Ingredients(amount: 0, name: "", unit: ""));
    steps.add(new Steps(number: 0, step: ""));
    equipment.add(new Equipment(name: ""));
  }

  void addEmptyIngredient(int index){
    ingredients.add(new Ingredients(amount: 0, name: "", unit: ""));
  }

  void addEmptyEquipment(){
    equipment.add(new Equipment(name: ""));
  }

  void removeEquipmentatIndex(int index){
    equipment.removeAt(index);
  }

  void addEmtpyStep(int index){
    steps.add(new Steps(number: index+1, step: ""));
  }

  void removeStepsatIndex(int index){
    steps.removeAt(index);
  }

  void removeIngredientatIndex(int index){
    ingredients.removeAt(index);
  }


}