import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/features/onboarding/data/onboarding_data.dart';
import 'package:to_do_app/features/onboarding/widgets/dot_indicator_widget.dart';
import 'package:to_do_app/features/onboarding/widgets/side_button_widget.dart';
import 'package:to_do_app/features/onboarding/widgets/onboarding_item_widget.dart';
import 'package:to_do_app/features/onboarding/widgets/middle_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 96.0),
        child: Column(
          children: [
            /// Onboarding Item Widget
            OnboardingItemWidget(
              controller: _controller,
              onPageChanged: (index) => setState(() => _pageIndex = index),
            ),

            /// Dot indicator
            DotIndicatorWidget(pageIndex: _pageIndex),
            SizedBox(height: 50),

            /// Bottom Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SideButtonWidget(onTap: () {}, isLeft: true),

                MiddleButtonWidget(
                  onSkipPress: () {},
                  isLastPage: (_pageIndex == (onboardingData.length - 1)),
                ),

                SideButtonWidget(onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
