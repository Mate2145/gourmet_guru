import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gourmet_guru/features/core/models/mealplanrecipe.dart';
import 'package:gourmet_guru/features/core/models/nutrients.dart';

import '../../../models/recipe.dart';

class FavRecipeModell{
  int id;
  String title;
  String uid;

  FavRecipeModell({ required this.id, required this.title,required this.uid});

  factory FavRecipeModell.fromJson(Map<String, dynamic> json) {
    return FavRecipeModell(
      id: json['id'],
      title: json['title'],
      uid: json['uid']
    );
  }

  factory FavRecipeModell.fromFirebaseJson(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final json = data.data()!;
    return FavRecipeModell(
      id: json['recipeID'],
      title: json['title'],
      uid: json['uid'],
    );
  }
  
}