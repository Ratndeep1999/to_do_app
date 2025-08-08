import 'package:flutter/material.dart';
import 'create to do page widgets/custom_chip.dart';
import 'create to do page widgets/custom_input_fields_widget.dart';
import 'create to do page widgets/custom_text.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Close Button
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, weight: 20.0, size: 25),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            
                ///. Title
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
            
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            
                /// Task Description
                CustomText(text: 'Tells us about your task'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            
                /// Text Fields
                CustomTextFieldWidget(hint: 'Title'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                CustomTextFieldWidget(hint: 'Description'),
            
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            
                /// Repeat Section
                CustomText(text: 'Repeat'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            
                /// Timeline Section
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: MediaQuery.of(context).size.height * 0.012,
                  spacing: MediaQuery.of(context).size.width * 0.03,
                  children: [
                    /// Parent Timeline
                    CustomChip(title: 'Daily'),
                    CustomChip(title: 'Weekly'),
                    CustomChip(title: 'Monthly'),
                    CustomChip(title: 'No repeat'),
                  ],
                ),
            
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            
                /// Days Section
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: MediaQuery.of(context).size.height * 0.012,
                  spacing: MediaQuery.of(context).size.width * 0.03,
                  children: [
                    CustomChip(title: 'Sunday'),
                    CustomChip(title: 'Monday'),
                    CustomChip(title: 'Tuesday'),
                    CustomChip(title: 'Wednesday'),
                    CustomChip(title: 'Thursday'),
                    CustomChip(title: 'Friday'),
                    CustomChip(title: 'Saturday'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
