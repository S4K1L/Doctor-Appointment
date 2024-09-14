import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Model/user_model.dart';
import 'package:doctor_appointment/Routes/routes.dart';
import 'package:doctor_appointment/View/Pages/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable list to hold doctor data
  var doctors = <UserModel>[].obs;

  // Observable for currently logged-in user
  var userModel = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();  // Fetch current user when controller initializes
    fetchDoctors();      // Fetch doctors when controller initializes
  }

  // Fetch currently logged-in user data from Firestore
  Future<void> fetchCurrentUser() async {
    try {
      User? user = _auth.currentUser; // Get the currently logged-in user

      if (user != null) {
        // Fetch user document from Firestore by UID
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          userModel.value = UserModel(
            name: userDoc['name'],
            email: userDoc['email'],
            phone: userDoc['phone'],
            password: userDoc['password'],
            profileImage: userDoc['profileImage'],
            speciality: userDoc['speciality'] ?? '',  // Assuming speciality is for doctors
            rating: userDoc['rating'] != null ? userDoc['rating'].toDouble() : 0.0,
          );
        }else{
          print('User Model Error');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching current user: $e");
      }
    }
  }

  // Logout method
  Future<void> logout() async {
    try {
      if (_auth.currentUser != null) {
        await _auth.signOut();
        userModel.value = UserModel();  // Clear user data on logout
        Get.to(()=> const LoginScreen(),transition: Transition.rightToLeft);
      } else {
        if (kDebugMode) {
          print("No user is currently signed in");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error logging out: $e");
      }
      rethrow;
    }
  }

  // Fetch all doctors where role = doctor
  Future<void> fetchDoctors() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .where('role', isEqualTo: 'doctor')
          .get();

      doctors.value = snapshot.docs.map((doc) {
        return UserModel(
          name: doc['name'],
          phone: doc['phone'],
          email: doc['email'],
          profileImage: doc['profileImage'],
          speciality: doc['speciality'],
          rating: doc['rating'] != null ? doc['rating'].toDouble() : 0.0,
        );
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching doctors: $e");
      }
    }
  }
}
