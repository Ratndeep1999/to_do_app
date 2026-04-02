import 'package:flutter/material.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    super.key,
    required this.onSkipPress,
    required this.isLast,
  });

  final VoidCallback onSkipPress;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 460),
      curve: Curves.easeInOut,
      child: FilledButton(
        onPressed: onSkipPress,
        style: FilledButton.styleFrom(backgroundColor: Colors.black45),
        child: Text(isLast ? "Get Started" : "Next"),
      ),
    );
  }
}
