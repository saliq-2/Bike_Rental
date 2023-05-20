import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:589606575431:ios:2b7429ff8d24fc22d88062',
        apiKey: 'AIzaSyBk0FCZTdWGytcE_y1cztnPPob7edrySwM',
        projectId: 'ecommerce-c399a',
        messagingSenderId: '589606575431	',
        iosBundleId: 'com.example.eCommerceFull',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:589606575431:android:067a077b2ed55db0d88062',
        apiKey: 'AIzaSyCF-AMUBlAJKB3kiImkNsxUyI9KtmNEeEA',
        projectId: 'ecommerce-c399a',
        messagingSenderId: '589606575431',
      );
    }
  }
}