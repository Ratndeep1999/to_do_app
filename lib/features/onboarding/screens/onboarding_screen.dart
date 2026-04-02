import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/utils/constants/app_icons.dart';
import 'package:to_do_app/core/utils/constants/app_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
      body: SafeArea(
        top: false,
        minimum: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 100),

            /// Text
            Text(
              AppStrings.kOnboardingTitle1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 80),

            /// Icon
            Image.asset(AppIcons.kOnboardingIcon1, width: 250, height: 250),
            const SizedBox(height: 50),

            /// Description
            Text(
              AppStrings.kOnboardingDesc1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
