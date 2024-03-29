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
    apiKey: 'AIzaSyDf0L90LgJ7OwrbOsotyURG9c9dEBbKkcM',
    appId: '1:754068557212:web:fe07a4d85c341b6ec48c59',
    messagingSenderId: '754068557212',
    projectId: 'progra4-upds',
    authDomain: 'progra4-upds.firebaseapp.com',
    databaseURL: 'https://progra4-upds-default-rtdb.firebaseio.com',
    storageBucket: 'progra4-upds.appspot.com',
    measurementId: 'G-RCRWJQN22N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvDeO97QZmcycQQt-Y7KXQjpbj0m5_Qeg',
    appId: '1:754068557212:android:6dd657a0b9b2df11c48c59',
    messagingSenderId: '754068557212',
    projectId: 'progra4-upds',
    databaseURL: 'https://progra4-upds-default-rtdb.firebaseio.com',
    storageBucket: 'progra4-upds.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDswu0rEris78gBhCyzdSc8b7nH6MoRqtc',
    appId: '1:754068557212:ios:8b004aabf040d430c48c59',
    messagingSenderId: '754068557212',
    projectId: 'progra4-upds',
    databaseURL: 'https://progra4-upds-default-rtdb.firebaseio.com',
    storageBucket: 'progra4-upds.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDswu0rEris78gBhCyzdSc8b7nH6MoRqtc',
    appId: '1:754068557212:ios:78217bf95c146eb6c48c59',
    messagingSenderId: '754068557212',
    projectId: 'progra4-upds',
    databaseURL: 'https://progra4-upds-default-rtdb.firebaseio.com',
    storageBucket: 'progra4-upds.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
