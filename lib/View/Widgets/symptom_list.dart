import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';

class SymptomList extends StatefulWidget {
  const SymptomList({
    super.key,
  });

  @override
  State<SymptomList> createState() => _SymptomListState();
}

class _SymptomListState extends State<SymptomList> {
  List<String> symptomName = ['Dental','Heart','Eye','Nose','Ear','Brain'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          symptomBox(symptomName[0], 'tooth'),
          symptomBox(symptomName[1], 'heart'),
          symptomBox(symptomName[2], 'eyes'),
          symptomBox(symptomName[3], 'nose'),
          symptomBox(symptomName[4], 'ear'),
          symptomBox(symptomName[5], 'brain'),
        ],
      ),
    );
  }

  Padding symptomBox(String title, String image) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: kWhiteColor,
                radius: 30,
                child: TextButton(
                  onPressed: () {},
                  child: Image.asset('assets/images/$image.png',fit: BoxFit.cover,),
                ),
              ),
              Text(title)
            ],
          ),
        );
  }
}
