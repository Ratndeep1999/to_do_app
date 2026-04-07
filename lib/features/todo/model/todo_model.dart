class TodoModel {
  final int? id;
  final bool isReminder;
  final bool isTaskCompleted;
  final String title;
  final String description;
  final String repeat;
  final Set<String> days;
  final String currentTime;
  final String currentDate;
  final DateTime createdAt;

  TodoModel({
    this.id,
    required this.days,
    required this.repeat,
    required this.isReminder,
    required this.description,
    required this.title,
    required this.currentTime,
    required this.currentDate,
    required this.createdAt,
    this.isTaskCompleted = false,
  });

  /// Convert to Map (for DB)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isReminder': isReminder ? 1 : 0,
      'isTaskCompleted': isTaskCompleted ? 1 : 0,
      'title': title,
      'description': description,
      'repeat': repeat,
      'days': days.join(','),
      'currentTime': currentTime,
      'currentDate': currentDate,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Convert from DB → Model
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      isReminder: map['isReminder'] == 1,
      isTaskCompleted: map['isTaskCompleted'] == 1,
      title: map['title'],
      description: map['description'],
      repeat: map['repeat'],
      days: map['days'].split(','),
      currentTime: map['currentTime'],
      currentDate: map['currentDate'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  /// copyWith()
  copyWith({
    int? id,
    bool? isReminder,
    bool? isTaskCompleted,
    String? title,
    String? description,
    String? repeat,
    Set<String>? days,
    String? currentTime,
    String? currentDate,
    DateTime? createdAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      isReminder: isReminder ?? this.isReminder,
      isTaskCompleted: isTaskCompleted ?? this.isTaskCompleted,
      title: title ?? this.title,
      description: description ?? this.description,
      repeat: repeat ?? this.repeat,
      days: days ?? this.days,
      currentTime: currentTime ?? this.currentTime,
      currentDate: currentDate ?? this.currentDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
