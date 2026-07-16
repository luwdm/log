import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/check_task/check_task.dart';

class CheckTaskListTile extends StatelessWidget {
  const CheckTaskListTile({required this.taskId, super.key});

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CheckTaskCubit(taskId: taskId, taskRepository: context.read()),
      child: const CheckTaskListTileView(),
    );
  }
}

class CheckTaskListTileView extends StatelessWidget {
  @visibleForTesting
  const CheckTaskListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
