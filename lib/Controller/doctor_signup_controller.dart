import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Model/user_model.dart';

class DoctorSignupController extends GetxController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var userModel = UserModel().obs;
  RxBool showPassword = true.obs;

  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final specialityController = TextEditingController().obs;
  final compensationController = TextEditingController().obs;
  final bioController = TextEditingController().obs;
  final hospitalController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
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
          compensation: compensationController.value.text,
          bio: bioController.value.text,
          hospital: hospitalController.value.text,
          address: addressController.value.text,
          email: email,
          password: password,
          speciality: specialityController.value.text,
          profileImage: '',
        );

        await _firestore.collection('users').doc(user.uid).set({
          'name': userModel.value.name,
          'phone': userModel.value.phone,
          'email': userModel.value.email,
          'password': userModel.value.password,
          'speciality': userModel.value.speciality,
          'compensation': userModel.value.compensation,
          'bio': userModel.value.bio,
          'hospital': userModel.value.hospital,
          'address': userModel.value.address,
          'uid': user.uid,
          'profileImage': userModel.value.profileImage,
          'role': 'doctor',
          'rating': 0.0,
        });

        // Success message
        Get.snackbar('Registration Successful', 'Welcome to Doctor Appointment');
        Get.toNamed(RoutePath.doctorBottomBar);
        Get.clearRouteTree();
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