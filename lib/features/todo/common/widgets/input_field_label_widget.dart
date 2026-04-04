import 'package:flutter/material.dart';

class InputFieldLabelWidget extends StatelessWidget {
  final String text;

  const InputFieldLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.bold));
  }
}
