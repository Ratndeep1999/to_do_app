import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_item_widget.dart';

class TodoListItemTile extends StatelessWidget {
  const TodoListItemTile({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onItemTap,
    required this.onToggleComplete,
    required this.onToggleReminder,
    required this.index,
  });

  final TodoModel item;
  final int index;
  final Function(int index) onDelete, onItemTap;
  final Function(int index) onToggleComplete, onToggleReminder;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.createdAt),
      direction: DismissDirection.endToStart,

      /// Delete Item
      onDismissed: (_) => onDelete(index),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        /// Edit Item
        onTap: () => onItemTap(index),
        onLongPress: () => onItemTap(index),
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
      ),
    );
  }
}
