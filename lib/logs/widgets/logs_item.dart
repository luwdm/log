import 'package:material_ui/material_ui.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';

class LogsItem extends StatelessWidget {
  const LogsItem({
    required this.onPressed,
    required this.accomplishments,
    required this.improvements,
    required this.nextThings,
    super.key,
  });

  final String accomplishments;
  final String improvements;
  final String nextThings;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    return Material(
      type: .card,
      color: colorScheme.surfaceContainer,
      borderRadius: .circular(32),
      child: InkWell(
        onTap: onPressed,
        borderRadius: .circular(32),
        child: Padding(
          padding: const .symmetric(horizontal: 20, vertical: 20),
          child: Row(
            spacing: 16,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .stretch,
                  mainAxisSize: .min,
                  spacing: 12,
                  children: [
                    Text('21. Okt 2026', style: textTheme.titleLarge),
                    _Prompt(
                      label: l10n.accomplishments,
                      answer: accomplishments,
                    ),
                    _Prompt(label: l10n.nextStep, answer: nextThings),
                    if (improvements.isNotEmpty)
                      _Prompt(
                        label: l10n.plannedImprovements,
                        answer: improvements,
                      ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, size: 32, color: colorScheme.onSurface),
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

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
        ),
        Text(
          answer,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
