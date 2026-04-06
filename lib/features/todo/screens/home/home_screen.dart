import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/add_todo_button.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/header_filter_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_view.dart';
import 'package:to_do_app/features/todo/screens/todo_form/todo_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Add Todo_Button
      floatingActionButton: AddTodoButton(onPress: onAddTodo),

      /// Appbar
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        actions: [
          Text('TODO', style: AppTextStyles.kAppbarLabel),
          Spacer(),
          const Icon(Icons.menu, size: 30),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            /// Today & Filter Widget
            HeaderFilterWidget(onTap: () {}, title: 'Today'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            /// ToDoList Widget
            TodoListView(
              todoList: todoList,
              onToggleComplete: (int index) => setState(
                () => todoList[index].isTaskCompleted =
                    !todoList[index].isTaskCompleted,
              ),
              onToggleReminder: (int index) => setState(
                () => todoList[index].isReminder = !todoList[index].isReminder,
              ),
              onItemTap: onUpdateTodo,
            ),
          ],
        ),
      ),
    );
  }

  ///
  Future<void> onAddTodo() async {
    final TodoModel? data = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoFormScreen()),
    );

    if (data != null) {
      setState(() => todoList.add(data));
    }
  }

  ///
  onUpdateTodo(int index) async {
    final updatedTodo = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TodoFormScreen(todo: todoList[index])),
    );

    if (updatedTodo != null) {
      setState(() => todoList[index] = updatedTodo);
    }
  }
}
