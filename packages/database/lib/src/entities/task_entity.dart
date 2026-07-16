import 'package:drift/drift.dart';

/// Database entity of a task.
class TaskEntity extends Table {
  /// The id of the task.
  IntColumn get id => integer().autoIncrement()();

  /// The description of the task.
  TextColumn get description => text()();

  /// The creation date of the task.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// The date when the user finished the task.
  DateTimeColumn get finishedAt => dateTime().nullable()();
}
