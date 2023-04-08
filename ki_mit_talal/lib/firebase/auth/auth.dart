import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ki_mit_talal/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ki_mit_talal/features/core/maindisplay/maindisplay.dart';
import 'package:ki_mit_talal/features/core/screens/dashboard/dashboard.dart';
import 'package:ki_mit_talal/firebase/exceptions/sign_up_email_password_exception.dart';

class AuthenticationFb extends GetxController {
  static AuthenticationFb get instance => Get.find();

  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setIniitialScreen);
  }

  _setIniitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => MainDisplay());
  }

  Future<void> createUser(String email, String pw) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pw);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> loginUser(String email, String pw) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pw);
      firebaseUser.value != null
          ? Get.offAll(() => const DashBoard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPasswordException.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignupWithEmailAndPasswordException();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await auth.signOut();
}
