import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'Input_field_widget.dart';

class UsernameFieldWidget extends StatelessWidget {
  const UsernameFieldWidget({super.key, required this.controller, this.icon});

  final TextEditingController controller;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InputFieldWidget(
      controller: controller,
      validator: AuthValidators.userName,
      hintText: 'Enter your user name',
      prefix: Icons.person,
      icon: icon,
    );
  }
}
