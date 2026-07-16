import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:work_log/add_task/add_task.dart';
import 'package:work_log/extensions/extensions.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(taskRepository: context.read()),
      child: const AddTaskDialogView(),
    );
  }
}

class AddTaskDialogView extends StatelessWidget {
  @visibleForTesting
  const AddTaskDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AlertDialog(
      title: Text(l10n.addTask),
      content: const Column(mainAxisSize: .min, children: [_TaskTitleInput()]),
      actions: [
        TextButton(onPressed: context.pop, child: Text(l10n.cancel)),
        const _AddTaskButton(),
      ],
    );
  }
}

class _TaskTitleInput extends StatelessWidget {
  const _TaskTitleInput();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final diplayError = context.select(
      (AddTaskCubit cubit) => cubit.state.taskTitle.displayError,
    );

    return TextField(
      onChanged: context.read<AddTaskCubit>().taskTitleChanged,
      autofocus: true,
      decoration: InputDecoration(
        labelText: l10n.title,
        errorText: switch (diplayError) {
          .invalid => 'Invalid',
          _ => null,
        },
      ),
      onSubmitted: (_) => context.read<AddTaskCubit>().createTask(),
    );
  }
}

class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final isInProgress = context.select(
      (AddTaskCubit cubit) => cubit.state.status.isInProgress,
    );

    return FilledButton(
      onPressed: !isInProgress ? context.read<AddTaskCubit>().createTask : null,
      child: Text(l10n.add),
    );
  }
}
