import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Controller/auth_controller.dart';
import '../../../Widgets/row_doctor_list.dart';
import '../Book_Now/book_now.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({
    super.key,
    required this.doctorUid,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.doctorBio,
    required this.doctorHospital,
    required this.doctorAddress,
    required this.doctorPhone,
    required this.doctorCompensation,
    required this.doctorImage,
    required this.userImage,
    required this.authController,
  });

  final AuthController authController;
  final String doctorUid;
  final String doctorName;
  final String doctorSpeciality;
  final String doctorBio;
  final String doctorHospital;
  final String doctorAddress;
  final String doctorPhone;
  final String doctorCompensation;
  final String doctorImage;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  color: kPrimaryColor),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 20),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: kWhiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.more_vert_rounded,
                          color: kWhiteColor,
                        )
                      ],
                    ),
                  ),
                  doctorImage.isNotEmpty
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(doctorImage), // Placeholder image
                        )
                      : const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'), // Placeholder image
                        ),
                  const SizedBox(height: 10),
                  Text(
                    doctorName,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor),
                  ),
                  Text(
                    doctorSpeciality,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor),
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
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
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'About Doctor',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                    ),
                    Text(
                      doctorBio,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Doctor List',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    RowDoctorList(authController: authController),
                    const SizedBox(height: 20),
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            child: Icon(
                              Icons.add_location_sharp,
                              color: kPrimaryColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctorHospital,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  doctorAddress,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Consultation Fee',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '\$$doctorCompensation',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kPrimaryColor),
                child: TextButton(
                    onPressed: () {
                      Get.to(
                        () => BookingPage(
                          authController: authController,
                          doctorName: doctorName,
                          doctorSpeciality: doctorSpeciality,
                          doctorBio: doctorBio,
                          doctorUid: doctorUid,
                          doctorPhone: doctorPhone,
                          doctorCompensation: doctorCompensation,
                          doctorImage: doctorImage,
                          userImage: userImage,
                        ),
                      );
                    },
                    child: const Text(
                      'Book Appointment',
                      style: TextStyle(color: kWhiteColor, fontSize: 16),
                    )))
          ],
        ),
      ),
    );
  }
}
