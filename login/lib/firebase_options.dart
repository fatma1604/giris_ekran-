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
    apiKey: 'AIzaSyAN9LOl1K6PMsT22-QetW0zXTOql6a8aHs',
    appId: '1:397154214695:web:dc72885ce8313d7fb43f02',
    messagingSenderId: '397154214695',
    projectId: 'fairbaswork',
    authDomain: 'fairbaswork.firebaseapp.com',
    storageBucket: 'fairbaswork.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABTZlAug9QmXPdGsD7BmcGwftvXLQf5Bk',
    appId: '1:397154214695:android:5413d98799af060fb43f02',
    messagingSenderId: '397154214695',
    projectId: 'fairbaswork',
    storageBucket: 'fairbaswork.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJfcUFcR5NU4quR140zdZ8Wz1XkBbj8Nw',
    appId: '1:397154214695:ios:bce06f6f9c3130b7b43f02',
    messagingSenderId: '397154214695',
    projectId: 'fairbaswork',
    storageBucket: 'fairbaswork.appspot.com',
    androidClientId: '397154214695-n6eq287s943cg38t333jcujijgchnin7.apps.googleusercontent.com',
    iosClientId: '397154214695-371n24aktbhjkflvcgg2b2st0nvuoqdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJfcUFcR5NU4quR140zdZ8Wz1XkBbj8Nw',
    appId: '1:397154214695:ios:2479401a6568286db43f02',
    messagingSenderId: '397154214695',
    projectId: 'fairbaswork',
    storageBucket: 'fairbaswork.appspot.com',
    androidClientId: '397154214695-n6eq287s943cg38t333jcujijgchnin7.apps.googleusercontent.com',
    iosClientId: '397154214695-tsbjucr3frp9p8rm04bkp7du64tpcumn.apps.googleusercontent.com',
    iosBundleId: 'com.example.login.RunnerTests',
  );
}