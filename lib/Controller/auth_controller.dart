import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Fire store instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //model
  var userModel = UserModel().obs;

  // Logout method
  Future<void> logout() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.signOut();
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

  // Fetch user data from Fire store
  Future<void> fetchUserData(String userId) async {
    try {
      // Fetch the document with the user's ID
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        // Extract user data from Firestore and update the userModel
        userModel.value = UserModel(
          name: userDoc['name'],
          phone: userDoc['phone'],
          email: userDoc['email'],
          password: userDoc['password'],
          profileImage: userDoc['profileImage'],
        );
        if (kDebugMode) {
          print('User data fetched successfully.');
        }
      } else {
        if (kDebugMode) {
          print('No user found with the given ID.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
    }
  }

  // Example function to fetch the currently logged-in user's data
  Future<void> fetchCurrentUserData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await fetchUserData(currentUser.uid);
    } else {
      if (kDebugMode) {
        print('No user is currently logged in.');
      }
    }
  }
}
