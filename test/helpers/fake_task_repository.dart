import 'dart:async';

import 'package:work_log/domain/date_time_extensions.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/domain/task_repository.dart';

/// An in-memory [TaskRepository] for testing the presentation layer.
class FakeTaskRepository implements TaskRepository {
  final List<Task> tasks = [];
  final _changes = StreamController<void>.broadcast();

  @override
  Stream<List<Task>> watchWeek(DateTime day) {
    final start = day.startOfWeek;
    final end = start.addDays(DateTime.daysPerWeek);
    List<Task> week() => tasks
        .where((t) => !t.date.isBefore(start) && t.date.isBefore(end))
        .toList();

    StreamSubscription<void>? subscription;
    late final StreamController<List<Task>> controller;
    controller = StreamController(
      onListen: () {
        controller.add(week());
        subscription = _changes.stream.listen((_) => controller.add(week()));
      },
      onCancel: () => subscription?.cancel(),
    );
    return controller.stream;
  }

  @override
  Future<void> upsert({
    required String title,
    required DateTime date,
    String description = '',
    int? id,
  }) async {
    final task = Task(
      id: id ?? tasks.length + 1,
      title: title,
      description: description,
      date: date.dateOnly,
    );
    tasks
      ..removeWhere((t) => t.id == task.id)
      ..add(task);
    _changes.add(null);
  }

  @override
  Future<void> delete(int id) async {
    tasks.removeWhere((t) => t.id == id);
    _changes.add(null);
  }
}
