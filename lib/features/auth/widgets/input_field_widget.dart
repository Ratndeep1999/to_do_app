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
    this.icon,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool isObscure;
  final String hintText;
  final IconData? prefix, suffix;
  final VoidCallback? onSuffixTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: isObscure,
      textCapitalization: TextCapitalization.characters,
      keyboardType: TextInputType.text,
      // onSaved: ,
      // focusNode: ,
      // onFieldSubmitted: ,
      enableSuggestions: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        hintText: hintText,
        hintStyle: AppTexts.kHintTextStyle,
        errorStyle: TextStyle(color: Colors.black54, fontSize: 10),
        icon: icon != null ? Icon(icon, color: Colors.black26) : null,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        prefixIconColor: Colors.black26,
        suffixIcon: suffix != null
            ? InkWell(
                onTap: onSuffixTap,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Icon(suffix, color: Colors.black26),
              )
            : null,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
