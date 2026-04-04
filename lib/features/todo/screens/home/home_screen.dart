import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/create_todo/todo_form_screen.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/floating_action_button_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/today_and_filter_widget.dart';
import 'package:to_do_app/features/todo/screens/home/widgets/todo_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Floating Action Button
      floatingActionButton: FloatingActionButtonWidget(onPress: onCreateTodo),

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
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.027),

            /// Today & Filter Widget
            TodayAndFilterWidget(onTap: () {}),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            /// ToDoList Widget
            TodoListWidget(toDoList: toDoList),
          ],
        ),
      ),
    );
  }

  ///
  Future<void> onCreateTodo() async {
    TodoModel? data =
        await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateTodoScreen()),
            )
            as TodoModel?;

    if (data != null) {
      setState(() => toDoList.add(data));
    }
  }
}
