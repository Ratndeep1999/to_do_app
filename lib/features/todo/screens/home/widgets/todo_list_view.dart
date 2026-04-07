import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/empty_todo_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_item_tile.dart';

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
      return EmptyTodoWidget();
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: todoList.length,
          itemBuilder: (ctx, index) {
            /// Get Singular Item
            final item = todoList[index];
            return TodoListItemTile(
              item: item,
              index: index,
              onDelete: onDelete,
              onItemTap: onItemTap,
              onToggleComplete: onToggleComplete(index),
              onToggleReminder: onToggleReminder,
            );
          },
          separatorBuilder: (ctx, index) => Divider(),
        ),
      );
    }
  }
}
