import 'package:flutter/material.dart';
import 'package:to_do_app/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  // init call at once only when the page load
  void initState() {
    super.initState();
    debugPrint('InitState method');
    Future.delayed( const Duration(seconds: 3), () {

    });
  }




  @override
  Widget build(BuildContext context) {
    debugPrint('build method');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/Assets/to_do.png',
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
              Text(
                'TO DO List',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
