import 'package:drift/drift.dart';

/// A task planned for a specific day of the week.
class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get description => text().withDefault(const Constant(''))();

  /// The day the task is planned for, stored without a time of day.
  DateTimeColumn get date => dateTime()();
}
