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
    apiKey: 'AIzaSyAoiid0hFOZixSdxLwFMYLe6ApiBju4mF8',
    appId: '1:618992762905:web:0f5532b9fc41368af7aa88',
    messagingSenderId: '618992762905',
    projectId: 'flower-app-c2636',
    authDomain: 'flower-app-c2636.firebaseapp.com',
    storageBucket: 'flower-app-c2636.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATkI8XGepx1fYYTi8Thpk5oJvEBj0TLho',
    appId: '1:618992762905:android:ed2dcd2aecbe66c8f7aa88',
    messagingSenderId: '618992762905',
    projectId: 'flower-app-c2636',
    storageBucket: 'flower-app-c2636.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXI2qOPD5l5regYBw7UR9WJy147lyoyzw',
    appId: '1:618992762905:ios:31ddda5414b8d895f7aa88',
    messagingSenderId: '618992762905',
    projectId: 'flower-app-c2636',
    storageBucket: 'flower-app-c2636.appspot.com',
    iosBundleId: 'com.example.eCommernceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXI2qOPD5l5regYBw7UR9WJy147lyoyzw',
    appId: '1:618992762905:ios:f270a6ac46c72e0df7aa88',
    messagingSenderId: '618992762905',
    projectId: 'flower-app-c2636',
    storageBucket: 'flower-app-c2636.appspot.com',
    iosBundleId: 'com.example.eCommernceApp.RunnerTests',
  );
}
