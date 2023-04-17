import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/core/models/cuisines.dart';
import 'package:ki_mit_talal/features/core/models/diets.dart';
import 'package:ki_mit_talal/features/core/models/filter.dart';
import 'package:ki_mit_talal/features/core/models/intolerances.dart';
import 'package:ki_mit_talal/features/core/models/mealtype.dart';

class RecipeSearchController extends GetxController {
  //RxList<Recipe> _recipes = RxList<Recipe>([]);
  //List<Filter> _selectedFilters = [];
  final searchkey = GlobalKey<FormState>();
  String? _searchText;
  Rx<Cuisine> selectedCuisine = Cuisine.All.obs;
  Rx<Diet> selectedDiet = Diet.All.obs;
  Rx<MealType> selectedMealType = MealType.All.obs;
  Rx<Intolerances> selectedIntolerance = Intolerances.All.obs;
  Rx<String> query = "".obs;
  Rx<String> equipment = "".obs;
  Rx<double> cookTime = 0.0.obs;
  Rx<double> maxCalories = 0.0.obs;
  Rx<double> minCalories = 0.0.obs;
  Rx<double> minProtein = 0.0.obs;
  Rx<double> maxProtein = 0.0.obs;
  Rx<double> minCarbs = 0.0.obs;
  Rx<double> maxCarbs = 0.0.obs;
  Rx<double> minFat = 0.0.obs;
  Rx<double> maxFat = 0.0.obs;
  Rx<bool> information = false.obs;
  Rx<bool> sliderError = false.obs;
  //List<Recipe> get recipes => _recipes;
  //List<Filter> get selectedFilters => _selectedFilters;

  String? validateQuery(String value) {
    if (value.isEmpty) {
      return "You have to fill this";
    } else if (value.isNum) {
      return "Search a recipe";
    }
    return null;
  }

  String? validateCuisine(String value) {
    if (value.isEmpty) {
      return "You have to fill this";
    }
    return null;
  }

  bool validateNutritions(double valuemin, double valuemax) {
    if (valuemin > valuemax && valuemax != 0) {
      sliderError.value = true;
      return true;
    } else {
      sliderError.value = false;
      return false;
    }

    return false;
  }

  bool checkSearch() {
    final isValid = searchkey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    searchkey.currentState!.save();
    return true;
  }

  Filter? createFilterfromForm() {
    var filter = new Filter(query: this.query.value);

    //Cuisine
    if (selectedCuisine.value.name.toLowerCase() != 'all') {
      filter.cuisine = selectedCuisine.value.name.toLowerCase();
    }
    //Diet
    if (selectedDiet.value.name.toLowerCase() != 'all') {
      filter.diet = selectedDiet.value.name.toLowerCase();
    }
    //Intolerance
    if (selectedIntolerance.value.name.toLowerCase() != 'all') {
      filter.intolerances = selectedIntolerance.value.name.toLowerCase();
    }
    //Equipment
    if (equipment.value.isNotEmpty) {
      filter.equipment = equipment.value;
    }
    //MealType
    if (selectedMealType.value.name.toLowerCase() != 'all') {
      filter.mealType = selectedMealType.value.name.toLowerCase();
    }
    //Cooktime
    if (cookTime.value > 0) {
      filter.maxReadyTime = cookTime.value.ceil().toString();
    }
    //Min Calories
    if (minCalories.value > 0 && minCalories.value < maxCalories.value) {
      filter.minCalories = minCalories.value.ceil().toString();
    }
    //Max Calories
    if (maxCalories.value > 0 && maxCalories.value > minCalories.value) {
      filter.maxCalories = maxCalories.value.ceil().toString();
    }
    //Min Protein
    if (minProtein.value > 0 && minProtein.value < maxProtein.value) {
      filter.minProtein = minProtein.value.ceil().toString();
    }
    //Max protein
    if (maxProtein.value > 0 && maxProtein.value > minProtein.value) {
      filter.maxProtein = maxProtein.value.ceil().toString();
    }

    //Min carbs
    if (minCarbs.value > 0 && minCarbs.value < maxCarbs.value) {
      filter.minCarbs = minCarbs.value.ceil().toString();
    }

    //Max carbs
    if (maxCarbs.value > 0 && maxCarbs.value > minCarbs.value) {
      filter.maxCarbs = maxCarbs.value.ceil().toString();
    }

    //Min fat
    if (minFat.value > 0 && minFat.value < maxFat.value) {
      filter.minFat = minFat.value.ceil().toString();
    }

    //Max fat
    if (maxFat.value > 0 && maxFat.value > minFat.value) {
      filter.maxFat = maxFat.value.ceil().toString();
    }

    return filter;
  }
}
