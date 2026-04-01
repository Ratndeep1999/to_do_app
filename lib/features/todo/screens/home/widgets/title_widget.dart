import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    required this.isTaskComplete,
  });

  final String title;
  final bool isTaskComplete;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        decoration: isTaskComplete
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}
