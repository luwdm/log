import 'package:drift/drift.dart';
import 'package:work_log/database/daos/task_dao.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/date_time_extensions.dart';
import 'package:work_log/domain/models/task.dart';

class const TaskRepository(final TaskDao _taskDao) {
  /// Watches the tasks of the week (Monday to Sunday) that contains [day].
  Stream<List<Task>> watchWeek(DateTime day) {
    final start = day.startOfWeek;
    return _taskDao
        .watchBetween(start, start.addDays(DateTime.daysPerWeek))
        .map((rows) => rows.map(_toTask).toList());
  }

  /// Adds a task, or updates the task with [id] if it is given.
  Future<void> upsert({
    required String title,
    required DateTime date,
    String description = '',
    int? id,
  }) async {
    await _taskDao.upsert(
      TaskTableCompanion.insert(
        id: .absentIfNull(id),
        title: title,
        description: Value(description),
        date: date.dateOnly,
      ),
    );
  }

  Future<void> delete(int id) => _taskDao.remove(id);

  static Task _toTask(TaskTableData row) => Task(
    id: row.id,
    title: row.title,
    description: row.description,
    date: row.date,
  );
}
