import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAiegRVpy_HrKPMxneVY6Eeb-ONXe9I46Q",
    appId: '1:311678107405:android:f7f98677ea17e9a5b03a44',
    projectId: "task-6dcbe",
    storageBucket: "task-6dcbe.firebasestorage.app",
    messagingSenderId: "311678107405",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
