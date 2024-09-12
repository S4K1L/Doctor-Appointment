import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Model/user_model.dart';

class DoctorSignupController extends GetxController{
  // Fire store instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //model
  var userModel = UserModel().obs;

  RxBool showPassword = true.obs;

  // Observing text controllers using .obs
  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;


  // Signup method
  Future<UserModel?> doctorSignup(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // Create a UserModel object
        userModel.value = UserModel(
          name: nameController.value.text,
          phone: phoneController.value.text,
          email: email,
          password: password,
          profileImage: '',
        );

        await _firestore.collection('users').doc(user.uid).set({
          'name': userModel.value.name,
          'phone': userModel.value.phone,
          'email': userModel.value.email,
          'profileImage': userModel.value.profileImage,
          'role': 'doctor',
        });

        // Success message
        Get.snackbar('Registration Successful', 'Welcome to Doctor Appointment');
        return userModel.value;
      } else {
        Get.snackbar('Registration Failed!', 'Try again!');
        if (kDebugMode) {
          print("User is null");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in registering: $e");
      }
      Get.snackbar('Error', 'Registration failed: $e');
      return null;
    }
  }

}