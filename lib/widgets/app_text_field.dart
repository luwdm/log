import 'package:material_ui/material_ui.dart';

class const AppTextField({
  required final String labelText,
  final ValueChanged<String>? onChanged,
  final String? initialValue,
  final TextEditingController? controller,
  final String? errorText,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Text(
          labelText,
          style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(errorText: errorText),
          minLines: 1,
          // Users should be able to enter whatever they want.
          maxLines: 10000,
        ),
      ],
    );
  }
}
