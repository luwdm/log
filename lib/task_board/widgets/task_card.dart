import 'package:material_ui/material_ui.dart';

class const TaskCard({
  required final String title,
  required final String description,
  required final VoidCallback onPressed,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Material(
      type: .card,
      color: colorScheme.surfaceContainerHighest,
      borderRadius: .circular(16),
      child: InkWell(
        onTap: onPressed,
        borderRadius: .circular(16),
        child: Padding(
          padding: const .all(12),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 4,
            children: [
              Text(
                title,
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              if (description.isNotEmpty)
                Text(
                  description,
                  maxLines: 3,
                  overflow: .ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
