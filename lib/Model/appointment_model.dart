class Appointment {
  final String doctorName;
  final String userName;
  final String doctorPhone;
  final String userPhone;
  final String doctorSpeciality;
  final String doctorImage;
  final String userImage;
  final String doctorCompensation;
  final String bookingDate;
  final String bookingTime;
  final String status;
  final String bookingUid;

  Appointment({
    required this.doctorName,
    required this.userName,
    required this.doctorPhone,
    required this.userPhone,
    required this.doctorSpeciality,
    required this.doctorImage,
    required this.userImage,
    required this.doctorCompensation,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,
    required this.bookingUid,
  });

  // Factory constructor to create an Appointment object from Firestore document data
  factory Appointment.fromMap(Map<String, dynamic> data) {
    return Appointment(
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
  }

  // Convert Appointment object to a Map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'doctorName': doctorName,
      'userName': userName,
      'doctorPhone': doctorPhone,
      'userPhone': userPhone,
      'doctorSpeciality': doctorSpeciality,
      'doctorImage': doctorImage,
      'userImage': userImage,
      'doctorCompensation': doctorCompensation,
      'bookingDate': bookingDate,
      'bookingTime': bookingTime,
      'status': status,
    };
  }
}

