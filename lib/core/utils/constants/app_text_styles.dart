import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

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

  /// Today and Filter Style
  static TextStyle kTodayLabel = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );

  /// Create To Do Screen Style
  static TextStyle kCreateTodoLabel = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  /// Set Remainder Style
  static TextStyle kSetRemainder = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  /// Text Field Hint Label
  static TextStyle kTextFieldHintLabel = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black54,
    letterSpacing: 1,
  );

  /// Snack bar Label
  static TextStyle kSnackbarLabel = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}
