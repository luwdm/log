import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/domain/date_time_extensions.dart';
import 'package:work_log/domain/task_repository.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/router/router.dart';
import 'package:work_log/task_board/bloc/task_board_bloc.dart';
import 'package:work_log/task_board/widgets/widgets.dart';

class const TaskBoardPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBoardBloc(context.read<TaskRepository>())
            ..add(TaskBoardWeekRequested(DateTime.now())),
      child: const TaskBoardPageView(),
    );
  }
}

class const TaskBoardPageView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const _WeekTitle(),
        centerTitle: true,
        leading: IconButton(
          tooltip: l10n.logs,
          onPressed: () => const LogsRoute().go(context),
          icon: const Icon(Icons.book_outlined),
        ),
        actions: const [_WeekNavigation(), SizedBox(width: 8)],
      ),
      body: const _TaskBoardBody(),
    );
  }
}

class const _WeekTitle() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final weekStart = context.select(
      (TaskBoardBloc bloc) => bloc.state.weekStart,
    );
    return Text(l10n.weekOfDateFormat(weekStart));
  }
}

class const _WeekNavigation() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<TaskBoardBloc>();
    final weekStart = context.select(
      (TaskBoardBloc bloc) => bloc.state.weekStart,
    );

    void showWeekOf(DateTime day) => bloc.add(TaskBoardWeekRequested(day));

    return Row(
      mainAxisSize: .min,
      children: [
        IconButton(
          tooltip: l10n.previousWeek,
          onPressed: () => showWeekOf(weekStart.addDays(-DateTime.daysPerWeek)),
          icon: const Icon(Icons.chevron_left),
        ),
        TextButton(
          onPressed: () => showWeekOf(DateTime.now()),
          child: Text(l10n.today),
        ),
        IconButton(
          tooltip: l10n.nextWeek,
          onPressed: () => showWeekOf(weekStart.addDays(DateTime.daysPerWeek)),
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class const _TaskBoardBody() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = context.watch<TaskBoardBloc>().state;

    return switch (state.status) {
      .loading => const Center(child: CircularProgressIndicator()),
      .failure => Center(child: Text(l10n.somethingWentWrong)),
      .success => _Board(state: state),
    };
  }
}

class const _Board({required final TaskBoardState state})
    extends StatelessWidget {
  static const _columnWidth = 280.0;
  static const _spacing = 12.0;
  static const _padding = 16.0;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return LayoutBuilder(
      builder: (context, constraints) {
        const days = DateTime.daysPerWeek;
        final availableWidth =
            constraints.maxWidth - 2 * _padding - (days - 1) * _spacing;
        // Columns share the width on wide screens and scroll horizontally on
        // narrow screens.
        final columnWidth = availableWidth / days > _columnWidth
            ? availableWidth / days
            : _columnWidth;

        return SingleChildScrollView(
          scrollDirection: .horizontal,
          padding: const .all(_padding),
          child: Row(
            crossAxisAlignment: .start,
            spacing: _spacing,
            children: [
              for (final day in state.days)
                SizedBox(
                  width: columnWidth,
                  height: constraints.maxHeight - 2 * _padding,
                  child: TaskBoardColumn(
                    day: day,
                    isToday: day.isSameDay(today),
                    tasks: state.tasksOn(day),
                    onAddPressed: () => AddTaskRoute(date: day).go(context),
                    onTaskPressed: (task) =>
                        UpdateTaskRoute($extra: task).go(context),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
