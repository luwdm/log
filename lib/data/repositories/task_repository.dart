import 'package:work_log/data/data.dart';

class const TaskRepository({required final TaskDao _taskDao}) {
  Future<void> upsert({
    required String title,
    required String description,
    int? id,
  }) async {
    await _taskDao.upsert(
      TaskTableCompanion.insert(
        title: title,
        description: description,
        id: .absentIfNull(id),
        // TODO: Pass date from calendar day.
        scheduleAt: .now(),
      ),
    );
  }
}
