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
    apiKey: 'AIzaSyA6wpxqQBAXfoVVfadIve9w2u_QssFgOc4',
    appId: '1:980227870391:web:7797d45cccaab0b65f0732',
    messagingSenderId: '980227870391',
    projectId: 'admob-b25a0',
    authDomain: 'admob-b25a0.firebaseapp.com',
    storageBucket: 'admob-b25a0.appspot.com',
    measurementId: 'G-9NCDHLB44X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkFEPj0GL18fMZ_yKH0a1vpNaO9tD9Jec',
    appId: '1:980227870391:android:5a9bfdea080177925f0732',
    messagingSenderId: '980227870391',
    projectId: 'admob-b25a0',
    storageBucket: 'admob-b25a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7mOSWLRu8z7q3a-voTSgKbRBdR8elB90',
    appId: '1:980227870391:ios:c481f162917aecc05f0732',
    messagingSenderId: '980227870391',
    projectId: 'admob-b25a0',
    storageBucket: 'admob-b25a0.appspot.com',
    iosBundleId: 'com.example.admob',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7mOSWLRu8z7q3a-voTSgKbRBdR8elB90',
    appId: '1:980227870391:ios:7237cb5a44793af25f0732',
    messagingSenderId: '980227870391',
    projectId: 'admob-b25a0',
    storageBucket: 'admob-b25a0.appspot.com',
    iosBundleId: 'com.example.admob.RunnerTests',
  );
}