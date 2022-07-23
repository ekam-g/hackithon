import 'package:flutter/material.dart';

class DisHomepage extends StatefulWidget {
  const DisHomepage({Key? key}) : super(key: key);

  @override
  _DisHomepageState createState() => _DisHomepageState();
}

class _DisHomepageState extends State<DisHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Distribution"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
