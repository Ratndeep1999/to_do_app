import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/features/onboarding/widgets/dot_indicator_widget.dart';
import 'package:to_do_app/features/onboarding/widgets/onboarding_item_widget.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
        child: Column(
          children: [
            /// Onboarding Item Widget
            OnboardingItemWidget(
              controller: _controller,
              onPageChanged: (index) => setState(() => _pageIndex = index),
            ),
            SizedBox(height: 20),

            /// Dot indicator
            DotIndicatorWidget(pageIndex: _pageIndex),

            /// Bottom Section
            Row(
              children: [
                /// Left Button
                InkWell(
                  onTap: () {},
                  splashColor: Colors.white,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Transform.rotate(
                        angle: 1,
                        child: Icon(Icons.play_arrow, size: 30),
                      ),
                    ),
                  ),
                ),

                /// Skip Button
                /// Right Button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
