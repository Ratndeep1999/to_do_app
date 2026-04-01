class TodoModel {
  bool isRemaindered;
  bool isTaskCompleted;
  String title;
  String description;
  String repeat;
  Set<String> days;
  DateTime currentTime;
  DateTime currentDate;
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
