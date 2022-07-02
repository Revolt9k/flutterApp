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
    apiKey: 'AIzaSyBa_bMjWSgsYES79NQ6FqI7aue6lIhv02o',
    appId: '1:489403686518:web:9e44765df2d43ab3b40957',
    messagingSenderId: '489403686518',
    projectId: 'sport-e604c',
    authDomain: 'sport-e604c.firebaseapp.com',
    storageBucket: 'sport-e604c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoLRyKVKqJ8Yc7XiH-x5Xspj833M4W9IE',
    appId: '1:489403686518:android:1e102692ae1c2a5cb40957',
    messagingSenderId: '489403686518',
    projectId: 'sport-e604c',
    storageBucket: 'sport-e604c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3M_PjDqqEuC4k6MKO4TWT5ifKB2B-4mI',
    appId: '1:489403686518:ios:d81e86de63859fa1b40957',
    messagingSenderId: '489403686518',
    projectId: 'sport-e604c',
    storageBucket: 'sport-e604c.appspot.com',
    iosClientId: '489403686518-1tmtn4odf1akhca3ve2a0652j7kt2s30.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterHello',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3M_PjDqqEuC4k6MKO4TWT5ifKB2B-4mI',
    appId: '1:489403686518:ios:d81e86de63859fa1b40957',
    messagingSenderId: '489403686518',
    projectId: 'sport-e604c',
    storageBucket: 'sport-e604c.appspot.com',
    iosClientId: '489403686518-1tmtn4odf1akhca3ve2a0652j7kt2s30.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterHello',
  );
}
