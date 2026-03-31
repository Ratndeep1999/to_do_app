import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/close_button_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/create_todo_button_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/input_field_label_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/set_remainder_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/text_field_widget.dart';
import '../../../../create to do page widgets/custom_chip.dart';
import '../../../../to_do_model_class.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  String repeatSelected = 'No repeat';
  Set<String> selectedDays = {};
  bool isRemainder = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final List<String> repeatData = ["Daily", "Weekly", "Monthly", "No repeat"];
  final List<String> weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

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
                CreateTodoButtonWidget(onTap: onCreateTodoPress),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                /// Set Remainder Widget
                SetRemainderWidget(
                  isRemainder: isRemainder,
                  onTap: () => setState(() => isRemainder = !isRemainder),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                /// TextFields Label Widget
                InputFieldLabelWidget(text: 'Tells us about your task'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                /// Title Text Field Widget
                TextFieldWidget(
                  hintText: "Title",
                  controller: _titleController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),

                /// Description Text Field Widget
                TextFieldWidget(
                  hintText: "Description",
                  controller: _descController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                /// Chips Label Widget
                InputFieldLabelWidget(text: 'Repeat'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                /// Repeat Widget
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: MediaQuery.of(context).size.height * 0.012,
                  spacing: MediaQuery.of(context).size.width * 0.03,
                  children: [
                    /// Parent Timeline
                    CustomChip(
                      title: 'Daily',
                      isSelected: repeatSelected == 'Daily',
                      onSelect: (String value) {
                        debugPrint('Daily select');
                        setState(() => repeatSelected = value);
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

                /// WeekDays Widget
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

  ///
  bool userInputValidation() {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();
    if (title.isEmpty || desc.isEmpty) return false;
    return true;
  }

  ///
  void onCreateTodoPress() {
    if (userInputValidation()) {
      /// Save Todo_Data
      ToDoModel toDoData = ToDoModel(
        isRemaindered: isRemainder,
        description: _descController.text,
        title: _titleController.text,
        isTaskCompleted: false,
        days: selectedDays,
        repeat: repeatSelected,
        createDateTime: DateTime.now(),
      );
      Navigator.of(context).pop(toDoData);
    } else {
      showSnackBar(context, 'Please Fill The Details Properly.....!');
    }
  }
}

///
void showSnackBar(context, label) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 3),
      showCloseIcon: true,
      backgroundColor: Colors.black,
      dismissDirection: DismissDirection.horizontal,
      content: Text(label, style: AppTextStyles.kSnackbarLabel),
    ),
  );
}
