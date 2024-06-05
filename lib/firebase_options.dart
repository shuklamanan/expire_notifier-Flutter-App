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
    apiKey: 'AIzaSyB5RF-s7NSB6stjQqdqGM3XXbauXImdUVY',
    appId: '1:722895189626:web:02c6d3c069cbe5731dadc3',
    messagingSenderId: '722895189626',
    projectId: 'expire-notifier-b08eb',
    authDomain: 'expire-notifier-b08eb.firebaseapp.com',
    storageBucket: 'expire-notifier-b08eb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCI1tJMvmKm8wQxigdf1gFRe56d1IJxVKM',
    appId: '1:722895189626:android:c1d15bf5ab2a6f271dadc3',
    messagingSenderId: '722895189626',
    projectId: 'expire-notifier-b08eb',
    storageBucket: 'expire-notifier-b08eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzLSCh8FoxFJh7GKPftFGaEsuAltNLUwI',
    appId: '1:722895189626:ios:1cde0c86a76aaac21dadc3',
    messagingSenderId: '722895189626',
    projectId: 'expire-notifier-b08eb',
    storageBucket: 'expire-notifier-b08eb.appspot.com',
    iosBundleId: 'com.example.expireNotifier',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzLSCh8FoxFJh7GKPftFGaEsuAltNLUwI',
    appId: '1:722895189626:ios:5760775462f1c38f1dadc3',
    messagingSenderId: '722895189626',
    projectId: 'expire-notifier-b08eb',
    storageBucket: 'expire-notifier-b08eb.appspot.com',
    iosBundleId: 'com.example.expireNotifier.RunnerTests',
  );
}