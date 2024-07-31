// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyAlcvZ8c-twFMMMPPqlDIh67vOUffr6geo',
    appId: '1:701987925530:web:83bbf6759e68fdd20faba3',
    messagingSenderId: '701987925530',
    projectId: 'testapp-27ad7',
    authDomain: 'testapp-27ad7.firebaseapp.com',
    storageBucket: 'testapp-27ad7.appspot.com',
    measurementId: 'G-Y6J88BJDBM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClsSJqa_Ef0uWLdnm5yMrlTWuKz6tz7IU',
    appId: '1:701987925530:android:381b745c03683c910faba3',
    messagingSenderId: '701987925530',
    projectId: 'testapp-27ad7',
    storageBucket: 'testapp-27ad7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD09H3QnraplX-GQj_5Zl4p3GzRO5HpYe4',
    appId: '1:701987925530:ios:005727e35da4acbc0faba3',
    messagingSenderId: '701987925530',
    projectId: 'testapp-27ad7',
    storageBucket: 'testapp-27ad7.appspot.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD09H3QnraplX-GQj_5Zl4p3GzRO5HpYe4',
    appId: '1:701987925530:ios:005727e35da4acbc0faba3',
    messagingSenderId: '701987925530',
    projectId: 'testapp-27ad7',
    storageBucket: 'testapp-27ad7.appspot.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAlcvZ8c-twFMMMPPqlDIh67vOUffr6geo',
    appId: '1:701987925530:web:fb9c8673975d47760faba3',
    messagingSenderId: '701987925530',
    projectId: 'testapp-27ad7',
    authDomain: 'testapp-27ad7.firebaseapp.com',
    storageBucket: 'testapp-27ad7.appspot.com',
    measurementId: 'G-FCTHH149Y5',
  );
}
