import 'package:flutter/material.dart';

class UnfocusKeyboardWidget extends StatelessWidget {
  const UnfocusKeyboardWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: child,
    );
  }
}
