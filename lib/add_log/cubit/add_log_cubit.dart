import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/domain/log_repository.dart';

part 'add_log_state.dart';

class AddLogCubit(final LogRepository _logRepository)
    extends Cubit<AddLogState> {
  this : super(const AddLogState());

  void changeAccomplishments(String value) {
    emit(state.copyWith(accomplishments: value));
  }

  void changeImprovements(String value) {
    emit(state.copyWith(improvements: value));
  }

  void changeIdeas(String value) {
    emit(state.copyWith(ideas: value));
  }

  void changeNextThings(String value) {
    emit(state.copyWith(nextThings: value));
  }

  Future<void> addLog() async {
    if (state.status == .inProgress) return;
    try {
      await _logRepository.add(
        accomplishments: state.accomplishments,
        improvements: state.improvements,
        ideas: state.ideas,
        nextThings: state.nextThings,
      );
      emit(state.copyWith(status: .success));
    } on Exception catch (e) {
      addError(e);
      emit(state.copyWith(status: .failure));
    }
  }
}
