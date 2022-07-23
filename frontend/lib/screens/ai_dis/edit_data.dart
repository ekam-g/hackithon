// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  const EditData(
      {Key? key, required this.data, required this.account, required this.user})
      : super(key: key);

  final Map data;
  final String account;
  final String user;

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Data of   " + widget.data['name']),
      ),
      body: Center(
          child: Column(
        children: [
          Container(),
        ],
      )),
    );
  }
}
