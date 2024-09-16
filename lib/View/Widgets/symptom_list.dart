import 'package:flutter/material.dart';

class SymptomList extends StatefulWidget {
  final Function(String) onSymptomSelected; // Callback to notify the selected symptom

  const SymptomList({
    super.key,
    required this.onSymptomSelected, // Required callback
  });

  @override
  State<SymptomList> createState() => _SymptomListState();
}

class _SymptomListState extends State<SymptomList> {
  List<String> symptomName = ['Dental', 'Heart', 'Eye', 'Nose', 'Ear', 'Brain'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: symptomName.map((symptom) {
          return symptomBox(symptom, symptom.toLowerCase());
        }).toList(),
      ),
    );
  }

  Padding symptomBox(String title, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: TextButton(
                onPressed: () {
                  widget.onSymptomSelected(title); // Notify the parent widget of the selected symptom
                },
                child: Image.asset('assets/images/$image.png', fit: BoxFit.cover),
              ),
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}
