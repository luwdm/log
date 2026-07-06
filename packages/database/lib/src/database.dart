import 'package:database/src/entities/entities.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TaskEntity, DayEntity, DayTaskAssignment])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'work_log_database');
  }
}
