import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/add_log/cubit/add_log_cubit.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/widgets/widgets.dart';

class AddLogPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddLogCubit(context.read()),
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
            _NextThingInput(),
            _ImprovementsInput(),
            _IdeasInput(),
            _AddButton(),
          ],
        ),
      ),
    );
  }
}

class _AccomplishmentsInput extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppTextField(
      onChanged: context.read<AddLogCubit>().changeAccomplishments,
      labelText: l10n.whatDidYouAccomplishToday,
    );
  }
}

class _ImprovementsInput extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppTextField(
      onChanged: context.read<AddLogCubit>().changeImprovements,
      labelText: l10n.whatCanYouImproveOptional,
    );
  }
}

class _IdeasInput extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppTextField(
      onChanged: context.read<AddLogCubit>().changeIdeas,
      labelText: l10n.anyIdeasOptional,
    );
  }
}

class _NextThingInput extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppTextField(
      onChanged: context.read<AddLogCubit>().changeNextThings,
      labelText: l10n.whatsTheNextStep,
    );
  }
}

class _AddButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return FilledButton(
      onPressed: context.read<AddLogCubit>().addLog,
      child: Text(l10n.add),
    );
  }
}
