import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/user_signup_controller.dart';
import '../../../Theme/colors.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/signup_top.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({super.key});

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  UserSignupController userSignupController = Get.put(UserSignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SignupTopContainer(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: kWhiteColor),
                child: Obx(
                  () => Column(
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30,bottom: 10),
                          child: Column(
                            children: [
                              inputField('Full Name', Icons.person,
                                  userSignupController.nameController.value),
                              const SizedBox(height: 30),
                              inputField('Contact number', Icons.phone,
                                  userSignupController.phoneController.value),
                              const SizedBox(height: 30),
                              inputField('Enter your email', Icons.email,
                                  userSignupController.emailController.value),
                              const SizedBox(height: 30),
                              passwordField(
                                userSignupController.passwordController.value,
                                userSignupController.showPassword.value,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        title: 'Signup',
                        onPress: () {
                          userSignupController.userSignup(
                            userSignupController.emailController.value.text,
                            userSignupController.passwordController.value.text,
                          );
                        },
                      ),
                    ],
                  ),
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
                  ? userSignupController.showPassword.value = false
                  : userSignupController.showPassword.value = true;
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
