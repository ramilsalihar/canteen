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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyC6BjvjUkCsX7Gf5tqNnV4Q-zvjbix-Kpc',
    appId: '1:93268727766:web:973daf08f78dd3dd13b677',
    messagingSenderId: '93268727766',
    projectId: 'canteen-bd08c',
    authDomain: 'canteen-bd08c.firebaseapp.com',
    databaseURL: 'https://canteen-bd08c-default-rtdb.firebaseio.com',
    storageBucket: 'canteen-bd08c.firebasestorage.app',
    measurementId: 'G-TGG8MGJ8M9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX-V3d4LX11u7ZN8eQNxleeyjxdqxmNQI',
    appId: '1:93268727766:android:fec3d5eabe08dd9213b677',
    messagingSenderId: '93268727766',
    projectId: 'canteen-bd08c',
    databaseURL: 'https://canteen-bd08c-default-rtdb.firebaseio.com',
    storageBucket: 'canteen-bd08c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIhWNKXi2-GhPdQDk3W_ukUToZGwEBa98',
    appId: '1:93268727766:ios:cfb0be3110786fd813b677',
    messagingSenderId: '93268727766',
    projectId: 'canteen-bd08c',
    databaseURL: 'https://canteen-bd08c-default-rtdb.firebaseio.com',
    storageBucket: 'canteen-bd08c.firebasestorage.app',
    iosBundleId: 'com.example.canteen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIhWNKXi2-GhPdQDk3W_ukUToZGwEBa98',
    appId: '1:93268727766:ios:cfb0be3110786fd813b677',
    messagingSenderId: '93268727766',
    projectId: 'canteen-bd08c',
    databaseURL: 'https://canteen-bd08c-default-rtdb.firebaseio.com',
    storageBucket: 'canteen-bd08c.firebasestorage.app',
    iosBundleId: 'com.example.canteen',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD8WPqxOBkqBSoAHlMrY6WUV-VweCB-NRU',
    appId: '1:93268727766:web:74efb82a1488915213b677',
    messagingSenderId: '93268727766',
    projectId: 'canteen-bd08c',
    authDomain: 'canteen-bd08c.firebaseapp.com',
    databaseURL: 'https://canteen-bd08c-default-rtdb.firebaseio.com',
    storageBucket: 'canteen-bd08c.firebasestorage.app',
    measurementId: 'G-N4JVZSWP93',
  );
}
