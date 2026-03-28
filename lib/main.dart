import 'package:flutter/material.dart';
import 'package:to_do_app/to_do_list_page.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: ToDoListPage(),
    );
  }
}
