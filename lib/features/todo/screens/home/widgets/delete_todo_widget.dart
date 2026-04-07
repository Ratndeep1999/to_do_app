import 'package:flutter/material.dart';

class DeleteTodoWidget extends StatelessWidget {
  const DeleteTodoWidget({
    super.key,
    required this.uniqueKey,
    required this.child,
    required this.onDelete,
    required this.onComplete,
  });

  final Key uniqueKey;
  final Widget child;
  final VoidCallback onDelete, onComplete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: uniqueKey,
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete(); // swipe from left
        } else {
          onComplete(); // swipe from right
        }
      },
      // Left Side Decoration
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),

      // Right Side Decoration
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: child,
    );
  }
}
