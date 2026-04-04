import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'input_field_widget.dart';

class PasswordFieldWidget extends StatelessWidget {
  const PasswordFieldWidget({
    super.key,
    required this.controller,
    required this.isPassVisible,
    required this.onToggle,
    this.onChanged,
    this.prefix,
    this.icon,
  });

  final TextEditingController controller;
  final bool isPassVisible;
  final VoidCallback onToggle;
  final Function(String?)? onChanged;
  final IconData? prefix;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InputFieldWidget(
      controller: controller,
      validator: AuthValidators.password,
      onChanged: onChanged,
      hintText: "Enter your password",
      isObscure: isPassVisible,
      prefix: prefix,
      suffix: isPassVisible ? Icons.visibility : Icons.visibility_off,
      onSuffixTap: onToggle,
      icon: icon,
    );
  }
}
