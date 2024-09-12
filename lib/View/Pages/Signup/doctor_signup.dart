import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/doctor_signup_controller.dart';
import '../../../Theme/colors.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/doctor_signup_top.dart';

class DoctorSignupScreen extends StatefulWidget {
  const DoctorSignupScreen({super.key});

  @override
  State<DoctorSignupScreen> createState() => _DoctorSignupScreenState();
}

class _DoctorSignupScreenState extends State<DoctorSignupScreen> {
  DoctorSignupController doctorSignupController = Get.put(DoctorSignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DoctorSignupTop(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: kWhiteColor),
                child: Column(
                  children: [
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          children: [
                            inputField('Full Name', Icons.person,
                                doctorSignupController.nameController.value),
                            const SizedBox(height: 30),
                            inputField('Contact number', Icons.phone,
                                doctorSignupController.phoneController.value),
                            const SizedBox(height: 30),
                            inputField('Enter your email', Icons.email,
                                doctorSignupController.emailController.value),
                            const SizedBox(height: 30),
                            Obx(
                                  () => passwordField(
                                    doctorSignupController.passwordController.value,
                                    doctorSignupController.showPassword.value,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      title: 'Signup',
                      onPress: () {
                        doctorSignupController.doctorSignup(
                          doctorSignupController.emailController.value.text,
                          doctorSignupController.passwordController.value.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField passwordField(
      TextEditingController controller, bool showPassword) {
    return TextFormField(
      controller: controller,
      obscureText: showPassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.password,
          size: 22,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              showPassword
                  ? doctorSignupController.showPassword.value = false
                  : doctorSignupController.showPassword.value = true;
            },
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              size: 26,
            )),
        hintText: 'Enter your password',
        border: const OutlineInputBorder(),
      ),
    );
  }

  TextFormField inputField(
      String title, IconData icon, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: title,
        border: const OutlineInputBorder(),
      ),
    );
  }
}