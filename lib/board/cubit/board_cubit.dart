import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit({required this._taskRepository})
    : super(const BoardLoadingState());

  final TaskRepository _taskRepository;
  StreamSubscription<List<Task>>? _tasksSubscription;

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }

  Future<void> getTasks() async {
    emit(const BoardLoadingState());
    try {
      final tasksStream = _taskRepository.getTasks();
      _tasksSubscription = tasksStream.listen(_tasksChanged);
    } catch (_) {
      emit(const BoardErrorState());
    }
  }

  void _tasksChanged(List<Task> tasks) {
    emit(BoardSuccessState(tasks: tasks));
  }
}
