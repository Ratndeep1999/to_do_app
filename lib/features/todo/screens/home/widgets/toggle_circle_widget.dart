import 'package:flutter/material.dart';

class ToggleCircleWidget extends StatelessWidget {
  const ToggleCircleWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        height: 50,
        width: 50,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.blue),
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
          child: Visibility(
            visible: isSelected,
            child: Icon(Icons.check, size: 25),
          ),
        ),
      ),
    );
  }
}
