import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/log_repository.dart';
import 'package:work_log/upsert_log/formz/required_input.dart';
import 'package:work_log/upsert_log/upsert_log.dart';

part 'upsert_log_state.dart';

class UpsertLogCubit({
  required final LogRepository _logRepository,
  LogTableData? log,
}) extends Cubit<UpsertLogState> {
  this
    : super(() {
        if (log == null) return const UpsertLogState();
        return UpsertLogState(
          accomplishments: .dirty(log.accomplishments),
          nextSteps: .dirty(log.nextThings),
          improvements: log.improvements,
          logDate: log.date,
          logId: log.id,
        );
      }());

  @override
  void emit(UpsertLogState state) {
    if (isClosed) return;
    super.emit(state);
  }

  void changeAccomplishments(String value) {
    emit(state.copyWith(accomplishments: .dirty(value)));
  }

  void changeImprovements(String value) {
    emit(state.copyWith(improvements: value));
  }

  void changeNextThings(String value) {
    emit(state.copyWith(nextSteps: .dirty(value)));
  }

  Future<void> upsertLog() async {
    emit(
      state.copyWith(
        accomplishments: .dirty(state.accomplishments.value),
        nextSteps: .dirty(state.nextSteps.value),
      ),
    );
    final isFormValid = Formz.validate([
      state.accomplishments,
      state.nextSteps,
    ]);
    if (!isFormValid) return;
    if (state.status == .inProgress) return;
    try {
      await _logRepository.upsert(
        id: state.logId,
        accomplishments: state.accomplishments.value,
        nextThings: state.nextSteps.value,
        improvements: state.improvements,
        date: state.logDate,
      );
      emit(state.copyWith(status: .success));
    } on Exception catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(state.copyWith(status: .failure));
    }
  }
}
