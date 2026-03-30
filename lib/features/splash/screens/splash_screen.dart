import 'package:flutter/material.dart';
import 'package:to_do_app/create_to_do_list_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => _navigateToNextPage());
  }

  /// Go to next page
  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Splash Icon
              Image.asset(
                'assets/icons/to_do.png',
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              /// Label
              Text(
                'TO DO List',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
              ),

              /// Sub-Name Label
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'by Ratndeep',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
