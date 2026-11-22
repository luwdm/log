import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:work_log/data/data.dart';
import 'package:work_log/upsert_task/upsert_task.dart';

class UpsertTaskCubit({required final TaskRepository _taskRepository})
    extends Cubit<UpsertTaskState> {
  this : super(const UpsertTaskState());

  @override
  void emit(UpsertTaskState state) {
    if (isClosed) return;
    super.emit(state);
  }

  void changeTitle(String title) {
    emit(state.copyWith(title: .dirty(title)));
  }

  void changeDescription(String description) {
    emit(state.copyWith(description: description));
  }

  Future<void> upsertTask() async {
    emit(state.copyWith(title: .dirty(state.title.value)));
    if (state.isNotValid) return;
    if (state.status.isInProgress) return;
    emit(state.copyWith(status: .inProgress));
    try {
      await _taskRepository.upsert(
        id: state.id,
        title: state.title.value,
        description: state.description,
      );
      emit(state.copyWith(status: .success));
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: .failure));
    }
  }
}
