part of 'add_task_cubit.dart';

class AddTaskState with Equatable {
  const AddTaskState({
    this.taskTitle = const TaskTitle.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isFormValid = false,
    this.error,
  });

  final TaskTitle taskTitle;
  final FormzSubmissionStatus status;
  final bool isFormValid;
  final Exception? error;

  @override
  List<Object?> get props => [taskTitle, status, isFormValid, error];

  AddTaskState copyWith({
    TaskTitle? taskTitle,
    FormzSubmissionStatus? status,
    bool? isFormValid,
    Exception? error,
  }) {
    return AddTaskState(
      taskTitle: taskTitle ?? this.taskTitle,
      status: status ?? this.status,
      isFormValid: isFormValid ?? this.isFormValid,
      error: error ?? this.error,
    );
  }
}
