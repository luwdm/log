import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/add_log/cubit/add_log_cubit.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/widgets/widgets.dart';

class AddLogPage extends StatelessWidget {
  const new({this.log, super.key});

  final LogTableData? log;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddLogCubit(logRepository: context.read(), log: log),
      child: BlocListener<AddLogCubit, AddLogState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == .success) {
            GoRouter.of(context).pop();
          }
        },
        child: const AddLogPageView(),
      ),
    );
  }
}

class AddLogPageView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addLog)),
      body: const Padding(
        padding: .symmetric(horizontal: 16, vertical: 12),
        child: Column(
          spacing: 20,
          crossAxisAlignment: .stretch,
          children: [
            _AccomplishmentsInput(),
            _NextStepsInput(),
            _ImprovementsInput(),
            _AddButton(),
          ],
        ),
      ),
    );
  }
}

class _AccomplishmentsInput extends StatefulWidget {
  const new();

  @override
  State<_AccomplishmentsInput> createState() => _AccomplishmentsInputState();
}

class _AccomplishmentsInputState extends State<_AccomplishmentsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final accomplishments = BlocProvider.of<AddLogCubit>(context)
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

    return AppTextField(
      controller: _controller,
      onChanged: context.read<AddLogCubit>().changeAccomplishments,
      labelText: l10n.whatDidYouAccomplishToday,
    );
  }
}

class _ImprovementsInput extends StatefulWidget {
  const new();

  @override
  State<_ImprovementsInput> createState() => _ImprovementsInputState();
}

class _ImprovementsInputState extends State<_ImprovementsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final improvements = BlocProvider.of<AddLogCubit>(context)
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
      onChanged: context.read<AddLogCubit>().changeImprovements,
      labelText: l10n.whatCanYouImproveOptional,
    );
  }
}

class _NextStepsInput extends StatefulWidget {
  const new();

  @override
  State<_NextStepsInput> createState() => _NextStepsInputState();
}

class _NextStepsInputState extends State<_NextStepsInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final nextSteps = BlocProvider.of<AddLogCubit>(context)
        .state
        .nextSteps
        .value;
    _controller = TextEditingController(text: nextSteps);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppTextField(
      controller: _controller,
      onChanged: context.read<AddLogCubit>().changeNextThings,
      labelText: l10n.whatsTheNextStep,
    );
  }
}

class _AddButton extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return FilledButton(
      onPressed: context.read<AddLogCubit>().addLog,
      child: Text(l10n.add),
    );
  }
}
