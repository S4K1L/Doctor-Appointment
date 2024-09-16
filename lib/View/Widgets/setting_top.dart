import 'package:doctor_appointment/Controller/auth_controller.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/profile_image_picker.dart';

class SettingTop extends StatelessWidget {
  const SettingTop({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: kPrimaryColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Obx(()=> Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 320),
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width/4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                  color: kWhiteColor,
                ),
                child: TextButton(
                  onPressed: () {
                    authController.logout();
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 18,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
            const ProfileImagePicker(),
            const SizedBox(height: 10),
            Flexible(
              child: Text(
                authController.userModel.value.name ?? "Loading...",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: kWhiteColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              authController.userModel.value.speciality ?? "Speciality",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kWhiteColor),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: kWhiteColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: kPrimaryColor,
                        size: 26,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: kWhiteColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: kPrimaryColor,
                        size: 26,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: kWhiteColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.textsms,
                        color: kPrimaryColor,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),),
      ),
    );
  }
}