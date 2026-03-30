import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/features/todo/widgets/floating_action_button_widget.dart';
import 'package:to_do_app/features/todo/widgets/today_and_filter_widget.dart';
import 'package:to_do_app/features/todo/widgets/todo_list_widget.dart';
import 'package:to_do_app/to_do_model_class.dart';

import '../../../create_to_do_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///
  List<ToDoModel> toDoList = [];

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
    ToDoModel? data =
        await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateToDoListPage()),
            )
            as ToDoModel?;

    if (data != null) {
      setState(() => toDoList.add(data));
    }
  }
}
