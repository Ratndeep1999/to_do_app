import 'package:flutter/material.dart';

class CreateToDoListPage extends StatefulWidget {
  const CreateToDoListPage({super.key});

  @override
  State<CreateToDoListPage> createState() => _CreateToDoListPageState();
}

class _CreateToDoListPageState extends State<CreateToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
              children: [
                Icon(
                    Icons.close
                )
              ]
          ),
        ),
      ),
    );
  }
}
