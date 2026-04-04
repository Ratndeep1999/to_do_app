import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class ReminderToggleWidget extends StatelessWidget {
  const ReminderToggleWidget({
    super.key,
    required this.onTap,
    required this.isReminder,
  });

  final VoidCallback onTap;
  final bool isReminder;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isReminder ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black26, width: 1.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Text
              Text(
                'Set Reminder',
                style: AppTextStyles.kSetRemainder.copyWith(
                  color: isReminder ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: width * 0.01),

              /// Icon
              Icon(
                isReminder ? Icons.notifications_active : Icons.notifications,
                size: 20,
                color: isReminder ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
