import 'package:database/database.dart';
import 'package:database/src/entities/entities.dart';
import 'package:drift/drift.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskEntity])
class TaskDao extends DatabaseAccessor<Database> with _$TaskDaoMixin {
  TaskDao(super.attachedDatabase);

  Stream<List<TaskEntityData>> watchTasks() => select(taskEntity).watch();

  Future<int> createTask({required String description}) {
    return into(
      taskEntity,
    ).insert(TaskEntityCompanion(description: Value(description)));
  }

  Future<int> updateTask({required int taskId, required DateTime finishedAt}) {
    return (update(taskEntity)..where((task) => task.id.equals(taskId))).write(
      TaskEntityCompanion(finishedAt: Value(finishedAt)),
    );
  }
}
