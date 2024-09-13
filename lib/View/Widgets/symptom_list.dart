import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';

class SymptomList extends StatelessWidget {
  const SymptomList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          symptomBox(),
          symptomBox(),
          symptomBox(),
          symptomBox(),
          symptomBox(),
          symptomBox(),
          symptomBox(),
          symptomBox(),
        ],
      ),
    );
  }

  Padding symptomBox() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 90,
            width: 80,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.red[100]),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: kPrimaryColor,
                      size: 32,
                    ),
                  ),
                ),
                const Text('Dental')
              ],
            ),
          ),
        );
  }
}
