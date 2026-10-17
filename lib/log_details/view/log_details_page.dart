import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/log_details/cubit/log_details_cubit.dart';

class const LogDetailsPage({required final LogTableData log, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogDetailsCubit(),
      child: const LogDetailsPageView(),
    );
  }
}

class LogDetailsPageView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Details')));
  }
}
