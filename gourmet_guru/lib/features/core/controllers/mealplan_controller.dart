import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/features/core/models/cuisines.dart';
import 'package:gourmet_guru/features/core/models/diets.dart';
import 'package:gourmet_guru/features/core/models/filter.dart';
import 'package:gourmet_guru/features/core/models/intolerances.dart';
import 'package:gourmet_guru/features/core/models/mealtype.dart';

class MealPlanController extends GetxController {
  Rx<String> timeFrame = "day".obs;
  Rx<Diet> selectedDiet = Diet.All.obs;
  Rx<double> targetCalories = 0.0.obs;
  Rx<bool> sliderError = false.obs;

  bool validateNutritions(double valuemin, double valuemax) {
    if (valuemin > valuemax && valuemax != 0) {
      sliderError.value = true;
      return true;
    } else {
      sliderError.value = false;
      return false;
    }


  }

  Map<String,dynamic> getParameters(){
    Map<String,dynamic> parameters = {};
    parameters['timeFrame'] = timeFrame.value.toString();
    if(selectedDiet.value.name != Diet.All.name.toString() || selectedDiet.value.name != Diet.None.name.toString()){
      parameters['diet'] = selectedDiet.value.name.toLowerCase();
    }
    if(targetCalories != 0){
      parameters['targetCalories'] = targetCalories.value.ceil().toString();
    }
    return parameters;
  }


}