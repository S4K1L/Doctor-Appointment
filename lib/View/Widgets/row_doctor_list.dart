import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/auth_controller.dart';

class RowDoctorList extends StatelessWidget {
  const RowDoctorList({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        // Check if the doctors list is empty
        if (authController.doctors.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Row(
          children: authController.doctors.map((doctor) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 20,bottom: 20),
              child: Container(
                height: 120,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Display profile image
                      doctor.profileImage != null &&
                              doctor.profileImage!.isNotEmpty
                          ? CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(doctor.profileImage!,),
                            )
                          : Image.asset('assets/images/logo.png'),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 25),
                        child: Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name ?? 'Loading',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                maxLines: 2,
                              ),
                              Text(
                                doctor.speciality ?? 'Speciality',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                doctor.bio ?? 'Bio',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
