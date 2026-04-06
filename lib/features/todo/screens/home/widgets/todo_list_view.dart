import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_items_widget.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key, required this.toDoList});

  final List<TodoModel> toDoList;

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
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
            isRemainder: item.isReminder,
            onTapToggle: () =>
                setState(() => item.isTaskCompleted = !item.isTaskCompleted),
            onTapRemainder: () =>
                setState(() => item.isReminder = !item.isReminder),
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
