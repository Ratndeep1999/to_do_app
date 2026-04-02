import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/features/onboarding/data/onboarding_data.dart';
import 'package:to_do_app/features/onboarding/widgets/onboarding_item_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 128.0, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingData.length,
                itemBuilder: (ctx, index) {
                  final item = onboardingData[index];

                  /// Title, Description and Icon Widget
                  return OnboardingItemWidget(
                    title: item.title,
                    description: item.desc,
                    iconPath: item.imagePath,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
