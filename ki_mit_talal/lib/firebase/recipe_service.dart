import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/features/core/models/recipe_detail.dart';

import 'auth/auth.dart';

class RecipeService extends GetxController{
  static RecipeService get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final authRepo = Get.put(AuthenticationFb());

  createRecipe(RecipeDetailed recipe) async{
    if(authRepo.firebaseUser.value?.uid != null){
      recipe.uid = authRepo.firebaseUser.value?.uid;  
    }
    await _db.collection("recipe").add(recipe.toJson()).whenComplete(() => Get.snackbar("Great Succes", "We saved your recipe",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green.withOpacity(0.5),colorText: ggDark),
    ).catchError((error,stackTrace){
      Get.snackbar("Something went wrong", "Error",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red.withOpacity(0.5),colorText: ggWhite);
      print(error);
    });
  }

    Future<List<RecipeDetailed>> fetchAllRecipeFromLoggedInUser() async
  {
    final uid = authRepo.firebaseUser.value?.uid;
    if(uid != null){
        final snapshot = await _db.collection("recipe").where("uid",isEqualTo: uid).get();
        final recipeList = snapshot.docs.map((e) => RecipeDetailed.fromFirebaseJson(e)).toList();
        return recipeList;
    }
    else{
      return [];
    }
  }

  Future<bool> deleteRecipewithID(int id) async {
   await _db
        .collection('recipe')
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
        print('Document with id $id deleted successfully!');
        return true;
      }
    }).catchError((error) => print("Failed to delete data: $error"));
    return false;
  }


}