import 'package:flutter/material.dart';

class ToggleCircleWidget extends StatelessWidget {
  const ToggleCircleWidget({
    super.key,
    required this.isTaskComplete,
    required this.onTap,
  });

  final bool isTaskComplete;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isTaskComplete ? Colors.black : Colors.transparent,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Visibility(
          visible: isTaskComplete,
          child: Icon(Icons.check, color: Colors.white, size: 25),
        ),
      ),
    );
  }
}
