import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Model/user_model.dart';
import '../Routes/routes.dart';

class LoginController extends GetxController {
  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // UserModel observable
  var userModel = UserModel().obs;
  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;

  // Observing text controllers
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>().obs;

  // Login method
  Future<UserModel?> login(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;

      if (user != null) {
        // Fetch additional user details from Firestore
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (documentSnapshot.exists) {
          // Populate userModel with additional fields from Firestore
          userModel.value = UserModel(
            uid: user.uid,
            name: documentSnapshot.get('name') ?? user.displayName ?? '',
            phone: documentSnapshot.get('phone') ?? user.phoneNumber ?? '',
            email: email,
            speciality: documentSnapshot.get('speciality') ?? '',
            compensation: documentSnapshot.get('compensation') ?? '',
            bio: documentSnapshot.get('bio') ?? '',
            hospital: documentSnapshot.get('hospital') ?? '',
            address: documentSnapshot.get('address') ?? '',
            rating: (documentSnapshot.get('rating') ?? 0).toDouble(),
            profileImage: user.photoURL ?? documentSnapshot.get('profileImage') ?? '',
            password: password,
          );
          // Clear the text fields after successful login
          clearFields();
          isLoading.value = false;
          // Navigate to the appropriate route
          route();
          return userModel.value;
        } else {
          isLoading.value = false;
          Get.snackbar('Login Fail!', 'User data not found!', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
          return null;
        }
      } else {
        isLoading.value = false;
        Get.snackbar('Login Fail!', 'Try Again!', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
        return null;
      }

    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        Get.snackbar('Login Fail!', 'Check your email and password!', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
        print("Error in login: $e");
      }
      return null;
    }
    return null;
  }

  void clearFields() {
    emailController.value.clear();
    passwordController.value.clear();
  }

  void route() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Get.snackbar('No user logged in', 'Please login again', backgroundColor: kPrimaryColor, colorText: kWhiteColor);
      return;
    }
    var documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (documentSnapshot.exists) {
      String userType = documentSnapshot.get('role');
      if (userType == "user") {
        Get.snackbar('Logged in as User', 'Welcome to Doctor Appointment', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(RoutePath.userBottomBar);
      }
      else if (userType == "doctor") {
        Get.snackbar('Logged in as Doctor', 'Welcome to Doctor Appointment', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(RoutePath.doctorBottomBar);
      }
      else {
        Get.snackbar('Try again', 'Some error in logging in!', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
      }
    }
    else {
      Get.snackbar('Try again', 'Some error in logging in!', backgroundColor: kPrimaryColor, colorText: kWhiteColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {
      if (kDebugMode) {
        print('Error resetting password: $error');
      }
      rethrow;
    }
  }

}
