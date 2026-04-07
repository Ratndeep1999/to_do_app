import 'package:flutter/material.dart';

class EmptyTodoWidget extends StatelessWidget {
  const EmptyTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          "No tasks yet",
          style: TextStyle(fontSize: 16, color: Colors.black45),
        ),
      ),
    );
  }
}
