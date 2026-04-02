import 'package:flutter/material.dart';
import 'package:to_do_app/features/onboarding/data/onboarding_data.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key, required int pageIndex})
    : _pageIndex = pageIndex;

  final int _pageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// Indicator Background
        AnimatedContainer(
          duration: Duration(milliseconds: 460),
          curve: Curves.easeInOut,
          height: 20,
          width: 20 * (_pageIndex + 1),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),

        /// Dots
        SizedBox(
          height: 20,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(onboardingData.length, (int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: (index <= _pageIndex)
                      ? Colors.white
                      : Colors.black,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
