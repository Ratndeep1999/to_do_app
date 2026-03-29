import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onButtonPress,
    required this.label,
  });

  final VoidCallback onButtonPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onButtonPress, child: Text(label));
  }
}
