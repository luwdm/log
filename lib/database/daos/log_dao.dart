import 'package:drift/drift.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/database/tables/log_table.dart';

part 'log_dao.g.dart';

@DriftAccessor(tables: [LogTable])
class LogDao(super.attachedDatabase)
    extends DatabaseAccessor<Database>
    with _$LogDaoMixin {
  Stream<List<LogTableData>> watch() => select(logTable).watch();

  Future<void> upsert(LogTableCompanion log) async {
    await into(logTable).insertOnConflictUpdate(log);
  }

  Future<void> remove(int id) async {
    await (delete(logTable)..where((t) => t.id.equals(id))).go();
  }
}
