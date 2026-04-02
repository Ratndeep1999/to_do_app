import 'package:flutter/material.dart';
import 'package:to_do_app/features/onboarding/data/onboarding_data.dart';

class OnboardingItemWidget extends StatelessWidget {
  const OnboardingItemWidget({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  final PageController controller;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: onboardingData.length,
        controller: controller,
        onPageChanged: onPageChanged,
        itemBuilder: (ctx, index) {
          final item = onboardingData[index];

          /// Onboarding Items Widget
          return Column(
            children: [
              /// Text
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 60),

              /// Icon
              Image.asset(item.imagePath, width: 250, height: 250),
              const SizedBox(height: 40),

              /// Description
              Text(
                item.desc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          );
        },
      ),
    );
  }
}
