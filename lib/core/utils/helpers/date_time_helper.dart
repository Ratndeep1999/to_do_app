class DateTimeHelper {
  /// Private Constructor
  DateTimeHelper._();

  /// Formated Time
  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, "0");
    final period = dateTime.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute $period";
  }

  /// Formated Date
  static String formatDate(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, "0");
    final month = dateTime.month.toString().padLeft(2, "0");
    final year = dateTime.year;
    return "$day/$month/$year";
  }
}
