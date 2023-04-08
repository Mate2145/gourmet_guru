import 'package:flutter/foundation.dart';

class Recipe {
  final int id;
  final String title;
  final String image;

  Recipe({required this.id, required this.title, required this.image});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}
