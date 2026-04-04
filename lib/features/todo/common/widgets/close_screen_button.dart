import 'package:flutter/material.dart';

class CloseScreenButton extends StatelessWidget {
  const CloseScreenButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(ctx) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Icon(Icons.close, weight: 20.0, size: 25),
    );
  }
}
