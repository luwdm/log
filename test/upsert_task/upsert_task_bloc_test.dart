import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/upsert_log/formz/required_input.dart';
import 'package:work_log/upsert_task/bloc/upsert_task_bloc.dart';

import '../helpers/fake_task_repository.dart';

void main() {
  late FakeTaskRepository repository;

  final date = DateTime(2026, 11, 25);
  final task = Task(id: 1, title: 'Draft', description: 'Notes', date: date);

  setUp(() => repository = FakeTaskRepository());

  group('UpsertTaskBloc', () {
    blocTest<UpsertTaskBloc, UpsertTaskState>(
      'does not add a task without a title',
      build: () => UpsertTaskBloc(taskRepository: repository, date: date),
      act: (bloc) => bloc.add(const UpsertTaskSubmitted()),
      expect: () => [UpsertTaskState(date: date, title: const .dirty(''))],
      verify: (_) => expect(repository.tasks, isEmpty),
    );

    blocTest<UpsertTaskBloc, UpsertTaskState>(
      'adds a task to the given day',
      build: () => UpsertTaskBloc(
        taskRepository: repository,
        date: DateTime(2026, 11, 25, 9),
      ),
      act: (bloc) => bloc
        ..add(const UpsertTaskTitleChanged(' Write report '))
        ..add(const UpsertTaskDescriptionChanged('Quarterly numbers'))
        ..add(const UpsertTaskSubmitted()),
      skip: 3,
      expect: () => [
        UpsertTaskState(
          date: date,
          title: const .dirty('Write report'),
          description: 'Quarterly numbers',
          status: FormzSubmissionStatus.inProgress,
        ),
        UpsertTaskState(
          date: date,
          title: const .dirty('Write report'),
          description: 'Quarterly numbers',
          status: FormzSubmissionStatus.success,
        ),
      ],
      verify: (_) => expect(repository.tasks, [
        Task(
          id: 1,
          title: 'Write report',
          description: 'Quarterly numbers',
          date: date,
        ),
      ]),
    );

    blocTest<UpsertTaskBloc, UpsertTaskState>(
      'moves an existing task to another day',
      setUp: () => repository.tasks.add(task),
      build: () =>
          UpsertTaskBloc(taskRepository: repository, date: date, task: task),
      act: (bloc) => bloc
        ..add(UpsertTaskDateChanged(DateTime(2026, 11, 27)))
        ..add(const UpsertTaskSubmitted()),
      verify: (bloc) {
        expect(bloc.state.status, FormzSubmissionStatus.success);
        expect(repository.tasks, [
          Task(
            id: 1,
            title: 'Draft',
            description: 'Notes',
            date: DateTime(2026, 11, 27),
          ),
        ]);
      },
    );

    blocTest<UpsertTaskBloc, UpsertTaskState>(
      'deletes an existing task',
      setUp: () => repository.tasks.add(task),
      build: () =>
          UpsertTaskBloc(taskRepository: repository, date: date, task: task),
      act: (bloc) => bloc.add(const UpsertTaskDeleted()),
      expect: () => [
        UpsertTaskState(
          date: date,
          title: const RequiredInput.dirty('Draft'),
          description: 'Notes',
          taskId: 1,
          status: FormzSubmissionStatus.inProgress,
        ),
        UpsertTaskState(
          date: date,
          title: const RequiredInput.dirty('Draft'),
          description: 'Notes',
          taskId: 1,
          status: FormzSubmissionStatus.success,
        ),
      ],
      verify: (_) => expect(repository.tasks, isEmpty),
    );
  });
}
