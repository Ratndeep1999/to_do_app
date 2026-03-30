import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_texts.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(ctx) {
    return SizedBox(
      width: double.infinity,
      child: Text(label, textAlign: TextAlign.end, style: AppTexts.kAuthLabel),
    );
  }
}
