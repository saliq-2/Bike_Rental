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
        appId: '1:283466351178:android:ca45dd94745ddc44939cb3',
        apiKey: 'AIzaSyBKIa_OroKbFuJp1ecw6bT25s3kTg-544I',
        projectId: 'e-commerce-6455a',
        messagingSenderId: '283466351178',
      );
    }
  }
}