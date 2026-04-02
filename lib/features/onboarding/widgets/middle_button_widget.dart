import 'package:flutter/material.dart';

class MiddleButtonWidget extends StatelessWidget {
  const MiddleButtonWidget({
    super.key,
    required this.onSkipPress,
    required this.isLastPage,
  });

  final VoidCallback onSkipPress;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 460),
      curve: Curves.easeInOut,
      child: FilledButton(
        onPressed: onSkipPress,
        style: FilledButton.styleFrom(backgroundColor: Colors.black45),
        child: Text(isLastPage ? "Get Started" : "Skip"),
      ),
    );
  }
}
