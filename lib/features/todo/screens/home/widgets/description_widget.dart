import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.desc});

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 15),
    );
  }
}
