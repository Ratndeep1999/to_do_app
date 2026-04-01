import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.desc,
    required this.isTaskComplete,
  });

  final String desc;
  final bool isTaskComplete;

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 15,
        decoration: isTaskComplete
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}
