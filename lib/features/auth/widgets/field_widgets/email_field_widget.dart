import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'input_field_widget.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputFieldWidget(
      controller: controller,
      hintText: "Enter your email",
      validator: AuthValidators.email,
      icon: Icons.email_outlined,
    );
  }
}
