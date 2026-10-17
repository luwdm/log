import 'package:material_ui/material_ui.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/log_repository.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/logs/cubit/logs_cubit.dart';
import 'package:work_log/logs/widgets/logs_item.dart';
import 'package:work_log/logs/widgets/widgets.dart';
import 'package:work_log/router/router.dart';

class const LogsPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogsCubit(context.read<LogRepository>()),
      child: const LogsPageView(),
    );
  }
}

@Preview()
Widget logsPageViewPreview() {
  return const LogsPageView();
}

class const LogsPageView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(l10n.logs),
            actions: const [AddLogButton(), SizedBox(width: 16)],
          ),
          const SliverPadding(
            padding: .symmetric(horizontal: 16),
            sliver: _SliverLogsBody(),
          ),
        ],
      ),
    );
  }
}

class AddLogButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return FilledButton(
      onPressed: () => const AddLogRoute().go(context),
      child: Text(l10n.addLog),
    );
  }
}

class const _SliverLogsBody() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.select((LogsCubit cubit) => cubit.state);

    return switch (state) {
      LogsLoadingState() => const SliverToBoxAdapter(child: LoadingIndicator()),
      LogsFailureState() => const SliverToBoxAdapter(child: LogsError()),
      LogsSuccessState() => SliverLogList(logs: state.logs),
    };
  }
}

class const LoadingIndicator({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: const .all(16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class const LogsError({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Error');
  }
}

class const SliverLogList({required final List<LogTableData> logs, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) return const SliverToBoxAdapter(child: LogsIntro());
    return SliverList.separated(
      itemCount: logs.length,
      itemBuilder: (context, index) {
        final log = logs[index];
        return LogsItem(
          onPressed: () => UpdateLogRoute($extra: log).go(context),
          accomplishments: log.accomplishments,
          improvements: log.improvements,
          nextThings: log.nextThings,
        );
      },
      separatorBuilder: (_, _) => const SizedBox(height: 24),
    );
  }
}
