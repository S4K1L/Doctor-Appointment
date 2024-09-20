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
    return Container(
      height: MediaQuery.of(context).size.height/6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        color: kPrimaryColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Row(
          children: [
            const ProfileImagePicker(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Flexible(
                child: Row(
                  children: [
                    const Text(
                      'Hi, ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: kWhiteColor),
                    ),
                    Obx(
                      () => Text(
                        authController.userModel.value.name ?? "Loading...",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500,color: kWhiteColor),
                      ),
                    ),
                  ],
                ),
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
