import 'package:doctor_appointment/Controller/appointment_controller.dart';
import 'package:doctor_appointment/Model/appointment_model.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorRequest extends StatelessWidget {
  DoctorRequest({super.key});
  final AppointmentController appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    // Fetch appointments when the screen is built
    appointmentController.fetchRequest();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Patient"),
      ),
      body: Column(
        children: [
          // Top tab buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabButton("Pending", 0),
                  _buildTabButton("Upcoming", 1),
                  _buildTabButton("Completed", 2),
                ],
              ),
            ),
          ),
          // Display the corresponding list of appointments
          Expanded(
            child: Obx(() {
              var appointments = _getAppointments();
              if (appointments.isEmpty) {
                return const Center(child: Text("No Request Available"));
              }
              return ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  var appointment = appointments[index];
                  return _buildAppointmentTile(
                    compensation: appointment.doctorCompensation,
                    userName: appointment.userName,
                    userImage: appointment.userImage,
                    userPhone: appointment.userPhone,
                    date: appointment.bookingDate,
                    time: appointment.bookingTime,
                    status: appointment.status,
                    appointmentId: appointment.bookingUid,
                    context: context,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // Method to build top tab buttons
  Widget _buildTabButton(String label, int index) {
    return Obx(() {
      return Container(
        height: MediaQuery.of(Get.context!).size.height / 6,
        width: MediaQuery.of(Get.context!).size.width / 3.2,
        color: Colors.grey[300],
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: appointmentController.selectedTabIndex.value == index
                ? Colors.white
                : Colors.black,
            backgroundColor: appointmentController.selectedTabIndex.value == index
                ? Colors.red
                : Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            appointmentController.selectedTabIndex.value = index;
          },
          child: Text(label),
        ),
      );
    });
  }

  // Method to get current appointments based on selected tab
  List<Appointment> _getAppointments() {
    switch (appointmentController.selectedTabIndex.value) {
      case 0:
        return appointmentController.pending;
      case 1:
        return appointmentController.upcoming;
      case 2:
        return appointmentController.completed;
      default:
        return [];
    }
  }

  Widget _buildAppointmentTile({
    required String userName,
    required String compensation,
    required String userImage,
    required String userPhone,
    required String date,
    required String time,
    required String status,
    required String appointmentId,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "About Patient",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userImage),
                    radius: 30,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userPhone),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '\$$compensation',
                        style: const TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(date),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(time),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 12, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(status),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      appointmentController.cancelAppointment(appointmentId);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      appointmentController.showStatusMenu(context, appointmentId, status);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Status',
                      style: TextStyle(color: kWhiteColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
