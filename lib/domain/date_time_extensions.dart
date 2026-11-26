extension DateTimeDays on DateTime {
  /// This date at midnight, without a time of day.
  DateTime get dateOnly => DateTime(year, month, day);

  /// The Monday of the week this date is in, at midnight.
  DateTime get startOfWeek => DateTime(year, month, day - (weekday - 1));

  /// The date [days] calendar days later, at midnight.
  ///
  /// Unlike `add(Duration(days: days))` this is not affected by daylight
  /// saving time changes.
  DateTime addDays(int days) => DateTime(year, month, day + days);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
