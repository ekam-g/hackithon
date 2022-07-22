import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/HomePage.dart';
import 'package:frontend/screens/login/loginChecker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyApAFvVrf4ZPsOwEAo3BYjgF9XDaOKphMk",
            authDomain: "ml-helper-79dd9.firebaseapp.com",
            projectId: "ml-helper-79dd9",
            storageBucket: "ml-helper-79dd9.appspot.com",
            messagingSenderId: "542503428292",
            appId: "1:542503428292:web:fc252bc940450726406991",
            measurementId: "G-5PEJ22PZSB"
        ));
  } on FirebaseException {
    try {
      await Firebase.initializeApp();
    } on FirebaseException {
      throw 'firebase not initialized error';
    }
  }
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ML Helper',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

