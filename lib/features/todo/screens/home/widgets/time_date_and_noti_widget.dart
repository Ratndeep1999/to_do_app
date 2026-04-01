import 'package:flutter/material.dart';

import 'notification_widget.dart';

class TimeDateAndNotiWidget extends StatelessWidget {
  const TimeDateAndNotiWidget({
    super.key,
    required this.time,
    required this.date,
    required this.isRemainder,
    required this.onTapRemainder,
  });

  final String time;
  final String date;
  final bool isRemainder;
  final VoidCallback onTapRemainder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Time
        const Icon(Icons.watch_later_outlined, size: 18),
        const SizedBox(width: 2),
        Text(time, style: TextStyle(fontSize: 13)),
        const SizedBox(width: 12),

        /// Date
        const Icon(Icons.calendar_today_rounded, size: 16),
        const SizedBox(width: 5),
        Text(date, style: TextStyle(fontSize: 12)),
        const SizedBox(width: 12),

        /// Notification
        NotificationWidget(
          isRemainder: isRemainder,
          onTapRemainder: onTapRemainder,
        ),
        const SizedBox(width: 12),

        /// Refresh
        const Icon(Icons.repeat, size: 18),
      ],
    );
  }
}
