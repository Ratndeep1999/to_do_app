import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.isRemainder,
    required this.onTapRemainder,
  });

  final bool isRemainder;
  final VoidCallback onTapRemainder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapRemainder,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        isRemainder ? Icons.notifications_active_sharp : Icons.notifications,
        size: 18,
      ),
    );
  }
}
