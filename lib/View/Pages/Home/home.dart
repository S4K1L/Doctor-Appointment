import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_appointment/Controller/auth_controller.dart';
import '../../Widgets/custom_search_button.dart';
import '../../Widgets/doctor_list.dart';
import '../../Widgets/home_top.dart';
import '../../Widgets/symptom_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.put(AuthController());

  // Add variables to track the selected symptom and search query
  String selectedSymptom = '';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTop(authController: authController),
          const SizedBox(height: 16),
          SearchField(
            onSearch: (query) {
              setState(() {
                searchQuery = query;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 26, left: 10, bottom: 20),
            child: Text(
              'Symptoms',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SymptomList(
            onSymptomSelected: (symptom) {
              setState(() {
                selectedSymptom = symptom; // Update selected symptom
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 26, left: 10, bottom: 10),
            child: Text(
              'Our Best Doctors',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          // Pass both search query and selected symptom to DoctorList
          DoctorList(
            authController: authController,
            selectedSymptom: selectedSymptom,
            searchQuery: searchQuery,
          ),
        ],
      ),
    );
  }
}
