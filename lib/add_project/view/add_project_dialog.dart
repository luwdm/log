import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/add_project/add_project.dart';
import 'package:work_log/add_project/cubit/add_project_cubit.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';

class AddProjectDialog extends StatelessWidget {
  const AddProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProjectCubit(),
      child: const AddProjectDialogView(),
    );
  }
}

class AddProjectDialogView extends StatelessWidget {
  @visibleForTesting
  const AddProjectDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addProject)),
      body: const Placeholder(),
    );
  }
}
