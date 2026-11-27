import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/task_board/bloc/task_board_bloc.dart';

import '../helpers/fake_task_repository.dart';

void main() {
  late FakeTaskRepository repository;

  final monday = DateTime(2030, 1, 7);
  final task = Task(
    id: 1,
    title: 'Write report',
    description: '',
    date: DateTime(2030, 1, 9),
  );

  setUp(() => repository = FakeTaskRepository());

  group('TaskBoardBloc', () {
    blocTest<TaskBoardBloc, TaskBoardState>(
      'emits the tasks of the requested week',
      setUp: () => repository.tasks.add(task),
      build: () => TaskBoardBloc(repository),
      act: (bloc) => bloc.add(TaskBoardWeekRequested(DateTime(2030, 1, 10))),
      expect: () => [
        TaskBoardState(weekStart: monday),
        TaskBoardState(weekStart: monday, status: .success, tasks: [task]),
      ],
    );

    blocTest<TaskBoardBloc, TaskBoardState>(
      'emits updated tasks when the week changes in the repository',
      build: () => TaskBoardBloc(repository),
      act: (bloc) async {
        bloc.add(TaskBoardWeekRequested(monday));
        await Future<void>.delayed(Duration.zero);
        await repository.upsert(title: task.title, date: task.date);
      },
      skip: 1,
      expect: () => [
        TaskBoardState(weekStart: monday, status: .success),
        TaskBoardState(weekStart: monday, status: .success, tasks: [task]),
      ],
    );

    blocTest<TaskBoardBloc, TaskBoardState>(
      'only watches the most recently requested week',
      build: () => TaskBoardBloc(repository),
      act: (bloc) async {
        bloc.add(TaskBoardWeekRequested(monday));
        await Future<void>.delayed(Duration.zero);
        bloc.add(TaskBoardWeekRequested(DateTime(2030, 1, 14)));
        await Future<void>.delayed(Duration.zero);
        await repository.upsert(title: task.title, date: task.date);
      },
      verify: (bloc) {
        expect(bloc.state.weekStart, DateTime(2030, 1, 14));
        expect(bloc.state.tasks, isEmpty);
      },
    );
  });

  group('TaskBoardState', () {
    test('has the days from Monday to Sunday', () {
      final state = TaskBoardState(weekStart: monday);
      expect(state.days, [
        for (var day = 7; day <= 13; day++) DateTime(2030, 1, day),
      ]);
    });

    test('groups tasks by day', () {
      final state = TaskBoardState(weekStart: monday, tasks: [task]);
      expect(state.tasksOn(DateTime(2030, 1, 9)), [task]);
      expect(state.tasksOn(DateTime(2030, 1, 8)), isEmpty);
    });
  });
}
