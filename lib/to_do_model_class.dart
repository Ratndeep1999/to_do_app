class ToDoModel {
  bool isRemaindered;
  bool isTaskCompleted;
  String title;
  String description;
  String repeat;
  Set<String> days;
  DateTime createDateTime;

  ToDoModel({
    required this.days,
    required this.repeat,
    required this.isRemaindered,
    required this.description,
    required this.title,
    required this.isTaskCompleted ,
    required this.createDateTime,
  });
}
