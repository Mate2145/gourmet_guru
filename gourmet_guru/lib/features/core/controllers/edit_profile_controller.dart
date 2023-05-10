import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gourmet_guru/features/core/models/favrecipemodell.dart';
import 'package:gourmet_guru/features/core/models/recipe_detail.dart';
import 'package:gourmet_guru/firebase/recipe_service.dart';
import 'package:gourmet_guru/firebase/user_service.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  //final RecipeService service = Get.put(RecipeService());
  final UserService service = Get.put(UserService());
  RxList<FavRecipeModell> recipeList = RxList<FavRecipeModell>([]);

}