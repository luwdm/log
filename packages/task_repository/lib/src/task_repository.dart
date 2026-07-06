import 'package:database/database.dart';
import 'package:task_repository/task_repository.dart';

/// {@template get_tasks_failure}
/// Thrown during getting the tasks from the database if a failure occurs.
/// {@endtemplate}
class GetTasksFailure implements Exception {
  /// {@macro GetTaskFailure}
  const GetTasksFailure();
}

/// {@template create_task_failure}
/// Thrown during the task creation if a failure occurs.
/// {@endtemplate}
class CreateTaskFailure implements Exception {
  /// {@macro create_task_failure}
  const CreateTaskFailure();
}

/// {@template task_repository}
/// Task repository that allows to crud the tasks.
/// {@endtemplate}
class TaskRepository {
  /// {@macro task_repository}
  TaskRepository({
    required Database database,
  }) : _database = database;

  final Database _database;

  /// Returns a stream of tasks from the database.
  ///
  /// Throws a [GetTasksFailure] if an exception occurs.
  Stream<List<Task>> getTasks() {
    try {
      final taskEntitiesStream = _database.select(_database.taskEntity).watch();

      return taskEntitiesStream.map((taskEntityList) {
        return taskEntityList.map((taskEntity) {
          return Task(
            id: taskEntity.id,
            description: taskEntity.description,
            createdAt: taskEntity.createdAt,
            updatedAt: DateTime.now(),
            finishedAt: taskEntity.finishedAt,
          );
        }).toList();
      });
    } catch (_) {
      throw const GetTasksFailure();
    }
  }

  /// Creates a new task.
  ///
  /// Throws a [CreateTaskFailure] when an exception occurs.
  Future<void> createTask({
    required String taskTitle,
  }) async {
    try {
      final now = DateTime.now();
      await _database.into(_database.taskEntity).insert(
            TaskEntityCompanion.insert(
              description: taskTitle,
              createdAt: now,
            ),
          );
    } catch (_) {
      throw const CreateTaskFailure();
    }
  }
}
