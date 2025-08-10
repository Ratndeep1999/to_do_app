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
  String repeatSelected = 'No repeat';
  Set<String> selectedDays = {};
  bool isRemainderActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        // Disables the splash effect
        splashFactory: NoSplash.splashFactory,
        // Disables long-press highlight
        highlightColor: Colors.transparent,
        // Ensures no splash color on long press
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Close Button
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close, weight: 20.0, size: 25),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  ///. Title
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {

                    },
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
                  SetRemainderWidget(
                    isRemainder: isRemainderActive,
                    activeRemainder: (bool value) {
                      isRemainderActive = value;
                      setState(() {});
                    },
                  ),

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
                      CustomChip(
                        title: 'Daily',
                        isSelected: repeatSelected == 'Daily',
                        // this method work when it calls from child class
                        onSelect: (String value) {
                          // to test what function return when calls from child class
                          debugPrint('Daily select');
                          // return value assign to repeatSelected
                          setState(() {
                            repeatSelected = value;
                          });
                        },
                      ),
                      CustomChip(
                        title: 'Weekly',
                        isSelected: repeatSelected == 'Weekly',
                        onSelect: (String value) {
                          debugPrint('Weekly select');
                          setState(() {
                            repeatSelected = value;
                          });
                        },
                      ),
                      CustomChip(
                        title: 'Monthly',
                        isSelected: repeatSelected == 'Monthly',
                        onSelect: (String value) {
                          debugPrint('Monthly select');
                          setState(() {
                            repeatSelected = value;
                          });
                        },
                      ),
                      CustomChip(
                        title: 'No repeat',
                        isSelected: repeatSelected == 'No repeat',
                        onSelect: (String value) {
                          debugPrint('No repeat select');
                          setState(() {
                            repeatSelected = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  /// Days Section
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: MediaQuery.of(context).size.height * 0.012,
                    spacing: MediaQuery.of(context).size.width * 0.03,
                    children: [
                      CustomChip(
                        title: 'Sunday',
                        isSelected: selectedDays.contains('Sunday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                      CustomChip(
                        title: 'Monday',
                        isSelected: selectedDays.contains('Monday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                      CustomChip(
                        title: 'Tuesday',
                        isSelected: selectedDays.contains('Tuesday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                      CustomChip(
                        title: 'Wednesday',
                        isSelected: selectedDays.contains('Wednesday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                      CustomChip(
                        title: 'Thursday',
                        isSelected: selectedDays.contains('Thursday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                      CustomChip(
                        title: 'Friday',
                        isSelected: selectedDays.contains('Friday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                      CustomChip(
                        title: 'Saturday',
                        isSelected: selectedDays.contains('Saturday'),
                        onSelect: (String value) {
                          updateSelectedDays(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // this method checks if value is add then remove it else add it
  void updateSelectedDays(String value) {
    setState(() {
      selectedDays.contains(value)
          ? selectedDays.remove(value)
          : selectedDays.add(value);
    });
  }
}
