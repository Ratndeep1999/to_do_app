import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/time_date_and_noti_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/title_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/toggle_circle_widget.dart';
import 'description_widget.dart';

class TodoListItemsWidget extends StatelessWidget {
  const TodoListItemsWidget({
    super.key,
    required this.isTaskComplete,
    required this.isRemainder,
    required this.onTapToggle,
    required this.onTapRemainder,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
  });

  final bool isTaskComplete, isRemainder;
  final VoidCallback onTapToggle, onTapRemainder;
  final String title, description, time, date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Toggle Circle Widget
        ToggleCircleWidget(isTaskComplete: isTaskComplete, onTap: onTapToggle),
        SizedBox(width: 10),

        /// ToDoData
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),

              /// Title Widget
              TitleWidget(title: title, isTaskComplete: isTaskComplete),

              /// Description Widget
              DescriptionWidget(
                desc: description,
                isTaskComplete: isTaskComplete,
              ),
              SizedBox(height: 2),

              /// Time, Date, Notification, Refresh
              TimeDateAndNotiWidget(
                time: time,
                date: date,
                isRemainder: isRemainder,
                onTapRemainder: onTapRemainder,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
