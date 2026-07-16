part of 'check_task_cubit.dart';

final class CheckTaskState with Equatable {
  const CheckTaskState({
    required this.taskId,
    this.completeTaskState = const .initial(),
  });

  final int taskId;
  final AsyncState<Unit> completeTaskState;

  CheckTaskState copyWith({int? taskId, AsyncState<Unit>? completeTaskState}) {
    return CheckTaskState(
      taskId: taskId ?? this.taskId,
      completeTaskState: completeTaskState ?? this.completeTaskState,
    );
  }

  @override
  List<Object?> get props => [taskId, completeTaskState];
}
