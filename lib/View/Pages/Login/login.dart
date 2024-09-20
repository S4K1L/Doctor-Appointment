import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Controller/login_controller.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/forgot_passsword.dart';
import '../../Widgets/login_top.dart';
import '../Forgot_Password/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginTop(),
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
                            const SizedBox(height: 10),
                            Obx(() => emailForm(
                                loginController.emailController.value)),
                            const SizedBox(height: 30),
                            Obx(() => passwordField(
                                loginController.passwordController.value,
                                loginController.showPassword.value)),
                            ForgotPassword(
                              onPress: () {
                                Get.to(()=> const ForgotPasswordScreen(),transition: Transition.downToUp,
                                  duration: const Duration(seconds: 2),);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(()=> Skeletonizer(
                      enabled: loginController.isLoading.value,
                      enableSwitchAnimation: true,
                      child: CustomButton(
                        title: 'Login',
                        onPress: () {
                          loginController.login(
                            loginController.emailController.value.text,
                            loginController.passwordController.value.text,
                          );
                        },
                      ),
                    ),)
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
              loginController.showPassword.value =
                  !loginController.showPassword.value;
            },
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              size: 26,
            )),
        hintText: 'Enter your password',
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (controller.value.text.isEmpty) {
          return 'Incorrect password!';
        }
        return null;
      },
    );
  }

  TextFormField emailForm(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (controller.value.text.isEmpty) {
          return 'Fill the email';
        }
        return null;
      },
    );
  }
}
