part of 'logs_cubit.dart';

sealed class LogsState with Equatable {
  const LogsState();

  @override
  List<Object?> get props => [];
}

class LogsLoadingState extends LogsState {
  const LogsLoadingState();
}

class LogsSuccessState extends LogsState {
  const LogsSuccessState(this.logs);

  final List<LogTableData> logs;

  @override
  List<Object?> get props => [logs];
}

class LogsFailureState extends LogsState {
  const LogsFailureState();
}
