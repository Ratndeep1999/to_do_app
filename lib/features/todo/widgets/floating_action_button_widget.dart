import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key, required this.onPress});

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.directional(0.7, 0.8),
      child: FloatingActionButton(
        onPressed: onPress,
        splashColor: Colors.white,
        elevation: 12.0,
        //   () async {
        // ToDoModel? data =
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CreateToDoListPage(),
        //   ),
        // )
        // as ToDoModel?;

        //
        // if (data != null) {
        //   setState(() {
        //     toDoList.add(data);
        //   });
        // },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
