import 'package:material_ui/material_ui.dart';

class AppTextField extends StatelessWidget {
  const new({
    required this.labelText,
    required this.onChanged,
    this.initialValue,
    this.controller,
    super.key,
  });

  final String labelText;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Text(labelText, style: textTheme.titleMedium),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
