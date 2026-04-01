class TodoModel {
  bool isRemaindered;
  bool isTaskCompleted;
  String title;
  String description;
  String repeat;
  Set<String> days;
  DateTime time;
  DateTime date;

  TodoModel({
    required this.days,
    required this.repeat,
    required this.isRemaindered,
    required this.description,
    required this.title,
    required this.isTaskCompleted,
    required this.time,
    required this.date,
  });
}
