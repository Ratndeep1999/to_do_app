import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key, required this.onPress});

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.directional(0.7, 0.8),
      child: FloatingActionButton(
        onPressed: onPress,
        splashColor: Colors.white,
        elevation: 12.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
