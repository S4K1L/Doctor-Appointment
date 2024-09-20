import 'package:doctor_appointment/View/Bottom_Bar/doctor_bottom_bar.dart';
import 'package:doctor_appointment/View/Bottom_Bar/user_bottom_bar.dart';
import 'package:get/get.dart';
import '../View/Pages/Login/login.dart';
import '../View/Pages/Signup/user_signup.dart';

class RoutePath {
  static String login = '/login';
  static String signup = '/signup';
  static String doctorBottomBar = '/doctorBottomBar';
  static String userBottomBar = '/userBottomBar';
}

final pages = [
  GetPage(
    name: RoutePath.login,
    page: () => const LoginScreen(),
    transition: Transition.upToDown,
    transitionDuration: const Duration(seconds: 2),
  ),
  GetPage(
    name: RoutePath.signup,
    page: () => const UserSignupScreen(),
  ),
  GetPage(
    name: RoutePath.doctorBottomBar,
    page: () => const DoctorBottomBar(),
    transition: Transition.upToDown,
    transitionDuration: const Duration(seconds: 2),
  ),
  GetPage(
      name: RoutePath.userBottomBar,
      page: () => const UserBottomBar(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(seconds: 2)),
];
