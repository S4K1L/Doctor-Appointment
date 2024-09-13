import 'dart:ui';

import 'package:doctor_appointment/Controller/auth_controller.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/profile_image_picker.dart';
import '../../../Widgets/custom_search_button.dart';
import '../../../Widgets/doctor_list.dart';
import '../../../Widgets/home_top.dart';
import '../../../Widgets/symptom_list.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTop(authController: authController),
            const SizedBox(height: 16),
            SearchField(
              onSearch: (String) {},
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
            const SymptomList(),
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
            DoctorList(authController: authController),
          ],
        ),
      ),
    );
  }
}



