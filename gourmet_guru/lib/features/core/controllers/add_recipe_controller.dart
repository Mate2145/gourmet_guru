import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/models/analyzedInstructions.dart';
import 'package:gourmet_guru/features/core/models/equipment.dart';
import 'package:gourmet_guru/features/core/models/ingredients.dart';
import 'package:gourmet_guru/features/core/models/mealtype.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/features/core/models/steps.dart';
import 'package:gourmet_guru/features/core/models/units.dart';
import 'package:gourmet_guru/firebase/recipe_service.dart';

class AddRecipeController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final recipeservice = Get.put(RecipeService());
  RxString recipeName = "".obs;
  RxString summary = "".obs;
  var ingredients = <Ingredients>[].obs;
  var steps = <Steps>[].obs;
  var equipment = <Equipment>[].obs;
  final namecontroller = TextEditingController();
  final summarycontroller = TextEditingController();
  final stepsController = TextEditingController();
  Rx<IngUnit> selectedUnit = IngUnit.none.obs;
  Rx<MealType> selectedMealType = MealType.mainCourse.obs;
  Rx<double> cookTime = 0.0.obs;
  Rx<double> servings = 0.0.obs;

  AddRecipeController() {
    ingredients.add(new Ingredients(amount: 0, name: "", unit: ""));
    steps.add(new Steps(number: 0, step: ""));
    equipment.add(new Equipment(name: ""));
  }

  void backToDefault() {
    ingredients.add(new Ingredients(amount: 0, name: "", unit: ""));
    steps.add(new Steps(number: 0, step: ""));
  }

  void addEmptyIngredient(int index) {
    ingredients.add(new Ingredients(amount: 0, name: "", unit: ""));
  }

  void addEmptyEquipment() {
    equipment.add(new Equipment(name: ""));
  }

  void removeEquipmentatIndex(int index) {
    equipment.removeAt(index);
  }

  void addEmtpyStep(int index) {
    steps.add(new Steps(number: index + 1, step: ""));
  }

  void removeStepsatIndex(int index) {
    steps.removeAt(index);
  }

  void removeIngredientatIndex(int index) {
    ingredients.removeAt(index);
  }

  bool addRecipe() {
    List<Ingredients> listofIngredients = ingredients.value;
    int id = generateRecipeId();
    List<AnalyzedInstructions> analyzedInstructions = [];
    analyzedInstructions
        .add(new AnalyzedInstructions(name: "", steps: this.steps.value));

    if (cookTime.value == 0) {
      Get.snackbar("Error", "Read in minutes is 0",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.red);
      return false;
    }
    if (servings.value == 0) {
      Get.snackbar("Error", "Servings is 0",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.red);
      return false;
    }
    final detailedRecipe = new RecipeDetailed(
        id: id,
        title: this.recipeName.value,
        summary: this.summary.value,
        addRecipedishType: this.selectedMealType.value.name,
        servings: this.servings.value.toInt(),
        readyInMinutes: this.cookTime.value.toInt(),
        extendedIngredients: listofIngredients,
        instructionList: analyzedInstructions);
    print(detailedRecipe.toJson());
    recipeservice.createRecipe(detailedRecipe);
    clearForm();

    return true;
  }

  void clearForm() {
    recipeName.value = "";
    summary.value = "";
    ingredients.value = [];
    steps.value = [];
    selectedUnit.value = IngUnit.none;
    selectedMealType.value = MealType.mainCourse;
    cookTime.value = 0.0;
    servings.value = 0.0;
    namecontroller.clear();
    summarycontroller.clear();
    backToDefault();
  }

  int generateRecipeId() {
    final int length = 5;
    final int maxNumber = 99999;
    final Random random = Random.secure();

    final id = random.nextInt(maxNumber);

    return id;
  }
}
