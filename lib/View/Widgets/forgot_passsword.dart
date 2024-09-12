import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final VoidCallback? onPress;
  const ForgotPassword({
    super.key, this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: onPress,
          child: const Text('Forgot Password?',style: TextStyle(color: kPrimaryColor),),
        ),
      ),
    );
  }
}
