import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Controller/auth_controller.dart';
import '../../../../Controller/booking_controller.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    super.key,
    required this.authController,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.doctorBio,
    required this.doctorUid,
    required this.doctorPhone,
    required this.doctorCompensation,
    required this.doctorImage,
    required this.userImage,
  });

  final AuthController authController;
  final String doctorName;
  final String doctorSpeciality;
  final String doctorBio;
  final String doctorUid;
  final String doctorPhone;
  final String doctorCompensation;
  final String doctorImage;
  final String userImage;

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  BookingController bookingController = Get.put(BookingController());

  int _selectedDateIndex = 0;
  int _selectedTimeIndex = -1;

  List<String> _dates = [];
  List<String> _times = [];

  @override
  void initState() {
    super.initState();
    _generateDates();
    _generateTimes();
  }

  void _generateDates() {
    DateTime today = DateTime.now();
    _dates = List.generate(30, (index) {
      DateTime date = today.add(Duration(days: index));
      return DateFormat('d MMM').format(date);
    });
  }

  void _generateTimes() {
    _times = [];
    for (int i = 10; i <= 22; i++) {
      String time = DateFormat.jm().format(DateTime(2021, 1, 1, i));
      _times.add(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new,color: kWhiteColor,)),
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded,color: kWhiteColor,)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height /3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: kPrimaryColor
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: width * 0.16,
                      backgroundImage: NetworkImage(widget.doctorImage),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.doctorName,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor),
                    ),
                    Text(
                      widget.doctorSpeciality,
                      style: const TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: kWhiteColor,
                            child: IconButton(
                              onPressed: () {
                                Get.defaultDialog(title: widget.doctorPhone,middleText: 'Feel free to contact me');
                              },
                              icon: const Icon(
                                Icons.call,
                                color: kPrimaryColor,
                                size: 26,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: kWhiteColor,
                            child: IconButton(
                              onPressed: () {
                                Get.snackbar('Coming Soon', 'Video calling features');
                              },
                              icon: const Icon(
                                Icons.video_call,
                                color: kPrimaryColor,
                                size: 26,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: kWhiteColor,
                            child: IconButton(
                              onPressed: () {
                                Get.snackbar('Coming Soon', 'Chatting features');
                              },
                              icon: const Icon(
                                Icons.textsms,
                                color: kPrimaryColor,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left:  10, right: 10,bottom: 30),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'About Doctor',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.doctorBio,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black,fontSize: 16),
                    ),
                  ],
                ),
              ),
              // Booking Date Section
              bookingData(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextButton(
            onPressed: _selectedTimeIndex == -1
                ? null
                : () {
                    // Booking action
                    String selectedDate = _dates[_selectedDateIndex];
                    String selectedTime = _times[_selectedTimeIndex];

                    //Storing data to firebase
                    bookingController.booking(
                      widget.doctorUid,
                      widget.authController.userModel.value.uid!,
                      widget.doctorName,
                      widget.authController.userModel.value.name!,
                      widget.doctorPhone,
                      widget.authController.userModel.value.phone!,
                      selectedDate,
                      selectedTime,
                      widget.doctorCompensation,
                      widget.doctorSpeciality,
                      widget.doctorImage,
                      widget.userImage,
                    );
                  },
            child: const Text(
              'Book Now',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Padding bookingData() {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Date',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _dates.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _selectedDateIndex == index ? kPrimaryColor : kWhiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ChoiceChip(
                              backgroundColor: kWhiteColor,
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.transparent),  // Remove the black border
                              ),
                              selectedColor: kPrimaryColor,
                              checkmarkColor: kWhiteColor,
                              label: Text(_dates[index]),
                              labelStyle: TextStyle(
                                color: _selectedDateIndex == index ? kWhiteColor : kGrayColor,
                                fontSize: 14,
                              ),
                              selected: _selectedDateIndex == index,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedDateIndex = index;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Booking Time Section
                  const Text(
                    'Booking Time',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _times.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _selectedTimeIndex == index ? kPrimaryColor : kWhiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ChoiceChip(
                              backgroundColor: kWhiteColor,
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.transparent),  // Remove the black border
                              ),
                              selectedColor: kPrimaryColor,
                              checkmarkColor: kWhiteColor,
                              label: Text(_times[index]),
                              labelStyle: TextStyle(
                                color: _selectedTimeIndex == index ? kWhiteColor : kGrayColor,
                                fontSize: 14,
                              ),
                              selected: _selectedTimeIndex == index,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedTimeIndex = index;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
  }
}
