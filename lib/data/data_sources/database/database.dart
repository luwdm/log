import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:work_log/data/data.dart';

part 'database.g.dart';

@DriftDatabase(tables: [LogTable, TaskTable, ScheduleTable])
class Database() extends _$Database {
  this : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() =>
      driftDatabase(name: 'log_database2');
}
