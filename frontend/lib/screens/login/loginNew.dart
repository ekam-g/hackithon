import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../backround.dart';
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
  final UserName = TextEditingController();
  final Password = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
            width: 300,
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
        SizedBox(
            width: 300,
            child: TextField(
                controller: Password,
                obscureText: _passwordVisible,
                style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )))),
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
                try {
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
                    if (mounted) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => navbar()));
                    }
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Error " + error.toString(),
                    )));
                  });
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error " + error.toString()),
                  ));
                }
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
