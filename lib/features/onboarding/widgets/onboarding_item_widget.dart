import 'package:flutter/material.dart';

class OnboardingItemWidget extends StatelessWidget {
  const OnboardingItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
  });

  final String title;
  final String description;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120),

        /// Text
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 60),

        /// Icon
        Image.asset(iconPath, width: 250, height: 250),
        const SizedBox(height: 50),

        /// Description
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
