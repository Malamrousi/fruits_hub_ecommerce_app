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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDyRjvrKdbgSNtlu_m17AL8RbxM2A47vkI',
    appId: '1:498943662506:android:7be53aee10a09c342ff3d3',
    messagingSenderId: '498943662506',
    projectId: 'to-do-app-fb735',
    storageBucket: 'to-do-app-fb735.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZHUkwrY1KCB1Tz-y62zIApX_NQCc3XXo',
    appId: '1:498943662506:ios:5468e5e21f6721f52ff3d3',
    messagingSenderId: '498943662506',
    projectId: 'to-do-app-fb735',
    storageBucket: 'to-do-app-fb735.appspot.com',
    androidClientId: '498943662506-l4rc96f04e1sinilv621prcr2nk6rsgr.apps.googleusercontent.com',
    iosClientId: '498943662506-qbu6d40eqvpko0ptcc0sgva56fj7c82l.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitHub',
  );
}
