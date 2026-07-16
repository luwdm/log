import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import 'package:work_log/async_state/async_state.dart';

part 'check_task_state.dart';

class CheckTaskCubit extends Cubit<CheckTaskState> {
  CheckTaskCubit({required int taskId, required this._taskRepository})
    : super(CheckTaskState(taskId: taskId));

  final TaskRepository _taskRepository;

  Future<void> completeTask() async {
    if (state.completeTaskState.isLoading) return;
    emit(state.copyWith(completeTaskState: const .loading()));
    try {
      await _taskRepository.completeTask(taskId: state.taskId);
      emit(state.copyWith(completeTaskState: const .success(unit)));
    } on Exception catch (exception) {
      emit(state.copyWith(completeTaskState: .failure(exception)));
    }
  }
}
