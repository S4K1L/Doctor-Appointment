import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/auth_controller.dart';
import '../Pages/Home/Book_Appointment/book_appointment.dart';

class DoctorList extends StatelessWidget {
  final AuthController authController;
  final String selectedSymptom;
  final String searchQuery;

  const DoctorList({
    super.key,
    required this.authController,
    required this.selectedSymptom,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        if (authController.doctors.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        final filteredDoctors = authController.doctors.where((doctor) {
          final matchesSymptom = selectedSymptom.isEmpty ||
              (doctor.speciality != null &&
                  doctor.speciality!.toLowerCase() ==
                      selectedSymptom.toLowerCase());

          final matchesSearchQuery = searchQuery.isEmpty ||
              (doctor.name != null &&
                      doctor.name!
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                  doctor.speciality!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  doctor.hospital!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  doctor.address!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  doctor.compensation!.toLowerCase().contains(searchQuery.toLowerCase())
              );

          return matchesSymptom && matchesSearchQuery;
        }).toList();

        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 20, bottom: 20),
          child: Row(
            children: filteredDoctors.map((doctor) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                // 20 width gap between items
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => BookAppointment(
                        doctorUid: doctor.uid ?? '',
                        authController: authController,
                        doctorName: doctor.name ?? '',
                        doctorSpeciality: doctor.speciality ?? '',
                        doctorPhone: doctor.phone ?? '',
                        doctorBio: doctor.bio ?? '',
                        doctorCompensation: doctor.compensation ?? '',
                        doctorAddress: doctor.address ?? '',
                        doctorHospital: doctor.hospital ?? '',
                        doctorImage: doctor.profileImage ?? '',
                        userImage: authController.userModel.value.profileImage ?? '',
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.2,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        doctor.profileImage != null &&
                                doctor.profileImage!.isNotEmpty
                            ? Image.network(
                                doctor.profileImage!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset('assets/images/logo.png'),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name ?? 'Loading',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                doctor.speciality ?? 'Speciality',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                doctor.bio ?? 'Bio',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
