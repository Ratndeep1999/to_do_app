import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_items_widget.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key, required this.toDoList});

  final List<TodoModel> toDoList;

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(ctx) {
    final todoList = widget.toDoList;

    return Expanded(
      child: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (ctx, index) {
          final item = widget.toDoList[index];
          return TodoListItemsWidget(
            isTaskComplete: item.isTaskCompleted,
            isRemainder: item.isRemaindered,
            onTapToggle: () =>
                setState(() => item.isTaskCompleted = !item.isTaskCompleted),
            onTapRemainder: () =>
                setState(() => item.isRemaindered = !item.isRemaindered),
            title: item.title,
            description: item.description,
            time: item.currentTime,
            date: item.currentDate,
          );
        },
        separatorBuilder: (ctx, index) => Divider(),
      ),
    );
  }
}
