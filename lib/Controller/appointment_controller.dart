import 'package:cloud_firestore/cloud_firestore.dart';
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
          .collection('patient')
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
        } else if (appointment.status == 'Upcoming') {
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
          .collection('patient')
          .where('doctorUid', isEqualTo: uid)
          .get();

      upcoming.clear();
      completed.clear();
      pending.clear();

      // Iterate over the documents returned
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        Appointment appointment = Appointment(
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

  // Method to update status in Firebase
  Future<void> updateAppointmentStatus(String appointmentId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments') // Use the correct collection path
          .doc(appointmentId)
          .update({'status': newStatus});

      Get.snackbar('Success', 'Appointment status updated to $newStatus');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update appointment status: $e');
    }
  }

  // Method to delete doctorUid from patient collection
  Future<void> deleteDoctorFromPatient(String patientId) async {
    try {
      await FirebaseFirestore.instance
          .collection('patients') // Use the correct collection path
          .doc(patientId)
          .update({'doctorUid': FieldValue.delete()});

      Get.snackbar('Success', 'Doctor UID removed from patient record');
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove doctor UID: $e');
    }
  }
}
