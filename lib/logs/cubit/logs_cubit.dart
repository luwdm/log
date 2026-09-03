import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/log_repository.dart';

part 'logs_state.dart';

class LogsCubit(final LogRepository _logRepository) extends Cubit<LogsState> {
  this : super(const LogsLoadingState()) {
    _logsSubscription = _logRepository.watch().listen(
      (logs) => emit(LogsSuccessState(logs)),
    );
  }

  late final StreamSubscription<List<LogTableData>> _logsSubscription;

  @override
  Future<void> close() {
    _logsSubscription.cancel();
    return super.close();
  }
}
