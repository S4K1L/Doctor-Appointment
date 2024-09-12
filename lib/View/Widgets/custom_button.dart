import 'package:flutter/material.dart';

import '../../Theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: TextButton(
          onPressed: onPress,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: kWhiteColor, letterSpacing: 1.5),
          ),
        ),
      ),
    );
  }
}
