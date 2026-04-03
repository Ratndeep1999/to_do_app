import 'package:flutter/material.dart';
import 'package:to_do_app/features/auth/widgets/label_widget.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key, required this.onTap, required this.label});

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LabelWidget(label: label),
    );
  }
}
