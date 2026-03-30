import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/widgets/description_widget.dart';
import 'package:to_do_app/features/todo/widgets/time_date_and_noti_widget.dart';
import 'package:to_do_app/features/todo/widgets/title_widget.dart';
import 'package:to_do_app/features/todo/widgets/toggle_circle_widget.dart';

class TodoListItemsWidget extends StatelessWidget {
  const TodoListItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Toggle Circle Widget
        ToggleCircleWidget(isSelected: false, onTap: () {}),
        SizedBox(width: 10),

        /// ToDoData
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),

              /// Title Widget
              TitleWidget(title: "This is the title"),

              /// Description Widget
              DescriptionWidget(desc: "This is the description in depth"),
              SizedBox(height: 2),

              /// Time, Date, Notification, Refresh
              TimeDateAndNotiWidget(
                time: "08:25 AM",
                date: "03/02/1999",
                isRemainder: false,
                onTapRemainder: () {},
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
