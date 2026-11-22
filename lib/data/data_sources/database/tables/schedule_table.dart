import 'package:drift/drift.dart';
import 'package:work_log/data/data.dart';

class ScheduleTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get tasks => integer().nullable().references(TaskTable, #id)();
}
