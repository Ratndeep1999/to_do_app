class TodoModel {
  bool isRemaindered;
  bool isTaskCompleted;
  String title;
  String description;
  String repeat;
  Set<String> days;
  String currentTime;
  String currentDate;
  DateTime createdAt;

  TodoModel({
    required this.days,
    required this.repeat,
    required this.isRemaindered,
    required this.description,
    required this.title,
    required this.currentTime,
    required this.currentDate,
    required this.createdAt,
    this.isTaskCompleted = false,
  });
}
