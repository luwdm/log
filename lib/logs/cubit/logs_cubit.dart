import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/data/data.dart';
import 'package:work_log/domain/domain.dart';

part 'logs_state.dart';

class LogsCubit(final LogRepository _logRepository) extends Cubit<LogsState> {
  this : super(const LogsLoadingState());

  late final StreamSubscription<List<Log>> _logsSubscription;

  void setupLogSubscription() {
    _logsSubscription = _logRepository.watch().listen(
      (logs) => emit(LogsSuccessState(logs)),
    );
  }

  @override
  Future<void> close() {
    unawaited(_logsSubscription.cancel());
    return super.close();
  }
}
