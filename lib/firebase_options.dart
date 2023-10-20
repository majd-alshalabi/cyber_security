// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyAbsabU8oWaHL-AXcIhtyR5cOWZtrCAs_M',
    appId: '1:454172766493:web:e0bbc852fdde64621f31f4',
    messagingSenderId: '454172766493',
    projectId: 'cyber-security-59459',
    authDomain: 'cyber-security-59459.firebaseapp.com',
    storageBucket: 'cyber-security-59459.appspot.com',
    measurementId: 'G-SJNVRE1TKW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpSs8Z8vpOVvUntLYHw_OsNQ3fUxRyhoQ',
    appId: '1:454172766493:android:01290000262d73481f31f4',
    messagingSenderId: '454172766493',
    projectId: 'cyber-security-59459',
    storageBucket: 'cyber-security-59459.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAH2R8jArJtWSp0qTRvGAERay4VthKhEMA',
    appId: '1:454172766493:ios:0cd1af999cb599a41f31f4',
    messagingSenderId: '454172766493',
    projectId: 'cyber-security-59459',
    storageBucket: 'cyber-security-59459.appspot.com',
    iosBundleId: 'com.example.cyberSecurity',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAH2R8jArJtWSp0qTRvGAERay4VthKhEMA',
    appId: '1:454172766493:ios:64362b6b670c49991f31f4',
    messagingSenderId: '454172766493',
    projectId: 'cyber-security-59459',
    storageBucket: 'cyber-security-59459.appspot.com',
    iosBundleId: 'com.example.cyberSecurity.RunnerTests',
  );
}