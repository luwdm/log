part of 'logs_cubit.dart';

sealed class const LogsState() with Equatable {
  @override
  List<Object?> get props => [];
}

class const LogsLoadingState() extends LogsState;

class const LogsSuccessState(final List<LogTableData> logs) extends LogsState {
  @override
  List<Object?> get props => [logs];
}

class const LogsFailureState() extends LogsState;
