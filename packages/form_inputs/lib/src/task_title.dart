import 'package:formz/formz.dart';

/// Validation errors for the []
enum TaskTitleValidationError {
  /// Generic invalid error.
  invalid;
}

/// {@template task_title}
/// Form input for an task title input.
/// {@endtemplate}
class TaskTitle extends FormzInput<String, TaskTitleValidationError> {
  /// {@macro task_title}
  const TaskTitle.pure() : super.pure('');

  /// {@macro task_title}
  const TaskTitle.dirty([super.value = '']) : super.dirty();

  @override
  TaskTitleValidationError? validator(String value) {
    return value.isNotEmpty ? null : TaskTitleValidationError.invalid;
  }
}
