import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_log/delete_log/delete_log.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';

class DeleteLogDialog extends StatelessWidget {
  const new({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeleteLogCubit(logRepository: context.read(), id: id),
      child: const DeleteLogDialogView(),
    );
  }
}

class DeleteLogDialogView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocListener<DeleteLogCubit, DeleteLogState>(
      listener: (context, state) {
        if (state.status == .failure || state.status == .success) {
          // TODO: Move back to the overview.
        }
      },
      child: AlertDialog(
        title: Text(l10n.deleteLog),
        content: Text(l10n.infoWhenUserIsAboutToDeleteTheLog),
        actions: [
          TextButton(onPressed: context.pop, child: Text(l10n.cancel)),
          FilledButton(
            onPressed: context.read<DeleteLogCubit>().delete,
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }
}
