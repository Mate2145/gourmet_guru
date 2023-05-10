import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
      
  const UserModel({
    this.id,
     required this. email,
    required this. fullName,
  });

  toJson(){
   return{
     "FullName": fullName,
     "Email": email,
    };
  }

}