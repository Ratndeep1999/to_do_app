import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/core/utils/helpers/date_time_helper.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/close_button_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/create_todo_button_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/input_field_label_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/repeat_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/set_remainder_widget.dart';
import 'package:to_do_app/features/todo/screens/create_todo/widgets/text_field_widget.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  bool isRemainder = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final List<String> _repeatData = ["Daily", "Weekly", "Monthly", "No repeat"];
  final List<String> _weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  String selectedRepeat = "No repeat";
  Set<String> selectedDays = {};

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
                RepeatWidget(
                  repeatData: _repeatData,
                  selectedChip: selectedRepeat,
                  onSelect: (title) => setState(() => selectedRepeat = title),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                /// WeekDays Widget
                RepeatWidget(
                  repeatData: _weekDays,
                  selectedChips: selectedDays,
                  onSelect: updateSelectedDays,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  void updateSelectedDays(String title) {
    final data = selectedDays.contains(title);
    setState(() => data ? selectedDays.remove(title) : selectedDays.add(title));
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
      final now = DateTime.now();

      /// Save Todo_Data
      final TodoModel todoData = TodoModel(
        isRemaindered: isRemainder,
        isTaskCompleted: false,
        title: _titleController.text,
        description: _descController.text,
        days: selectedDays,
        repeat: selectedRepeat,
        currentTime: DateTimeHelper.formatTime(now),
        currentDate: DateTimeHelper.formatDate(now),
        createdAt: now,
      );
      Navigator.of(context).pop(todoData);
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
