import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/delete_log/delete_log.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/l10n/extensions/required_input_error_localization.dart';
import 'package:work_log/upsert_log/cubit/upsert_log_cubit.dart';
import 'package:work_log/widgets/widgets.dart';

class const UpsertLogPage({final LogTableData? log, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpsertLogCubit(logRepository: context.read(), log: log),
      child: BlocListener<UpsertLogCubit, UpsertLogState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == .success) {
            GoRouter.of(context).pop();
          }
        },
        child: const UpsertLogPageView(),
      ),
    );
  }
}

class const UpsertLogPageView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const _AppBarTitle()),
      body: const SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 16, vertical: 12),
          child: Column(
            spacing: 20,
            crossAxisAlignment: .stretch,
            children: [
              _AccomplishmentsInput(),
              _NextStepsInput(),
              _ImprovementsInput(),
              _UpsertButton(),
              _DeleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class const _AppBarTitle() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final date = context.select((UpsertLogCubit cubit) => cubit.state.logDate);
    if (date == null) return Text(l10n.addLog);
    return Text(l10n.logDateFormat(date));
  }
}

class const _AccomplishmentsInput() extends StatefulWidget {
  @override
  State<_AccomplishmentsInput> createState() => _AccomplishmentsInputState();
}

class _AccomplishmentsInputState extends State<_AccomplishmentsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final accomplishments = BlocProvider.of<UpsertLogCubit>(context)
        .state
        .accomplishments
        .value;
    _controller = TextEditingController(text: accomplishments);
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
      (UpsertLogCubit cubit) => cubit.state.accomplishments.displayError,
    );

    return AppTextField(
      controller: _controller,
      onChanged: context.read<UpsertLogCubit>().changeAccomplishments,
      labelText: l10n.whatDidYouAccomplishToday,
      errorText: error?.localized(l10n),
    );
  }
}

class const _ImprovementsInput() extends StatefulWidget {
  @override
  State<_ImprovementsInput> createState() => _ImprovementsInputState();
}

class _ImprovementsInputState extends State<_ImprovementsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final improvements = BlocProvider.of<UpsertLogCubit>(context)
        .state
        .improvements;
    _controller = TextEditingController(text: improvements);
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
      onChanged: context.read<UpsertLogCubit>().changeImprovements,
      labelText: l10n.whatCanYouImproveOptional,
    );
  }
}

class const _NextStepsInput() extends StatefulWidget {
  @override
  State<_NextStepsInput> createState() => _NextStepsInputState();
}

class _NextStepsInputState extends State<_NextStepsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final nextSteps = BlocProvider.of<UpsertLogCubit>(context)
        .state
        .nextSteps
        .value;
    _controller = TextEditingController(text: nextSteps);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final error = context.select(
      (UpsertLogCubit cubit) => cubit.state.nextSteps.displayError,
    );

    return AppTextField(
      controller: _controller,
      onChanged: context.read<UpsertLogCubit>().changeNextThings,
      labelText: l10n.whatsTheNextStep,
      errorText: error?.localized(l10n),
    );
  }
}

class const _UpsertButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final isUpdateScreen = context.select(
      (UpsertLogCubit cubit) => cubit.state.logDate != null,
    );

    final text = isUpdateScreen ? l10n.update : l10n.add;

    return FilledButton(
      onPressed: context.read<UpsertLogCubit>().upsertLog,
      child: Text(text),
    );
  }
}

class const _DeleteButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = ColorScheme.of(context);

    final logId = context.select((UpsertLogCubit cubit) => cubit.state.logId);

    if (logId == null) return const SizedBox.shrink();

    return FilledButton(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => DeleteLogDialog(id: logId),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onError,
        
      ),
      child: Text(l10n.delete),
    );
  }
}
