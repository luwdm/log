import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/data/data.dart';
import 'package:work_log/schedule/schedule.dart';

class ScheduleCubit({required final ScheduleRepository _scheduleRepository})
    extends Cubit<ScheduleState> {
  this : super(const ScheduleInitialState());
}
