import 'package:flutter/material.dart';

import '../../widgets/coolText.dart';

class DisMoredata extends StatefulWidget {
  const DisMoredata({Key? key, required this.data, required this.account})
      : super(key: key);
  final Map data;
  final String account;

  @override
  _DisMoredataState createState() => _DisMoredataState();
}

class _DisMoredataState extends State<DisMoredata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: coolText(
          text: widget.data['name'],
          fontSize: 20,
        ),
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
