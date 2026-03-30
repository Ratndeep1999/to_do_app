import 'package:flutter/material.dart';
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
      ],
    );
  }
}
