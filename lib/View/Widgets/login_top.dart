import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Pages/Signup/user_signup.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 260, top: 20),
            child: Container(
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
                color: kWhiteColor,
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(()=>const UserSignupScreen(),transition: Transition.rightToLeft);
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      letterSpacing: 1.5),
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            height: MediaQuery.of(context).size.height / 3.3,
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          const Text(
            'Welcome Back',
            style: TextStyle(color: kWhiteColor, fontSize: 22),
          ),
          const Text(
            'Find your doctor with us',
            style: TextStyle(
                color: kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}