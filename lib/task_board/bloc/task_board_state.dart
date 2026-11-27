part of 'task_board_bloc.dart';

enum TaskBoardStatus { loading, success, failure }

class const TaskBoardState({
  /// The Monday of the shown week.
  required final DateTime weekStart,
  final TaskBoardStatus status = .loading,
  final List<Task> tasks = const [],
}) with Equatable {
  /// The days of the shown week, from Monday to Sunday.
  List<DateTime> get days =>
      List.generate(DateTime.daysPerWeek, weekStart.addDays);

  List<Task> tasksOn(DateTime day) =>
      tasks.where((task) => task.date.isSameDay(day)).toList();

  TaskBoardState copyWith({
    DateTime? weekStart,
    TaskBoardStatus? status,
    List<Task>? tasks,
  }) {
    return TaskBoardState(
      weekStart: weekStart ?? this.weekStart,
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [weekStart, status, tasks];
}
