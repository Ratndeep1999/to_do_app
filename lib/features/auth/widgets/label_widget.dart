import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(ctx) {
    return Padding(
      padding: const EdgeInsets.only(right: 55),

      /// Label
      child: Text(
        label,
        style: TextStyle(
          fontSize: 65,
          fontWeight: FontWeight.w600,
          color: Colors.black45,
        ),
      ),
    );
  }
}
