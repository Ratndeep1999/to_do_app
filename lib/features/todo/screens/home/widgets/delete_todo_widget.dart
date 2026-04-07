import 'package:flutter/material.dart';

class DeleteTodoWidget extends StatelessWidget {
  const DeleteTodoWidget({
    super.key,
    required this.uniqueKey,
    required this.child,
    required this.onDelete,
  });

  final Key uniqueKey;
  final Widget child;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: uniqueKey,
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: child,
    );
  }
}
