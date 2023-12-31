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
    apiKey: 'AIzaSyBhZgxHTD-CGrmGrtFZu_fvJsQadht2Pfw',
    appId: '1:214307528448:web:34e5b70d8406f0eca95de5',
    messagingSenderId: '214307528448',
    projectId: 'shop-app-a30c7',
    authDomain: 'shop-app-a30c7.firebaseapp.com',
    storageBucket: 'shop-app-a30c7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDr9ezc1nPLtx0zbUeDk8YmgHddUmAqvmY',
    appId: '1:214307528448:android:56f5f813010e8e15a95de5',
    messagingSenderId: '214307528448',
    projectId: 'shop-app-a30c7',
    storageBucket: 'shop-app-a30c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANvlaYrztuy5x7ChxPLigYqNeNIhiEro4',
    appId: '1:214307528448:ios:35fffbd88f727042a95de5',
    messagingSenderId: '214307528448',
    projectId: 'shop-app-a30c7',
    storageBucket: 'shop-app-a30c7.appspot.com',
    iosClientId: '214307528448-1njqfcpc635iuml2sf27chdv8og87qje.apps.googleusercontent.com',
    iosBundleId: 'com.example.productShopApi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANvlaYrztuy5x7ChxPLigYqNeNIhiEro4',
    appId: '1:214307528448:ios:35fffbd88f727042a95de5',
    messagingSenderId: '214307528448',
    projectId: 'shop-app-a30c7',
    storageBucket: 'shop-app-a30c7.appspot.com',
    iosClientId: '214307528448-1njqfcpc635iuml2sf27chdv8og87qje.apps.googleusercontent.com',
    iosBundleId: 'com.example.productShopApi',
  );
}
