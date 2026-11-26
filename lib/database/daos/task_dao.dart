import 'package:drift/drift.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/database/tables/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao(super.attachedDatabase)
    extends DatabaseAccessor<Database>
    with _$TaskDaoMixin {
  /// Watches all tasks with a date in the range [start, end).
  Stream<List<TaskTableData>> watchBetween(DateTime start, DateTime end) {
    final query = select(taskTable)
      ..where(
        (t) =>
            t.date.isBiggerOrEqualValue(start) & t.date.isSmallerThanValue(end),
      )
      ..orderBy([(t) => .asc(t.date), (t) => .asc(t.id)]);
    return query.watch();
  }

  Future<void> upsert(TaskTableCompanion task) async {
    await into(taskTable).insertOnConflictUpdate(task);
  }

  Future<void> remove(int id) async {
    await (delete(taskTable)..where((t) => t.id.equals(id))).go();
  }
}
