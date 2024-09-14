import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/auth_controller.dart';
import '../../Theme/colors.dart';
import '../../utils/profile_image_picker.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(
            () => Row(
          children: [
            const ProfileImagePicker(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Text(
                    'Hi, ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    authController.userModel.value.name ?? "Loading...",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey[100],
              child: const Icon(
                Icons.notifications_none,
                color: kPrimaryColor,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
