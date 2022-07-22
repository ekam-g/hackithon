import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../backround.dart';
import '../../widgets/coolText.dart';
import 'loginNew.dart';

///Used to determine which screen to show based on whether the user has already signed in
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

PushData(String push) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('deleteAll', push);
}

checkLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int amount = prefs.getInt('yes') ?? 0;

  if (amount == 10) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection("permissions")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((data) async {
      if (data['perm'] == "remove") {
        await FirebaseAuth.instance.signOut();
        return loginFirestore();
      }
      PushData(data['perm']);
    });
  } else {
    if (amount > 10) {
      await prefs.setInt('yes', 0);
    } else {
      await prefs.setInt('yes', amount += 1);
    }
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              children: [
                coolText(text: "Checking Login", fontSize: 10),
                const CircularProgressIndicator(),
              ],
            ),
          );
        } else {
          if (snapshot.hasData) {
            checkLogin();
            return navbar();
          } else {
            return loginFirestore();
          }
        }
      },
    ));
  }
}
