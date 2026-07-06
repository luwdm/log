import 'package:drift/drift.dart';

class DayTaskAssignment extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// The id of the day.
  IntColumn get dayId => integer()();

  /// The id of the task.
  IntColumn get taskId => integer()();
}
