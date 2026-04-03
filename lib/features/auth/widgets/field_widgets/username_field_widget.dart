import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/validators/auth_validators.dart';
import 'package:to_do_app/features/auth/widgets/Input_field_widget.dart';

class UsernameFieldWidget extends StatelessWidget {
  const UsernameFieldWidget({
    super.key,
    required this.controller,
    this.icon,
    this.prefix,
  });

  final TextEditingController controller;
  final IconData? icon;
  final IconData? prefix;

  @override
  Widget build(BuildContext context) {
    return InputFieldWidget(
      controller: controller,
      validator: AuthValidators.userName,
      hintText: 'Enter your user name',
      icon: icon,
      prefix: prefix,
    );
  }
}
