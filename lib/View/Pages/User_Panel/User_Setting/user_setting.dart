import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/auth_controller.dart';
import '../../../../Theme/colors.dart';
import '../../../Widgets/setting_top.dart';
import '../../../Widgets/user_setting_bottom.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingTop(authController: authController),
            UserSettingBottom(authController: authController),
          ],
        ),
      ),
    );
  }
}


