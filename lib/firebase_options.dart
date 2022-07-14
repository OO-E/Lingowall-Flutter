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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1Rrd7SVqI3GF6GEw88i1vr05uirpDjwg',
    appId: '1:68172250851:android:c47f1358d69794b8d34fd6',
    messagingSenderId: '68172250851',
    projectId: 'lingowall-d854c',
    storageBucket: 'lingowall-d854c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD48hpyORprc0KZXQffQYKiQbQ8zMIB9wE',
    appId: '1:68172250851:ios:6b86a8c2da3d3212d34fd6',
    messagingSenderId: '68172250851',
    projectId: 'lingowall-d854c',
    storageBucket: 'lingowall-d854c.appspot.com',
    iosClientId: '68172250851-guve0j38h1g5ooolqa3rpk3k0ree7fmr.apps.googleusercontent.com',
    iosBundleId: 'com.example.lingowall',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD48hpyORprc0KZXQffQYKiQbQ8zMIB9wE',
    appId: '1:68172250851:ios:bd2a35a52aa4ea78d34fd6',
    messagingSenderId: '68172250851',
    projectId: 'lingowall-d854c',
    storageBucket: 'lingowall-d854c.appspot.com',
    iosClientId: '68172250851-5oakfuqq9fr8fggfaaeo63a4ep3ihil1.apps.googleusercontent.com',
    iosBundleId: 'com.example.lingowallMac',
  );
}
