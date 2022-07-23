import 'package:flutter/material.dart';

import '../widgets/coolText.dart';
import 'login/Settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 22,
            ),
            coolText(
              text: 'Welcome to ML Helper!',
              fontSize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(2), // Border radius
                child: ClipOval(
                  child: Image.asset(
                    "lib/assets/chat-bot-icon-background-virtual-assistant-vector-24999965.jpg",
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 20,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
              icon: const Icon(Icons.settings),
            ),
            const Spacer(),
            coolText(
                text: "click one of the buttons below to get started",
                fontSize: 12),
          ],
        ),
      ),
    );
  }
}
