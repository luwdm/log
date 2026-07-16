import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:task_repository/task_repository.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit({required TaskRepository taskRepository})
    : _taskRepository = taskRepository,
      super(const AddTaskState());

  final TaskRepository _taskRepository;

  void taskTitleChanged(String value) {
    final taskTitle = TaskTitle.dirty(value);
    emit(
      state.copyWith(
        taskTitle: taskTitle,
        isFormValid: Formz.validate([taskTitle]),
      ),
    );
  }

  Future<void> createTask() async {
    if (!state.isFormValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _taskRepository.createTask(description: state.taskTitle.value);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on CreateTaskFailure catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure, error: error));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
