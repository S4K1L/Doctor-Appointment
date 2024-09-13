import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Controller/auth_controller.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({
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
              padding: const EdgeInsets.only(left: 10, top: 20, right: 20),
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display profile image
                    doctor.profileImage != null && doctor.profileImage!.isNotEmpty
                        ? Image.network(doctor.profileImage!, height: 200, fit: BoxFit.cover)
                        : Image.asset('assets/images/logo.png', height: 200),

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name ?? 'Loading',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            doctor.speciality ?? 'Speciality',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '* ${doctor.rating?.toStringAsFixed(1) ?? '0.0'}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}

