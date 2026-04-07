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
    required this.onDelete,
  });

  final List<TodoModel> todoList;
  final Function(int index) onDelete, onItemTap;
  final Function(int index) onToggleComplete, onToggleReminder;

  @override
  Widget build(ctx) {
    if (todoList.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            "No tasks yet",
            style: TextStyle(fontSize: 16, color: Colors.black45),
          ),
        ),
      );
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: todoList.length,
          itemBuilder: (ctx, index) {
            /// Get Singular Item
            final item = todoList[index];
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
          },
          separatorBuilder: (ctx, index) => Divider(),
        ),
      );
    }
  }
}
