import 'package:flutter/material.dart';
import 'package:to_do_app/core/services/snackbar_service.dart';
import 'package:to_do_app/features/splash/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackbarService.instance.messengerKey,
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
