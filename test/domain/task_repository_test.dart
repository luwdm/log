import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:work_log/database/daos/task_dao.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/domain/task_repository.dart';

void main() {
  late Database database;
  late TaskRepository repository;

  setUpAll(() => driftRuntimeOptions.dontWarnAboutMultipleDatabases = true);

  setUp(() {
    database = Database(NativeDatabase.memory());
    repository = TaskRepository(TaskDao(database));
  });

  tearDown(() => database.close());

  group('TaskRepository', () {
    test('stores tasks without a time of day', () async {
      await repository.upsert(
        title: 'Write report',
        description: 'Quarterly numbers',
        date: DateTime(2026, 11, 26, 15, 30),
      );

      final tasks = await repository.watchWeek(DateTime(2026, 11, 26)).first;

      expect(tasks, [
        Task(
          id: 1,
          title: 'Write report',
          description: 'Quarterly numbers',
          date: DateTime(2026, 11, 26),
        ),
      ]);
    });

    test('watches only the tasks from Monday to Sunday of a week', () async {
      for (final day in [22, 23, 25, 29, 30]) {
        await repository.upsert(
          title: 'Day $day',
          date: DateTime(2026, 11, day),
        );
      }

      final tasks = await repository.watchWeek(DateTime(2026, 11, 26)).first;

      expect(tasks.map((task) => task.title), ['Day 23', 'Day 25', 'Day 29']);
    });

    test('updates an existing task', () async {
      await repository.upsert(title: 'Draft', date: DateTime(2026, 11, 24));
      await repository.upsert(
        id: 1,
        title: 'Final',
        description: 'Done',
        date: DateTime(2026, 11, 27),
      );

      final tasks = await repository.watchWeek(DateTime(2026, 11, 24)).first;

      expect(tasks, [
        Task(
          id: 1,
          title: 'Final',
          description: 'Done',
          date: DateTime(2026, 11, 27),
        ),
      ]);
    });

    test('deletes a task', () async {
      await repository.upsert(title: 'Task', date: DateTime(2026, 11, 24));
      await repository.delete(1);

      final tasks = await repository.watchWeek(DateTime(2026, 11, 24)).first;

      expect(tasks, isEmpty);
    });
  });
}
