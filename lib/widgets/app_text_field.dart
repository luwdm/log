import 'package:material_ui/material_ui.dart';

class AppTextField extends StatelessWidget {
  const new({required this.labelText, required this.onChanged, super.key});

  final String labelText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Text(labelText, style: textTheme.titleMedium),  
        TextField(onChanged: onChanged),
      ],
    );
  }
}
