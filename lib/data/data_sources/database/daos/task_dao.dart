import 'package:drift/drift.dart';
import 'package:work_log/data/data.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao(super.attachedDatabase)
    extends DatabaseAccessor<Database>
    with _$TaskDaoMixin {
  Future<void> upsert(TaskTableCompanion task) async { 
    await into(taskTable).insertOnConflictUpdate(task);
  }
}
