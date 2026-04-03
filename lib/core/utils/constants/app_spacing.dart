import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  /// Height spacing
  static SizedBox h(BuildContext context, double value) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(height: height * value);
  }

  /// Width spacing
  static SizedBox w(BuildContext context, double value) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * value);
  }
}
