// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/coolText.dart';

import '../../widgets/coolButtion.dart';

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
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Data of " + widget.data['name']),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(),
          coolText(
              text: "Old data is \n\n" +
                  widget.data['stuff'] +
                  "\n\n"
                      "Please Use Commas to separate the data",
              fontSize: 15),
          const Spacer(),
          Expanded(
            flex: 5,
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "New data",
                ),
              ),
            ),
          ),
          const Spacer(),
          ExpandedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("stuff")
                  .doc(widget.account)
                  .update({
                widget.user: {
                  "name": widget.data['name'],
                  "stuff": controller.text
                },
              });
              Navigator.pop(context);
            },
            width: 200,
            flex: 3,
            text: 'Send',
            fontSize: 12,
          ),
          const Spacer(
            flex: 10,
          ),
        ],
      )),
    );
  }
}
