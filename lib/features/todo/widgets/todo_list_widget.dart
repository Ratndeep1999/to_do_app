import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo/widgets/todo_list_items_widget.dart';
import 'package:to_do_app/to_do_model_class.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key, required this.toDoList});

  final List<ToDoModel> toDoList;

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(ctx) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return TodoListItemsWidget(
            isTodoSelected: false,
            isRemainder: false,
            onTapToggle: () {},
            onTapRemainder: () {},
            title: '',
            description: '',
            time: '',
            date: '',
          );
        },
        separatorBuilder: (ctx, index) => Divider(),
      ),
    );
  }
}
