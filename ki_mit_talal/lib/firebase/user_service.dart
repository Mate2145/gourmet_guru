import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/authentication/models/user_model.dart';

class UserService extends GetxController {
  static UserService get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("users").add(user.toJson()).whenComplete(() => Get.snackbar("Success", "Your account has been created",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green.withOpacity(0.3),colorText: Colors.green))
    .catchError((error, stackTrace)
     { 
      Get.snackbar(
      "Error", "Something went wrong. Try again",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.2),
      colorText: Colors.red);
      print(error.toString());
    });
    
  }


  
}