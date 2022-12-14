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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBc6d9C87m90XnW_83i852iJ98Lcu-4SPc',
    appId: '1:231235760471:web:b936cb76479430fbacce12',
    messagingSenderId: '231235760471',
    projectId: 'learn-firebase-20221026',
    authDomain: 'learn-firebase-20221026.firebaseapp.com',
    storageBucket: 'learn-firebase-20221026.appspot.com',
    measurementId: 'G-PTY9QEPX47',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTjXA7D-3nufAMm9zL4ZO9rYTDmVrGFxc',
    appId: '1:231235760471:android:b716de3cf22faed9acce12',
    messagingSenderId: '231235760471',
    projectId: 'learn-firebase-20221026',
    storageBucket: 'learn-firebase-20221026.appspot.com',
  );
}
