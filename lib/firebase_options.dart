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
    apiKey: 'AIzaSyDmqghWeH8D5hXUZ5L3Ing56cWWnGX2lLs',
    appId: '1:319119188350:web:0866b4d2301f5024a2d32f',
    messagingSenderId: '319119188350',
    projectId: 'snapxt-hybrid',
    authDomain: 'snapxt-hybrid.firebaseapp.com',
    storageBucket: 'snapxt-hybrid.appspot.com',
    measurementId: 'G-MZ12KGX9CK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEH2scAZjsDmh3hMH8iA5SmCDdZRu2cUI',
    appId: '1:319119188350:android:95fe1abf5a40870fa2d32f',
    messagingSenderId: '319119188350',
    projectId: 'snapxt-hybrid',
    storageBucket: 'snapxt-hybrid.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1SFS3GChQmYl-yvlVhk4-ItdEtTR-0_o',
    appId: '1:319119188350:ios:922144ad5ebd9f27a2d32f',
    messagingSenderId: '319119188350',
    projectId: 'snapxt-hybrid',
    storageBucket: 'snapxt-hybrid.appspot.com',
    iosClientId: '319119188350-6lctqps7642v95e4n75ln0bargsec0f0.apps.googleusercontent.com',
    iosBundleId: 'com.certify.snaphybrid.snaphybrid',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1SFS3GChQmYl-yvlVhk4-ItdEtTR-0_o',
    appId: '1:319119188350:ios:922144ad5ebd9f27a2d32f',
    messagingSenderId: '319119188350',
    projectId: 'snapxt-hybrid',
    storageBucket: 'snapxt-hybrid.appspot.com',
    iosClientId: '319119188350-6lctqps7642v95e4n75ln0bargsec0f0.apps.googleusercontent.com',
    iosBundleId: 'com.certify.snaphybrid.snaphybrid',
  );
}