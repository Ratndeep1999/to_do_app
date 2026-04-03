import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/services/shared_pref_service.dart';
import 'package:to_do_app/features/auth/screens/sign_in_screen.dart';
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
                SideButtonWidget(onTap: () => onSideButton(true), isLeft: true),

                MiddleButtonWidget(
                  onSkipPress: () =>
                      onMiddleButton(_pageIndex == (onboardingData.length - 1)),
                  isLastPage: (_pageIndex == (onboardingData.length - 1)),
                ),

                SideButtonWidget(onTap: () => onSideButton(false)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  void onSideButton(bool isLeftButton) {
    if (isLeftButton) {
      _controller.previousPage(
        duration: Duration(milliseconds: 460),
        curve: Curves.easeInOut,
      );
      return;
    }
    _controller.nextPage(
      duration: Duration(milliseconds: 460),
      curve: Curves.easeInOut,
    );
  }

  ///
  Future<void> onMiddleButton(bool? isLastPage) async {
    if (isLastPage ?? false) {
      replaceOnboarding();
      return;
    }
    _controller.animateToPage(
      onboardingData.length,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  Future<void> replaceOnboarding() async {
    await SharedPrefService().setOnboardingStatus();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (ctx) => SignInScreen()));
  }
}
