import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:work_log/domain/log_repository.dart';

part 'delete_log_state.dart';

class DeleteLogCubit({
  required final LogRepository _logRepository,
  required final int id,
}) extends Cubit<DeleteLogState> {
  this : super(DeleteLogState(id: id));

  Future<void> delete() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(status: .inProgress));
    try {
      await _logRepository.delete(state.id);
      emit(state.copyWith(status: .success));
    } on Exception catch (e) {
      addError(e);
      emit(state.copyWith(status: .failure));
    }
  }
}
