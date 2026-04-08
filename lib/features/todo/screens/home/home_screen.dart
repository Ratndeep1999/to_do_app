import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/features/todo/data/todo_local_datasource.dart';
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
  final TodoLocalDatasource _todoDb = TodoLocalDatasource();
  List<TodoModel> todoList = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

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
              onToggleComplete: onToggleComplete,
              onToggleReminder: onToggleReminder,
              onItemTap: onUpdateTodo,
              onDelete: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  ///
  Future<void> loadTodos() async {
    final data = await _todoDb.getTodos();
    setState(() => todoList = data);
  }

  ///
  Future<void> onAddTodo() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoFormScreen()),
    );

    if (result) {
      await loadTodos();
    }
  }

  ///
  void onUpdateTodo(int index) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TodoFormScreen(todo: todoList[index])),
    );

    if (result) {
      await loadTodos();
    }
  }

  ///
  Future<void> onDelete(int index) async {
    final todo = todoList[index];
    await _todoDb.deleteTodo(todo.id!);
    await loadTodos();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text("Task Deleted"),
    //     action: SnackBarAction(
    //       label: "UNDO",
    //       onPressed: () => setState(() => todoList.insert(index, deletedTodo)),
    //     ),
    //   ),
    // );
  }

  ///
  onToggleComplete(int index) async {
    final todo = todoList[index];
    final updatedTodo = todo.copyWith(isTaskCompleted: !todo.isTaskCompleted);
    await _todoDb.updateTodo(updatedTodo);
    await loadTodos();
  }

  ///
  onToggleReminder(int index) async {
    final todo = todoList[index];
    final updatedTodo = todo.copyWith(isReminder: !todo.isReminder);
    await _todoDb.updateTodo(updatedTodo);
    await loadTodos();
  }
}
