// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDS8ZQFcFIjesBfjcfPTiU5usymEA1t6rQ',
    appId: '1:542429312200:web:d163346e66f735b5f821fd',
    messagingSenderId: '542429312200',
    projectId: 'doctor-appointment-77742',
    authDomain: 'doctor-appointment-77742.firebaseapp.com',
    storageBucket: 'doctor-appointment-77742.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsYrn3m74ecOVbIFIrkvnbo0LCfx8EB7g',
    appId: '1:542429312200:android:106174072c60f16cf821fd',
    messagingSenderId: '542429312200',
    projectId: 'doctor-appointment-77742',
    storageBucket: 'doctor-appointment-77742.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5Y9K79-TJJs1yto0FRzcZVq-BytYnyQ8',
    appId: '1:542429312200:ios:ce2a0996510ccecaf821fd',
    messagingSenderId: '542429312200',
    projectId: 'doctor-appointment-77742',
    storageBucket: 'doctor-appointment-77742.appspot.com',
    iosBundleId: 'com.example.doctorAppointment',
  );
}
