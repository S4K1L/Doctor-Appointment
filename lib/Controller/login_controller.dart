import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Model/user_model.dart';
import '../Routes/routes.dart';

class LoginController extends GetxController{
  // Fire store instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //model
  var userModel = UserModel().obs;
  RxBool showPassword = true.obs;

  // Observing text controllers using .obs
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // Login method
  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;

      if (user != null) {
        // Assigning user data from Firebase
        userModel.value = UserModel(
          phone: user.phoneNumber ?? '',
          name: user.displayName ?? '',
          email: email,
          password: password,
          profileImage: user.photoURL ?? '',
        );
        route();
        return userModel.value;
      } else {
        Get.snackbar('Login Fail!', 'Try Again!',backgroundColor: kPrimaryColor,colorText: kWhiteColor);
        if (kDebugMode) {
          print("User is null");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in login: $e");
      }
      return null;
    }
  }

  void route() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Get.snackbar('No user logged in', 'Please login again',backgroundColor: kPrimaryColor,colorText: kWhiteColor);
      return;
    }
    var documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (documentSnapshot.exists) {
      String userType = documentSnapshot.get('role');
      if (userType == "user") {
        Get.snackbar('Logged in as User', 'Welcome to Doctor Appointment',backgroundColor: kPrimaryColor,colorText: kWhiteColor);
        Get.toNamed(RoutePath.userBottomBar);
      }
      else if (userType == "doctor") {
        Get.snackbar('Logged in as Doctor', 'Welcome to Doctor Appointment',backgroundColor: kPrimaryColor,colorText: kWhiteColor);
        Get.toNamed(RoutePath.doctorBottomBar);
      }
      else {
        Get.snackbar('Try again', 'Some error in logging in!',backgroundColor: kPrimaryColor,colorText: kWhiteColor);

      }
    } else {
      Get.snackbar('Try again', 'Some error in logging in!',backgroundColor: kPrimaryColor,colorText: kWhiteColor);

    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {
      if (kDebugMode) {
        print('Error resetting password: $error');
      }
      rethrow;  // rethrow error if you need further handling
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.value.clear();
    passwordController.value.clear();
  }
}