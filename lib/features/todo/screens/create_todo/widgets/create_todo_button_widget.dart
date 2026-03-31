import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class CreateTodoButtonWidget extends StatelessWidget {
  const CreateTodoButtonWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Text('Create to-do', style: AppTextStyles.kCreateTodoLabel),
    );
  }
}
