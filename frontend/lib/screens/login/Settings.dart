import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/ClearAppbar.dart';
import '../../widgets/coolButtion.dart';
import '../../widgets/coolText.dart';
import 'loginNew.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  String pref = "loading";

  @override
  void initState() {
    perf();
    super.initState();
  }

  perf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pref = prefs.getString('deleteAll') ?? "teacher";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: clearAppBar(
          text: '',
          fontSize: 2,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            coolText(
              text: 'Settings',
              fontSize: 50,
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: coolText(
                text: 'You are currently logged in as a $pref',
                fontSize: 15,
              ),
            ),
            const Spacer(),
            SizedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.setString('deleteAll', '');
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => loginFirestore()));
                },
                text: 'Sign Out',
                fontSize: 12,
                height: 75,
                width: 100),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}