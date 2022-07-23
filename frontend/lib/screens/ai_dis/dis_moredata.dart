import 'package:flutter/material.dart';

import '../../widgets/coolText.dart';

class DisMoredata extends StatefulWidget {
  const DisMoredata({Key? key, required this.data, required this.account, required this.user})
      : super(key: key);
  final Map data;
  final String account;
  final String user;

  @override
  _DisMoredataState createState() => _DisMoredataState();
}

class _DisMoredataState extends State<DisMoredata> {
  @override
  Widget build(BuildContext context) {
    List stuff = widget.data['stuff'].split(',');

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
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: stuff.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(stuff[index].toString(), textAlign: TextAlign.center,),
                  );
                },
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
