part of 'task_board_bloc.dart';

sealed class const TaskBoardEvent() with Equatable {
  @override
  List<Object?> get props => [];
}

/// Shows the week that contains [day].
final class const TaskBoardWeekRequested(final DateTime day)
    extends TaskBoardEvent {
  @override
  List<Object?> get props => [day];
}
