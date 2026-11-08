import 'package:material_ui/material_ui.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/theme/app_sizes.dart';

class const LogsItem({
  required final VoidCallback onPressed,
  required final String accomplishments,
  required final String improvements,
  required final String nextThings,
  required final DateTime date,
  super.key,
}) extends StatelessWidget {
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
        child: Container(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          padding: const .symmetric(horizontal: 20, vertical: 20),
          child: Row(
            spacing: 16,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: .stretch,
                  mainAxisSize: .min,
                  spacing: 12,
                  children: [
                    Text(l10n.logDateFormat(date), style: textTheme.titleLarge),
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
          style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
        Text(
          answer,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
