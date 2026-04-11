import 'package:flutter/material.dart';

class SnackbarService {
  SnackbarService._();

  static final SnackbarService instance = SnackbarService._();

  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Show Success
  void showSuccess(String message) {
    _show(message, Colors.green);
  }

  /// Show Error
  void showError(String message) {
    _show(message, Colors.red);
  }

  /// Show Info
  void showInfo(String message) {
    _show(message, Colors.black);
  }

  void _show(String message, Color color) {
    final messenger = messengerKey.currentState;

    messenger?.clearSnackBars();

    messenger?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
