import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/login_controller.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/forgot_passsword.dart';
import '../../Widgets/login_top.dart';

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
                    Obx(()=>Form(
                      key: loginController.formKey.value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            emailForm(loginController.emailController.value),
                            const SizedBox(height: 30),
                            passwordField(
                              loginController.passwordController.value,
                              loginController.showPassword.value,
                            ),
                            ForgotPassword(onPress: (){},),
                          ],
                        ),
                      ),
                    ),),
                    CustomButton(
                      title: 'Login',
                      onPress: () {
                        loginController.login(
                          loginController.emailController.value.text,
                          loginController.passwordController.value.text,
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
                  ? loginController.showPassword.value = false
                  : loginController.showPassword.value = true;
            },
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              size: 26,
            )),
        hintText: 'Enter your password',
        border: const OutlineInputBorder(),
      ),
      validator: (value){
        if(controller.value.text.isEmpty){
          return 'incorrect password!';
        }
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
      validator: (value){
        if(controller.value.text.isEmpty){
          return 'Fill the email';
        }
      },
    );
  }
}
