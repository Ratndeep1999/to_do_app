import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/time_date_and_noti_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/title_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/toggle_circle_widget.dart';
import 'description_widget.dart';

class TodoListItemWidget extends StatelessWidget {
  const TodoListItemWidget({
    super.key,
    required this.isTaskComplete,
    required this.isReminder,
    required this.onTapToggle,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.onReminderToggle,
  });

  final bool isTaskComplete, isReminder;
  final VoidCallback onTapToggle, onReminderToggle;
  final String title, description, time, date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          /// Toggle
          ToggleCircleWidget(
            isTaskComplete: isTaskComplete,
            onTap: onTapToggle,
          ),
          SizedBox(width: size.width * 0.025),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                TitleWidget(title: title, isTaskComplete: isTaskComplete),

                /// Description
                DescriptionWidget(
                  desc: description,
                  isTaskComplete: isTaskComplete,
                ),
                SizedBox(height: size.height * 0.002),

                /// Time, Date, Notification, Refresh
                TimeDateAndNotiWidget(
                  time: time,
                  date: date,
                  isRemainder: isReminder,
                  onTapRemainder: onReminderToggle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
