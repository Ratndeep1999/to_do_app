import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/close_button_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/create_todo_button_widget.dart';
import '../../../../create to do page widgets/custom_chip.dart';
import '../../../../create to do page widgets/custom_input_fields_widget.dart';
import '../../../../create to do page widgets/custom_text.dart';
import '../../../../create to do page widgets/set_remainder_widget.dart';
import '../../../../to_do_model_class.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  String repeatSelected = 'No repeat';
  Set<String> selectedDays = {};
  bool isRemainderActive = false;
  String _titleInput = '';
  String _descriptionInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UnfocusKeyboardWidget(
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Close Button Widget
                CloseButtonWidget(onTap: () => Navigator.of(context).pop()),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                /// Create to-do Button
                CreateTodoButtonWidget(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                /// Set Remainder
                SetRemainderWidget(
                  isRemainder: isRemainderActive,
                  activeRemainder: (bool value) {
                    isRemainderActive = value;
                    setState(() {});
                    debugPrint(isRemainderActive.toString());
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                /// Task Description
                CustomText(text: 'Tells us about your task'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                /// Text Fields
                CustomTextFieldWidget(
                  hint: 'Title',
                  maxLines: 1,
                  userInput: (String title) {
                    _titleInput = title;
                    debugPrint(_titleInput);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                CustomTextFieldWidget(
                  hint: 'Description',
                  maxLines: 2,
                  userInput: (String description) {
                    _descriptionInput = description;
                    debugPrint(_descriptionInput);
                  },
                ),
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
    );
  }

  // this method checks if days is add then remove it else add it
  void updateSelectedDays(String value) {
    setState(() {
      selectedDays.contains(value)
          ? selectedDays.remove(value)
          : selectedDays.add(value);
    });
  }

  // method for title and description validation
  bool userInputValidation() {
    if (_titleInput.trim().isEmpty) {
      return false;
    }
    if (_descriptionInput.trim().isEmpty) {
      return false;
    }
    return true;
  }

  // method for save and pass date if valid otherwise show snack bar
  void userInputSave() {
    // userInputValidation() which return true ao false
    if (userInputValidation()) {
      // Sava data in to toDoData which typ ei ToDoModel
      ToDoModel toDoData = ToDoModel(
        isRemaindered: isRemainderActive,
        description: _descriptionInput,
        title: _titleInput,
        isTaskCompleted: false,
        days: selectedDays,
        repeat: repeatSelected,
        createDateTime: DateTime.now(),
      );
      // Data pass to previous page by using variable toDoData
      Navigator.of(context).pop(toDoData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 4),
          showCloseIcon: true,
          content: Text(
            'Please Input Details Properly.....',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      );
    }
  }
}
