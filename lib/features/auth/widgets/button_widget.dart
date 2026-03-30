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
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: onButtonPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          elevation: 4.0,
          shadowColor: Colors.black,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
