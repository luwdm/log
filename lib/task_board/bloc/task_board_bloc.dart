import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/domain/date_time_extensions.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/domain/task_repository.dart';

part 'task_board_event.dart';
part 'task_board_state.dart';

class TaskBoardBloc(final TaskRepository _taskRepository)
    extends Bloc<TaskBoardEvent, TaskBoardState> {
  this : super(TaskBoardState(weekStart: DateTime.now().startOfWeek)) {
    // Only the most recently requested week is watched.
    on<TaskBoardWeekRequested>(_onWeekRequested, transformer: restartable());
  }

  Future<void> _onWeekRequested(
    TaskBoardWeekRequested event,
    Emitter<TaskBoardState> emit,
  ) async {
    final weekStart = event.day.startOfWeek;
    if (weekStart != state.weekStart) {
      emit(TaskBoardState(weekStart: weekStart));
    }

    await emit.forEach(
      _taskRepository.watchWeek(weekStart),
      onData: (tasks) =>
          state.copyWith(status: TaskBoardStatus.success, tasks: tasks),
      onError: (error, stackTrace) {
        addError(error, stackTrace);
        return state.copyWith(status: TaskBoardStatus.failure);
      },
    );
  }
}
