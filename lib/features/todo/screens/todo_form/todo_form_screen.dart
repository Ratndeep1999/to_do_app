import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';
import 'package:to_do_app/core/utils/helpers/date_time_helper.dart';
import 'package:to_do_app/core/widgets/unfocus_keyboard_widget.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';
import 'package:to_do_app/features/todo/common/widgets/close_screen_button.dart';
import 'package:to_do_app/features/todo/common/widgets/todo_action_button_widget.dart';
import 'package:to_do_app/features/todo/common/widgets/section_label.dart';
import 'package:to_do_app/features/todo/common/widgets/selectable_chips_widget.dart';
import 'package:to_do_app/features/todo/common/widgets/reminder_toggle_widget.dart';
import 'package:to_do_app/features/todo/common/widgets/todo_text_field.dart';

class TodoFormScreen extends StatefulWidget {
  const TodoFormScreen({super.key});

  @override
  State<TodoFormScreen> createState() => _TodoFormScreenState();
}

class _TodoFormScreenState extends State<TodoFormScreen> {
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: UnfocusKeyboardWidget(
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Close Button
                CloseScreenButton(onTap: () => Navigator.of(context).pop()),
                SizedBox(height: height * 0.03),

                /// _Todo Action Button
                TodoActionButtonWidget(onTap: onCreateTodoPress, label: ''),
                SizedBox(height: height * 0.02),

                /// Reminder Toggle Widget
                ReminderToggleWidget(
                  isRemainder: isRemainder,
                  onTap: () => setState(() => isRemainder = !isRemainder),
                ),
                SizedBox(height: height * 0.04),

                /// TodoTextField Label
                SectionLabel(text: 'Tells us about your task'),
                SizedBox(height: height * 0.01),

                /// Title TextField Widget
                TodoTextField(hintText: "Title", controller: _titleController),
                SizedBox(height: height * 0.015),

                /// Description TextField Widget
                TodoTextField(
                  hintText: "Description",
                  controller: _descController,
                ),
                SizedBox(height: height * 0.04),

                /// Repeat Label
                SectionLabel(text: 'Repeat'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                /// Repeat Widget
                SelectableChipsWidget(
                  repeatData: _repeatData,
                  selectedChip: selectedRepeat,
                  onSelect: (title) => setState(() => selectedRepeat = title),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                /// WeekDays Widget
                SelectableChipsWidget(
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
