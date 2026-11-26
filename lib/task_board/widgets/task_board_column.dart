import 'package:material_ui/material_ui.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/task_board/widgets/task_card.dart';

/// A column of the task board showing the tasks of a single [day].
class const TaskBoardColumn({
  required final DateTime day,
  required final List<Task> tasks,
  required final VoidCallback onAddPressed,
  required final ValueChanged<Task> onTaskPressed,
  final bool isToday = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    final headerColor = isToday ? colorScheme.primary : colorScheme.onSurface;

    return Material(
      color: isToday
          ? colorScheme.primaryContainer.withValues(alpha: 0.4)
          : colorScheme.surfaceContainerLow,
      borderRadius: .circular(24),
      child: Padding(
        padding: const .all(12),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 12,
          children: [
            Padding(
              padding: const .symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    l10n.taskBoardWeekdayFormat(day),
                    style: textTheme.titleMedium?.copyWith(color: headerColor),
                  ),
                  Text(
                    l10n.taskBoardDayFormat(day),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: tasks.isEmpty
                  ? Padding(
                      padding: const .symmetric(horizontal: 4),
                      child: Text(
                        l10n.noTasks,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return TaskCard(
                          title: task.title,
                          description: task.description,
                          onPressed: () => onTaskPressed(task),
                        );
                      },
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                    ),
            ),
            TextButton.icon(
              onPressed: onAddPressed,
              icon: const Icon(Icons.add),
              label: Text(l10n.addTask),
            ),
          ],
        ),
      ),
    );
  }
}
