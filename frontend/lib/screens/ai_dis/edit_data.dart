// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:frontend/widgets/coolText.dart';

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
              text: "Old data is \n\n" + widget.data['stuff'], fontSize: 20),
          const Spacer(),
          Expanded(
            flex: 10,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "New data",
              ),
            ),
          ),
          const Spacer(
            flex: 10,
          ),
        ],
      )),
    );
  }
}
