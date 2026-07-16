import 'package:database/database.dart';
import 'package:task_repository/task_repository.dart';

/// {@template create_task_failure}
/// Thrown during the task creation if a failure occurs.
/// {@endtemplate}
class CreateTaskFailure implements Exception {
  /// {@macro create_task_failure}
  const CreateTaskFailure();
}

/// {@template complete_task_failure}
/// Thrown when completing the task fails.
/// {@endtemplate}
class CompleteTaskFailure implements Exception {
  /// {@macro complete_task_failure}
  const CompleteTaskFailure();
}

/// {@template task_repository}
/// Task repository that allows to crud the tasks.
/// {@endtemplate}
class TaskRepository {
  /// {@macro task_repository}
  TaskRepository({required this._taskDao});

  final TaskDao _taskDao;

  /// Returns a stream of tasks from the database.
  Stream<List<Task>> getTasks() {
    return _taskDao.watchTasks().map((taskEntityList) {
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
  }

  /// Creates a new task.
  ///
  /// Throws a [CreateTaskFailure] when an exception occurs.
  Future<void> createTask({required String description}) async {
    try {
      await _taskDao.createTask(description: description);
    } catch (_) {
      throw const CreateTaskFailure();
    }
  }

  /// Completes a task and adds a finished at timestamp.
  ///
  /// Throws a [CompleteTaskFailure] when an exception occurs.
  Future<void> completeTask({required int taskId}) async {
    try {
      final finishedAt = DateTime.now();
      await _taskDao.updateTask(taskId: taskId, finishedAt: finishedAt);
    } catch (_) {
      throw const CompleteTaskFailure();
    }
  }
}
