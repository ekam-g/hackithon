import 'package:flutter/material.dart';

class DisMoredata extends StatefulWidget {
  const DisMoredata({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  _DisMoredataState createState() => _DisMoredataState();
}

class _DisMoredataState extends State<DisMoredata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Distribution AI"),
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
