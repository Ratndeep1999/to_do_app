import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.maxLines,
    required this.hintText,
  });

  final TextEditingController controller;
  final Function(String?)? onChanged;
  final int? maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.kTextFieldHintLabel,
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.black26, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black26, width: 1.2),
        ),
      ),
    );
  }
}
