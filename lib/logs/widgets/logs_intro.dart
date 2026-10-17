import 'package:flutter/material.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';

/// Introduces the user to this simple app.
class LogsIntro extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      spacing: 8,
      children: [
        Text(
          l10n.intro,
          style: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
        ),
        Text(
          l10n.logsterIntro,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
