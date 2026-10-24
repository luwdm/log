import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/delete_log/delete_log.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/router/router.dart';

class const DeleteLogDialog({required final int id, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeleteLogCubit(logRepository: context.read(), id: id),
      child: const DeleteLogDialogView(),
    );
  }
}

class const DeleteLogDialogView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocListener<DeleteLogCubit, DeleteLogState>(
      listener: (context, state) {
        if (state.status == .failure || state.status == .success) {
          const LogsRoute().go(context);
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
