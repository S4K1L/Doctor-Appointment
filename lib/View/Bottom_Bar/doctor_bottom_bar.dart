import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Theme/colors.dart';
import '../Pages/Doctor_Panel/Doctor_Home_Screen/doctor_homeScreen.dart';
import '../Pages/Doctor_Panel/Doctor_Request/doctor_request.dart';
import '../Pages/Doctor_Panel/Doctor_Schedule/doctor_schedule.dart';
import '../Pages/Doctor_Panel/Doctor_Setting/doctor_setting.dart';

class DoctorBottomBar extends StatefulWidget {
  const DoctorBottomBar({super.key});

  @override
  State<DoctorBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<DoctorBottomBar> {
  int indexColor = 0;
  List<Widget> screens = [
    const DoctorHomeScreen(),
    const DoctorRequest(),
    const DoctorSchedule(),
    const DoctorSetting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexColor],
      bottomNavigationBar: BottomAppBar(
        height: 70,
        elevation: 10,
        color: kWhiteColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavigationItem(Icons.home_filled, 'Home', 0),
            _buildBottomNavigationItem(
                CupertinoIcons.chat_bubble_fill, 'Message', 1),
            _buildBottomNavigationItem(
                Icons.calendar_month_outlined, 'Schedule', 2),
            _buildBottomNavigationItem(Icons.settings, 'Setting', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indexColor = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 25,
            color: indexColor == index ? kPrimaryColor : kGrayColor,
          ),
          if (indexColor == index)
            Text(
              label,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}
