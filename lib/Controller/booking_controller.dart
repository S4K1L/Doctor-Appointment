import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> booking(
      String doctorUid,
      String userUid,
      String doctorName,
      String userName,
      String doctorPhone,
      String userPhone,
      String bookingDate,
      String bookingTime,
      String doctorCompensation,
      String doctorSpeciality,
      String doctorImage,
      String userImage,
      ) async {
    try {
      // Creating a document reference
      DocumentReference docRef = _firestore.collection('appointments').doc();

      // Data to be uploaded to Firestore, including the document ID (booking UID)
      Map<String, dynamic> bookingData = {
        'bookingUid': docRef.id, // Include the generated document ID
        'doctorUid': doctorUid,
        'userUid': userUid,
        'doctorName': doctorName,
        'userName': userName,
        'doctorPhone': doctorPhone,
        'userPhone': userPhone,
        'bookingDate': bookingDate,
        'bookingTime': bookingTime,
        'doctorCompensation': doctorCompensation,
        'doctorSpeciality': doctorSpeciality,
        'doctorImage': doctorImage,
        'userImage': userImage,
        'status': 'Pending',
        'createdAt': FieldValue.serverTimestamp(),
      };

      // Upload the data to Firestore
      await docRef.set(bookingData);

      // Success message
      Get.snackbar('Success', 'Booking has been made successfully');
    } catch (e) {
      // Error handling
      Get.snackbar('Error', 'Failed to book: $e');
    }
  }
}
