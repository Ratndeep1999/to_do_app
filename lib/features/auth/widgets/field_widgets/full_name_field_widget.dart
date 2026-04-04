import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'input_field_widget.dart';

class FullNameFieldWidget extends StatelessWidget {
  const FullNameFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputFieldWidget(
      controller: controller,
      hintText: "Enter your full name",
      validator: AuthValidators.fullName,
      icon: Icons.person,
    );
  }
}
