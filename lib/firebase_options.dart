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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCM_szD15IanWctbpWY3iHay6tVn3CWh8g',
    appId: '1:86176070341:web:0b356ecfa7cb00c9dcceac',
    messagingSenderId: '86176070341',
    projectId: 'galleon-advisors',
    authDomain: 'galleon-advisors.firebaseapp.com',
    storageBucket: 'galleon-advisors.appspot.com',
    measurementId: 'G-8WP95DXBRF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRFIYRMhu3yNVzlmDOk-M03n2QSGJgK68',
    appId: '1:86176070341:android:59daa639235a9e6edcceac',
    messagingSenderId: '86176070341',
    projectId: 'galleon-advisors',
    storageBucket: 'galleon-advisors.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDnC0brh_Tx0I9g8-V8ZQKao1K3SdH8Hk',
    appId: '1:86176070341:ios:dddd646b71867252dcceac',
    messagingSenderId: '86176070341',
    projectId: 'galleon-advisors',
    storageBucket: 'galleon-advisors.appspot.com',
    iosBundleId: 'com.galleon.app.galleonApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCM_szD15IanWctbpWY3iHay6tVn3CWh8g',
    appId: '1:86176070341:web:a6b3924ba5a38024dcceac',
    messagingSenderId: '86176070341',
    projectId: 'galleon-advisors',
    authDomain: 'galleon-advisors.firebaseapp.com',
    storageBucket: 'galleon-advisors.appspot.com',
    measurementId: 'G-37GB4DJ95X',
  );
}
