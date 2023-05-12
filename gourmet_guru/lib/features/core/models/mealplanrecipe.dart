import 'package:flutter/foundation.dart';

class MealPlanRecipe {
  final int id;
  final String title;

  MealPlanRecipe({required this.id, required this.title});

  factory MealPlanRecipe.fromJson(dynamic json) {
    return MealPlanRecipe(
        id: json['id'] as int,
        title: json['title'] as String);
  }

  static List<MealPlanRecipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return MealPlanRecipe.fromJson(data);
    }).toList();
  }
}
