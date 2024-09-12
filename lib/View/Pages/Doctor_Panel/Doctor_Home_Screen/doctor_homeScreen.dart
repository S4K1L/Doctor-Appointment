import 'dart:ui';

import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/profile_image_picker.dart';
import '../../../Widgets/custom_search_button.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  ProfileImagePicker(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Hi, ',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Doctor Name',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey[100],
                      child: const Icon(
                        Icons.notifications_none,
                        color: kPrimaryColor,
                        size: 26,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SearchField(
              onSearch: (String) {},
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, left: 10, bottom: 20),
              child: Text(
                'Symptoms',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                          Text('Dental')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                          Text('Dental')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                          Text('Dental')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                          Text('Dental')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                          Text('Dental')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                              icon: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                          Text('Dental')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, left: 10, bottom: 10),
              child: Text(
                'Our Best Doctors',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20,right: 20),
                    child: Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Doctor Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                Text('Surgeon',style: TextStyle(fontSize: 16),),
                                Text('* 4.9',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
