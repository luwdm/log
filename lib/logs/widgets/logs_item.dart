import 'package:material_ui/material_ui.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';

class LogsItem extends StatelessWidget {
  const LogsItem({
    required this.accomplishments,
    required this.improvements,
    required this.ideas,
    required this.nextThings,
    super.key,
  });

  final String accomplishments;
  final String improvements;
  final String ideas;
  final String nextThings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    return Material(
      color: colorScheme.surfaceContainer,
      borderRadius: .circular(24),
      child: InkWell(
        onTap: () {},
        borderRadius: .circular(24),
        child: Padding(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            spacing: 12,
            children: [
              Text('21. Okt 2026', style: textTheme.titleLarge),
              _Prompt(label: l10n.accomplishments, answer: accomplishments),
              _Prompt(label: l10n.nextStep, answer: nextThings),
              if (ideas.isNotEmpty) _Prompt(label: l10n.ideas, answer: ideas),
              if (improvements.isNotEmpty)
                _Prompt(label: l10n.plannedImprovements, answer: improvements),
            ],
          ),
        ),
      ),
    );
  }
}

class _Prompt extends StatelessWidget {
  const new({required this.label, required this.answer});

  final String label;
  final String answer;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: .circular(8),
      ),
      padding: const .symmetric(horizontal: 12, vertical: 8),

      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(label, style: textTheme.titleMedium),
          Text(answer),
        ],
      ),
    );
  }
}
