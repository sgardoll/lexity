import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyB-tARRayH8VPeEYIlAzhg2k6Vcwp_9vCs",
        authDomain: "rise-and-build-ship-3r4evm.firebaseapp.com",
        projectId: "rise-and-build-ship-3r4evm",
        storageBucket: "rise-and-build-ship-3r4evm.firebasestorage.app",
        messagingSenderId: "66788777511",
        appId: "1:66788777511:web:ece286619d07c61ef33802",
        measurementId: "G-S3Q6R887CL",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
}
