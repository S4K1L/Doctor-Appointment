import 'package:doctor_appointment/View/Pages/Signup/doctor_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Theme/colors.dart';
import '../Pages/Login/login.dart';

class SignupTopContainer extends StatelessWidget {
  const SignupTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 260, top: 20),
            child: Container(
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                color: kWhiteColor,
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(()=>const LoginScreen(),transition: Transition.leftToRight);
                },
                child: const Text(
                  'Login',
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
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          const Text(
            'Register now',
            style: TextStyle(color: kWhiteColor, fontSize: 22),
          ),
          const Text(
            'Fill-up the below form',
            style: TextStyle(
                color: kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 260,top: 10),
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
                  Get.to(()=>const DoctorSignupScreen(),transition: Transition.rightToLeft);
                },
                child: const Text(
                  'Doctor',
                  style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      letterSpacing: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}