import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/main.dart';

import 'auth/auth.dart';

class RecipeService extends GetxController {
  static RecipeService get instance => Get.find();

  final authRepo = Get.put(AuthenticationFb());
  final _db = FirebaseFirestore.instance;

  createRecipe(RecipeDetailed recipe) async {
    if (authRepo.firebaseUser.value?.uid != null) {
      recipe.uid = authRepo.firebaseUser.value?.uid;
    }
    await _db
        .collection("recipe")
        .add(recipe.toJson())
        .whenComplete(
          () => Get.snackbar("Great Succes", "We saved your recipe",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.5),
              colorText: ggDark),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Something went wrong", "Error",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: ggWhite);
      print(error);
    });
  }

  Future<List<RecipeDetailed>> fetchAllRecipeFromLoggedInUser() async {
    final uid = authRepo.firebaseUser.value?.uid;
    if (uid != null) {
      final snapshot =
          await _db.collection("recipe").where("uid", isEqualTo: uid).get();
      final recipeList =
          snapshot.docs.map((e) => RecipeDetailed.fromFirebaseJson(e)).toList();
      return recipeList;
    } else {
      return [];
    }
  }

  Future<bool> deleteRecipewithID(int id) async {
    var recipeSnapshot =
        await _db.collection('recipe').where('id', isEqualTo: id).get();
    if (recipeSnapshot.docs.length == 0) {
      print('Document with id $id not found!');
      return false;
    } else {
      var recipeDoc = recipeSnapshot.docs[0];
      await recipeDoc.reference.delete();
      print(
          'Document with id $id and document id ${recipeDoc.id} deleted successfully!');
      return true;
    }
  }

  Future<bool> saveFavouriteRecipe(int id, String title) async {
    final uid = authRepo.firebaseUser.value?.uid;
    bool isSaved = await isRecipeSaved(id);
    if (uid != null && !isSaved) {
      var json = favRecipeToJson(id, uid, title);
      await _db
          .collection("fav_recipe")
          .add(json)
          .whenComplete(() => Get.snackbar("Success", "Save complete!"))
          .catchError((error, stackTrace) {
        Get.snackbar("Error", "Something went wrong");
        print(error);
      });
      return true;
    }
    Get.snackbar("Save error", "You already saved this recipe",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: ggWhite);
    return false;
  }

  Future<bool> isRecipeSaved(int id) async {
    final uid = authRepo.firebaseUser.value?.uid;
    if (uid != null) {
      var snapshot = await _db
          .collection("fav_recipe")
          .where('recipeID', isEqualTo: id)
          .where('uid', isEqualTo: uid)
          .get();
      if (snapshot.docs.isNotEmpty) {
        print('You already saved');
        return true;
      } else {
        print('Savable');
        return false;
      }
    } else {
      return false;
    }
  }

  favRecipeToJson(int id, String uid, String title) {
    return {"uid": uid, "recipeID": id, "title": title};
  }
}
