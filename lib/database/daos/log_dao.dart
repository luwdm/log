import 'package:drift/drift.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/database/tables/log_table.dart';

part 'log_dao.g.dart';

@DriftAccessor(tables: [LogTable])
class LogDao(super.attachedDatabase)
    extends DatabaseAccessor<Database>
    with _$LogDaoMixin {
  Stream<List<LogTableData>> watch() => select(logTable).watch();

  Future<void> create(LogTableCompanion log) async {
    await into(logTable).insert(log);
  }
}
