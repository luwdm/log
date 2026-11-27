import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:work_log/database/tables/log_table.dart';
import 'package:work_log/database/tables/task_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [LogTable, TaskTable])
class Database([QueryExecutor? executor]) extends _$Database {
  this : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) await m.createTable(taskTable);
    },
  );

  static QueryExecutor _openConnection() =>
      driftDatabase(name: 'log_database2');
}
