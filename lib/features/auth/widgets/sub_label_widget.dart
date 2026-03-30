import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_texts.dart';

class SubLabelWidget extends StatelessWidget {
  const SubLabelWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90),

      /// Label
      child: Text(
        label,
        textAlign: TextAlign.end,
        style: AppTexts.kAuthSubLabel,
      ),
    );
  }
}
