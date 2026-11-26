import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/domain/task_repository.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/l10n/extensions/required_input_error_localization.dart';
import 'package:work_log/theme/app_sizes.dart';
import 'package:work_log/upsert_task/bloc/upsert_task_bloc.dart';
import 'package:work_log/widgets/widgets.dart';

class const UpsertTaskPage({
  required final DateTime date,
  final Task? task,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpsertTaskBloc(
        taskRepository: context.read<TaskRepository>(),
        date: date,
        task: task,
      ),
      child: BlocListener<UpsertTaskBloc, UpsertTaskState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == .success) GoRouter.of(context).pop();
        },
        child: const UpsertTaskPageView(),
      ),
    );
  }
}

class const UpsertTaskPageView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isUpdate = context.select(
      (UpsertTaskBloc bloc) => bloc.state.isUpdate,
    );

    return Scaffold(
      appBar: AppBar(title: Text(isUpdate ? l10n.editTask : l10n.addTask)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
              child: Column(
                spacing: 20,
                crossAxisAlignment: .stretch,
                children: [
                  const _TitleInput(),
                  const _DescriptionInput(),
                  const _DateInput(),
                  const _UpsertButton(),
                  if (isUpdate) const _DeleteButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class const _TitleInput() extends StatefulWidget {
  @override
  State<_TitleInput> createState() => _TitleInputState();
}

class _TitleInputState extends State<_TitleInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final title = context.read<UpsertTaskBloc>().state.title.value;
    _controller = TextEditingController(text: title);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final error = context.select(
      (UpsertTaskBloc bloc) => bloc.state.title.displayError,
    );

    return AppTextField(
      controller: _controller,
      onChanged: (value) =>
          context.read<UpsertTaskBloc>().add(UpsertTaskTitleChanged(value)),
      labelText: l10n.title,
      errorText: error?.localized(l10n),
    );
  }
}

class const _DescriptionInput() extends StatefulWidget {
  @override
  State<_DescriptionInput> createState() => _DescriptionInputState();
}

class _DescriptionInputState extends State<_DescriptionInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final description = context.read<UpsertTaskBloc>().state.description;
    _controller = TextEditingController(text: description);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppTextField(
      controller: _controller,
      onChanged: (value) => context.read<UpsertTaskBloc>().add(
        UpsertTaskDescriptionChanged(value),
      ),
      labelText: l10n.descriptionOptional,
    );
  }
}

class const _DateInput() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final date = context.select((UpsertTaskBloc bloc) => bloc.state.date);

    Future<void> pickDate() async {
      final bloc = context.read<UpsertTaskBloc>();
      final picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) bloc.add(UpsertTaskDateChanged(picked));
    }

    return Column(
      crossAxisAlignment: .stretch,
      spacing: 8,
      children: [
        Text(
          l10n.day,
          style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
        OutlinedButton.icon(
          onPressed: pickDate,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, 50),
            alignment: .centerLeft,
          ),
          icon: const Icon(Icons.calendar_today_outlined),
          label: Text(l10n.taskDateFormat(date)),
        ),
      ],
    );
  }
}

class const _UpsertButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isUpdate = context.select(
      (UpsertTaskBloc bloc) => bloc.state.isUpdate,
    );

    return FilledButton(
      onPressed: () =>
          context.read<UpsertTaskBloc>().add(const UpsertTaskSubmitted()),
      child: Text(isUpdate ? l10n.update : l10n.add),
    );
  }
}

class const _DeleteButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = ColorScheme.of(context);

    Future<void> confirmDelete() async {
      final bloc = context.read<UpsertTaskBloc>();
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.deleteTask),
          content: Text(l10n.infoWhenUserIsAboutToDeleteTheTask),
          actions: [
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => context.pop(true),
              child: Text(l10n.delete),
            ),
          ],
        ),
      );
      if (confirmed ?? false) bloc.add(const UpsertTaskDeleted());
    }

    return FilledButton(
      onPressed: confirmDelete,
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onError,
      ),
      child: Text(l10n.delete),
    );
  }
}
