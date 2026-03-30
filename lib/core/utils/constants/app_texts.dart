import 'package:flutter/material.dart';

class AppTexts {
  AppTexts._();

  /// Auth Screen Styles

  /// Button Label Style
  static TextStyle kAuthButtonLabel = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  /// Label Style
  static TextStyle kAuthLabel = TextStyle(
    fontSize: 65,
    fontWeight: FontWeight.w600,
    color: Colors.black45,
  );

  /// Sub-Label Style
  static TextStyle kAuthSubLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
  );

  /// Input-Field Hint Style
  static TextStyle kHintTextStyle = TextStyle(
    color: Colors.black26,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  /// Home Screen Styles

  /// Appbar Label Style
  static TextStyle kAppbarLabel = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.blue,
  );
}
