import 'package:equatable/equatable.dart';

sealed class const ScheduleState() with Equatable {
  @override
  List<Object?> get props => [];
}

class const ScheduleInitialState() extends ScheduleState;

class const ScheduleLoadingState() extends ScheduleState;

class const ScheduleSuccessState() extends ScheduleState {
  
}

class const ScheduleFailureState() extends ScheduleState {
  
}
