import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_texts.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.isObscure = false,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.onSuffixTap,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool isObscure;
  final String hintText;
  final IconData? prefix, suffix;
  final VoidCallback? onSuffixTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTexts.kHintTextStyle,
        prefixIcon: Icon(prefix),
        prefixIconColor: Colors.black26,
        suffixIcon: InkWell(onTap: onSuffixTap, child: Icon(suffix)),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
