import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class SetRemainderWidget extends StatelessWidget {
  const SetRemainderWidget({
    super.key,
    required this.onTap,
    required this.isRemainder,
  });

  final VoidCallback onTap;
  final bool isRemainder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isRemainder ? Colors.black : Colors.white,
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
                  color: isRemainder ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),

              /// Icon
              Icon(
                isRemainder ? Icons.notifications_active : Icons.notifications,
                size: 20,
                color: isRemainder ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
