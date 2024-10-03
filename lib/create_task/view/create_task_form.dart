import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:work_log/create_task/cubit/create_task_cubit.dart';

class CreateTaskForm extends StatelessWidget {
  const CreateTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Create task failed')));
          Navigator.of(context).pop();
        } else if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Created task')));
          Navigator.of(context).pop();
        }
      },
      child: AlertDialog(
        title: const Text('Create Task'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TaskTitleInput(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text('Close'),
          ),
          const _CreateTaskButton(),
        ],
      ),
    );
  }
}

class _TaskTitleInput extends StatelessWidget {
  const _TaskTitleInput();

  @override
  Widget build(BuildContext context) {
    final taskTitle = context.select(
      (CreateTaskCubit cubit) => cubit.state.taskTitle,
    );

    return TextField(
      onChanged: context.read<CreateTaskCubit>().taskTitleChanged,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Title',
        errorText: switch (taskTitle.displayError) {
          TaskTitleValidationError.invalid => 'Invalid',
          _ => null,
        },
      ),
      onSubmitted: (_) => context.read<CreateTaskCubit>().createTask(),
    );
  }
}

class _CreateTaskButton extends StatelessWidget {
  const _CreateTaskButton();

  @override
  Widget build(BuildContext context) {
    final isFormValid = context.select(
      (CreateTaskCubit cubit) => cubit.state.isFormValid,
    );

    final status = context.select(
      (CreateTaskCubit cubit) => cubit.state.status,
    );

    return FilledButton(
      onPressed: isFormValid && status.isInitial
          ? context.read<CreateTaskCubit>().createTask
          : null,
      child: const Text('Create Task'),
    );
  }
}
