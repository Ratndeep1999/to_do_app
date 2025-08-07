import 'package:flutter/material.dart';

import 'create to do page widgets/custom_inputfields_widget.dart';
import 'create to do page widgets/set_remainder_widget.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close, weight: 20.0, size: 25),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              InkWell(
                onTap: () {},
                child: Text(
                  'Create to-do',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              /// Set Remainder
              SetRemainderWidget(),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                'Tells us about your task',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              /// TextFields
              CustomTextFieldWidget(hint: 'Title'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              CustomTextFieldWidget(hint: 'Description'),
            ],
          ),
        ),
      ),
    );
  }
}


