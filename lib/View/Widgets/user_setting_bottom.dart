import 'package:doctor_appointment/Controller/auth_controller.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSettingBottom extends StatelessWidget {
  const UserSettingBottom({
    super.key,
    required this.authController,
  });
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(()=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'About User',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor),
              ),
            ),
            Text(
              authController.userModel.value.bio ?? 'Loading....',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[600],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 1.5),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      profileContainer(context,'',authController.userModel.value.phone ?? 'Loading...', Icons.phone),
                      profileContainer(context,'', authController.userModel.value.email ?? 'Loading...', Icons.alternate_email_rounded),
                      profileContainer(context,'', authController.userModel.value.password ?? 'Loading...', Icons.password),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }

  Padding profileContainer(BuildContext context, String? title,String authenticate,IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kPrimaryColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                color: kWhiteColor,
                size: 30,
              ),
            ),
            Flexible(
              child: Text(
                "$title$authenticate",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
