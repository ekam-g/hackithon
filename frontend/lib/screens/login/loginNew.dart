import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../widgets/coolButtion.dart';
import '../../widgets/coolText.dart';

class loginFirestore extends StatefulWidget {
  loginFirestore({
    Key? key,
  }) : super(key: key);

  @override
  _loginFirestore createState() => _loginFirestore();
}

class _loginFirestore extends State<loginFirestore> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final UserName = TextEditingController();
    final Password = TextEditingController();

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        coolText(
          text: "Login",
          fontSize: 40,
        ),
        const Spacer(
          flex: 2,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: UserName,
              obscureText: false,
              style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            )),
        const Spacer(
          flex: 1,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: Password,
              obscureText: true,
              style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            )),
        const Spacer(
          flex: 2,
        ),
        ExpandedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              if (UserName.text.isEmpty || Password.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please fill all fields"),
                  ),
                );
              } else {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: UserName.text, password: Password.text)
                    .then((value) {
                  final firestoreInstance = FirebaseFirestore.instance;

                  firestoreInstance
                      .collection("permissions")
                      .doc(value.user?.email)
                      .get()
                      .then((data) async {
                    await prefs.setString('deleteAll', data['perm']);
                  });
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MyApp()));
                }).catchError((error) {
                  const SnackBar(
                    content: Text("Please fill all fields"),
                  );
                });
              }
            },
            text: "Login",
            flex: 2,
            fontSize: 15,
            width: 200),
        const Spacer(
          flex: 4,
        ),
      ],
    )));
  }
}
