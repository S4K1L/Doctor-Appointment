import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/auth_controller.dart';
import '../../../../Theme/colors.dart';
import '../../../Widgets/setting_bottom.dart';
import '../../../Widgets/setting_top.dart';

class DoctorSetting extends StatefulWidget {
  const DoctorSetting({super.key});

  @override
  State<DoctorSetting> createState() => _DoctorSettingState();
}

class _DoctorSettingState extends State<DoctorSetting> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingTop(authController: authController),
            SettingBottom(authController: authController),
          ],
        ),
      ),
    );
  }
}


