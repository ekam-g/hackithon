import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class coolText extends StatelessWidget {
  coolText({
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fontSize, fontFamily: 'Poppins'),
    );
  }
}
