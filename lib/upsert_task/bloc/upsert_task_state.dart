part of 'upsert_task_bloc.dart';

class const UpsertTaskState({
  /// The day the task is planned for.
  required final DateTime date,
  final RequiredInput title = const .pure(),
  final String description = '',
  final FormzSubmissionStatus status = .initial,

  /// The id of the existing task. This only exists when updating a task.
  final int? taskId,
}) with Equatable {
  bool get isUpdate => taskId != null;

  UpsertTaskState copyWith({
    DateTime? date,
    RequiredInput? title,
    String? description,
    FormzSubmissionStatus? status,
  }) {
    return UpsertTaskState(
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      taskId: taskId,
    );
  }

  @override
  List<Object?> get props => [date, title, description, status, taskId];
}
