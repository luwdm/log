import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:work_log/domain/date_time_extensions.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/domain/task_repository.dart';
import 'package:work_log/upsert_log/formz/required_input.dart';

part 'upsert_task_event.dart';
part 'upsert_task_state.dart';

class UpsertTaskBloc({
  required final TaskRepository _taskRepository,
  required DateTime date,
  Task? task,
}) extends Bloc<UpsertTaskEvent, UpsertTaskState> {
  this
    : super(
        task == null
            ? UpsertTaskState(date: date.dateOnly)
            : UpsertTaskState(
                title: .dirty(task.title),
                description: task.description,
                date: task.date,
                taskId: task.id,
              ),
      ) {
    on<UpsertTaskTitleChanged>(_onTitleChanged);
    on<UpsertTaskDescriptionChanged>(_onDescriptionChanged);
    on<UpsertTaskDateChanged>(_onDateChanged);
    on<UpsertTaskSubmitted>(_onSubmitted);
    on<UpsertTaskDeleted>(_onDeleted);
  }

  void _onTitleChanged(
    UpsertTaskTitleChanged event,
    Emitter<UpsertTaskState> emit,
  ) {
    emit(state.copyWith(title: .dirty(event.title)));
  }

  void _onDescriptionChanged(
    UpsertTaskDescriptionChanged event,
    Emitter<UpsertTaskState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onDateChanged(
    UpsertTaskDateChanged event,
    Emitter<UpsertTaskState> emit,
  ) {
    emit(state.copyWith(date: event.date.dateOnly));
  }

  Future<void> _onSubmitted(
    UpsertTaskSubmitted event,
    Emitter<UpsertTaskState> emit,
  ) async {
    if (state.status.isInProgress) return;
    final title = RequiredInput.dirty(state.title.value.trim());
    emit(state.copyWith(title: title));
    if (!Formz.validate([title])) return;

    emit(state.copyWith(status: .inProgress));
    try {
      await _taskRepository.upsert(
        id: state.taskId,
        title: title.value,
        description: state.description.trim(),
        date: state.date,
      );
      emit(state.copyWith(status: .success));
    } on Exception catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(state.copyWith(status: .failure));
    }
  }

  Future<void> _onDeleted(
    UpsertTaskDeleted event,
    Emitter<UpsertTaskState> emit,
  ) async {
    final taskId = state.taskId;
    if (taskId == null || state.status.isInProgress) return;

    emit(state.copyWith(status: .inProgress));
    try {
      await _taskRepository.delete(taskId);
      emit(state.copyWith(status: .success));
    } on Exception catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(state.copyWith(status: .failure));
    }
  }
}
