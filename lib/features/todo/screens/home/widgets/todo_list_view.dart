import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_item_widget.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({
    super.key,
    required this.todoList,
    required this.onToggleComplete,
    required this.onToggleReminder,
    required this.onItemTap,
  });

  final List<TodoModel> todoList;
  final Function(int index) onToggleComplete, onToggleReminder, onItemTap;

  @override
  Widget build(ctx) {
    return Expanded(
      child: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (ctx, index) {
          ///
          final item = todoList[index];
          return GestureDetector(
            onTap: () => onItemTap(index),
            child: TodoListItemWidget(
              isTaskComplete: item.isTaskCompleted,
              isReminder: item.isReminder,
              onTapToggle: () => onToggleComplete(index),
              onReminderToggle: () => onToggleReminder(index),
              title: item.title,
              description: item.description,
              time: item.currentTime,
              date: item.currentDate,
            ),
          );
        },
        separatorBuilder: (ctx, index) => Divider(),
      ),
    );
  }
}
