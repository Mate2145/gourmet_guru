import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ki_mit_talal/features/core/models/analyedinstructionlist.dart';
import 'package:ki_mit_talal/features/core/models/analyzedInstructions.dart';
import 'package:ki_mit_talal/features/core/models/ingredients.dart';
import 'package:ki_mit_talal/features/core/screens/recipe_details/recipe_details_screen.dart';

class RecipeDetailed {
  final int id;
  final String title;
  String? uid;
  final String? image;
  final String? imageType;
  final String summary;
  final int servings;
  final int readyInMinutes;
  final int? aggregateLikes;
  final num? healthScore;
  final num? spoonacularScore;
  final bool? glutenFree;
  final bool? ketogenic;
  final bool? lowFodmap;
  final bool? sustainable;
  final bool? vegan;
  final bool? vegetarian;
  final bool? veryHealthy;
  final bool? veryPopular;
  final bool? whole30;
  List<AnalyzedInstructions>? instructionList;
  final int? weightWatcherSmartPoints;
  final List<dynamic>? dishTypes;
  final String addRecipedishType;
  final List<Ingredients> extendedIngredients;

RecipeDetailed({
  required this.id,
  required this.title,
  required this.summary,
  this.image,
  required this.addRecipedishType,
  this.imageType,
  required this.servings,
  required this.readyInMinutes,
  this.aggregateLikes,
  this.healthScore,
  this.spoonacularScore,
  this.glutenFree,
  this.ketogenic,
  this.lowFodmap,
  this.sustainable,
  this.vegan,
  this.vegetarian,
  this.veryHealthy,
  this.veryPopular,
  this.whole30,
  this.weightWatcherSmartPoints,
  this.dishTypes,
  required this.extendedIngredients,
  this.instructionList,
  this.uid,
});

  factory RecipeDetailed.fromJson(Map<String, dynamic> json) {
    return RecipeDetailed(
      id: json['id'],
      summary: json['summary'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      aggregateLikes: json['aggregateLikes'] ?? 0,
      healthScore: json['healthScore'] ?? 0,
      spoonacularScore: json['spoonacularScore'] ?? 0,
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] ?? 0,
      dishTypes: json['dishTypes'],
      glutenFree: json['glutenFree'] ?? false,
      ketogenic: json['ketogenic'] ?? false,
      lowFodmap: json['lowFodmap'] ?? false,
      sustainable: json['sustainable'] ?? false,
      vegan: json['vegan'] ?? false,
      vegetarian: json['vegetarian'] ?? false,
      veryHealthy: json['veryHealthy'] ?? false,
      veryPopular: json['veryPopular'] ?? false,
      addRecipedishType: json['addRecipedishType'] ?? "",
      whole30: json['whole30'] ?? false,
      extendedIngredients: List<Ingredients>.from(
        (json['extendedIngredients'] ?? [])
            .map((ingredient) => Ingredients.fromJson(ingredient)),
      ),
    );
  }


  factory RecipeDetailed.fromFirebaseJson(DocumentSnapshot<Map<String, dynamic>> data) {
    final json = data.data()!;
    return RecipeDetailed(
      id: json['id'],
      summary: json['summary'],
      uid: json['uid'],
      title: json['title'],
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      addRecipedishType: json['addRecipedishType'] ?? "",
      extendedIngredients: List<Ingredients>.from(
        (json['extendedIngredients'] ?? [])
            .map((ingredient) => Ingredients.fromSnapshot(ingredient)),
      ),
      instructionList: List<AnalyzedInstructions>.from(
        (json['instructionList'])
          .map((instruction) => AnalyzedInstructions.fromSnapshot(instruction)),
        ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'summary': this.summary,
      if(this.image != null) 'image': this.image,
      'addRecipedishType': this.addRecipedishType,
      if (imageType != null) 'imageType': this.imageType,
      'servings': this.servings,
      'readyInMinutes': this.readyInMinutes,
      if (aggregateLikes != null) 'aggregateLikes': this.aggregateLikes,
      if (healthScore != null) 'healthScore': this.healthScore,
      if (spoonacularScore != null) 'spoonacularScore': this.spoonacularScore,
      if (glutenFree != null) 'glutenFree': this.glutenFree,
      if (ketogenic != null) 'ketogenic': this.ketogenic,
      if (lowFodmap != null) 'lowFodmap': this.lowFodmap,
      if (sustainable != null) 'sustainable': this.sustainable,
      if (vegan != null) 'vegan': this.vegan,
      if (vegetarian != null) 'vegetarian': this.vegetarian,
      if (veryHealthy != null) 'veryHealthy': this.veryHealthy,
      if (veryPopular != null) 'veryPopular': this.veryPopular,
      if (whole30 != null) 'whole30': this.whole30,
      if (weightWatcherSmartPoints != null) 'weightWatcherSmartPoints': this.weightWatcherSmartPoints,
      if (dishTypes != null) 'dishTypes': this.dishTypes,
      'extendedIngredients': this.extendedIngredients.map((ingredients) => ingredients.toJson()).toList(),
      if (instructionList != null) 'instructionList': this.instructionList!.map((instruction) => instruction.toJson()).toList(),
      if(uid != null) 'uid' : this.uid,
    };
  }
}
