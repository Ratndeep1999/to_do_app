import 'package:flutter/material.dart';
import 'package:to_do_app/splash_page.dart';
import 'package:to_do_app/to_do_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: ToDoListPage(),
    );
  }
}