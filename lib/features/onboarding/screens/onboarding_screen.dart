import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/utils/constants/app_icons.dart';
import 'package:to_do_app/core/utils/constants/app_strings.dart';
import 'package:to_do_app/features/onboarding/data/onboarding_data.dart';

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
        child: PageView.builder(
          itemCount: onboardingData.length,
          itemBuilder: (ctx, index) {
            final item = onboardingData[index];
            return Column(
              children: [
                SizedBox(height: 120),

                /// Text
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 60),

                /// Icon
                Image.asset(item.imagePath, width: 250, height: 250),
                const SizedBox(height: 50),

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
      ),
    );
  }
}
