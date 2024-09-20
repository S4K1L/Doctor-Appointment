import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/appointment_model.dart';

class AppointmentController extends GetxController {
  // Lists to store appointments
  RxList<Appointment> upcoming = <Appointment>[].obs;
  RxList<Appointment> completed = <Appointment>[].obs;
  RxList<Appointment> pending = <Appointment>[].obs;

  RxInt selectedTabIndex = 0.obs;

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // FirebaseAuth instance for accessing user details
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fetch appointments from Firestore
  Future<void> fetchAppointments() async {
    try {
      String uid = _auth.currentUser!.uid;
      QuerySnapshot querySnapshot = await _firestore
          .collection('appointments')
          .where('userUid', isEqualTo: uid)
          .get();

      upcoming.clear();
      completed.clear();
      pending.clear();

      // Iterate over the documents returned
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        Appointment appointment = Appointment(
          doctorName: data['doctorName'] ?? '',
          bookingUid: data['bookingUid'] ?? '',
          userName: data['userName'] ?? '',
          doctorPhone: data['doctorPhone'] ?? '',
          userPhone: data['userPhone'] ?? '',
          doctorSpeciality: data['doctorSpeciality'] ?? '',
          doctorImage: data['doctorImage'] ?? '',
          userImage: data['userImage'] ?? '',
          doctorCompensation: data['doctorCompensation'] ?? '',
          bookingDate: data['bookingDate'] ?? '',
          bookingTime: data['bookingTime'] ?? '',
          status: data['status'] ?? '',
        );

        // Sort appointments into appropriate lists based on their status
        if (appointment.status == 'Pending') {
          pending.add(appointment);
        } else if (appointment.status == 'Confirmed') {
          upcoming.add(appointment);
        } else if (appointment.status == 'Completed') {
          completed.add(appointment);
        }
      }
    } catch (e) {
      print("Error fetching appointments: $e");
      Get.snackbar("Error", "Failed to fetch appointments: $e");
    }
  }

  Future<void> fetchRequest() async {
    try {
      String uid = _auth.currentUser!.uid;
      QuerySnapshot querySnapshot = await _firestore
          .collection('appointments')
          .where('doctorUid', isEqualTo: uid)
          .get();

      upcoming.clear();
      completed.clear();
      pending.clear();

      // Iterate over the documents returned
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        Appointment appointment = Appointment(
          bookingUid: data['bookingUid'] ?? '',
          doctorName: data['doctorName'] ?? '',
          userName: data['userName'] ?? '',
          doctorPhone: data['doctorPhone'] ?? '',
          userPhone: data['userPhone'] ?? '',
          doctorSpeciality: data['doctorSpeciality'] ?? '',
          doctorImage: data['doctorImage'] ?? '',
          userImage: data['userImage'] ?? '',
          doctorCompensation: data['doctorCompensation'] ?? '',
          bookingDate: data['bookingDate'] ?? '',
          bookingTime: data['bookingTime'] ?? '',
          status: data['status'] ?? '',
        );

        // Sort appointments into appropriate lists based on their status
        if (appointment.status == 'Pending') {
          pending.add(appointment);
        }
        else if (appointment.status == 'Confirmed') {
          upcoming.add(appointment);
        } else if (appointment.status == 'Completed') {
          completed.add(appointment);
        }
      }
    } catch (e) {
      print("Error fetching appointments: $e");
      Get.snackbar("Error", "Failed to fetch appointments: $e");
    }
  }

  // Function to show the Cupertino dropdown menu for selecting status
  void showStatusMenu(BuildContext context, String appointmentId, String currentStatus) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select Appointment Status',style: TextStyle(color: kPrimaryColor),),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              updateAppointmentStatus(context, appointmentId, 'Pending');
            },
            child: const Text('Pending',style: TextStyle(color: kPrimaryColor),),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              updateAppointmentStatus(context, appointmentId, 'Confirmed');
            },
            child: const Text('Confirmed',style: TextStyle(color: kPrimaryColor),),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              updateAppointmentStatus(context, appointmentId, 'Completed');
            },
            child: const Text('Completed',style: TextStyle(color: kPrimaryColor),),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel',style: TextStyle(color: kPrimaryColor),),
        ),
      ),
    );
  }


  // Method to update status in Firebase
  Future<void> updateAppointmentStatus(BuildContext context, String appointmentId, String newStatus) async {
    Navigator.pop(context); // Close the CupertinoActionSheet after selection
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentId)
          .update({'status': newStatus});

      Get.snackbar('Success', 'Appointment status updated to $newStatus');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update appointment status: $e');
    }
  }

  // Method to delete doctorUid from appointments collection
  Future<void> deleteDoctorFromPatient(String appointmentsId) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments') // Use the correct collection path
          .doc(appointmentsId)
          .update({'doctorUid': FieldValue.delete()});

      Get.snackbar('Success', 'Doctor UID removed from appointments record');
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove doctor UID: $e');
    }
  }

  // Cancel appointment
  Future<void> cancelAppointment(String appointmentId) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).delete();
      // Remove the canceled appointment from the list locally
      pending.removeWhere((appointment) => appointment.bookingUid == appointmentId);
      upcoming.removeWhere((appointment) => appointment.bookingUid == appointmentId);
      Get.snackbar("Success", "Appointment canceled successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to cancel the appointment: $e");
    }
  }

  // Reschedule appointment
  Future<void> rescheduleAppointment(
      String appointmentId,
      DateTime newDate,
      TimeOfDay newTime,
      ) async {
    try {
      // Format the new date as a string (e.g., "dd/MM/yyyy")
      String formattedDate = '${newDate.day.toString().padLeft(2, '0')}/'
          '${newDate.month.toString().padLeft(2, '0')}/'
          '${newDate.year}';

      // Format the new time as a string (e.g., "HH:mm")
      String formattedTime = '${newTime.hour.toString().padLeft(2, '0')}:'
          '${newTime.minute.toString().padLeft(2, '0')}';

      // Update Firestore with the new date and time as strings
      await _firestore.collection('appointments').doc(appointmentId).update({
        'bookingDate': formattedDate, // Store the formatted date string
        'bookingTime': formattedTime, // Store the formatted time string
      });

      // Success message
      Get.snackbar('Success', 'Appointment has been rescheduled successfully');
    } catch (e) {
      // Error handling
      Get.snackbar('Error', 'Failed to reschedule: $e');
    }
  }


}
