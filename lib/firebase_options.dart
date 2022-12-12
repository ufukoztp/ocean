import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyBzvgJnMj9-L2JvuOxkXx3Tmo9gYbaZtW4",
          authDomain: "ocean-a9abc.firebaseapp.com",
          projectId: "ocean-a9abc",
          storageBucket: "ocean-a9abc.appspot.com",
          messagingSenderId: "436551624019",
          appId: "1:436551624019:web:b763ecad9edad163ef6da6",
          measurementId: "G-CTEM10CSD5"
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:448618578101:ios:0b650370bb29e29cac3efc',
        apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
        iosBundleId: 'io.flutter.plugins.firebasecoreexample',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:448618578101:android:0446912d5f1476b6ac3efc',
        apiKey: 'AIzaSyCuu4tbv9CwwTudNOweMNstzZHIDBhgJxA',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
      );
    }
  }
}
// TODO Implement this library.