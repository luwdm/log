import 'package:material_ui/material_ui.dart';
import 'package:work_log/preview/app_preview.dart';

class UpsertLogItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Achievements',
            maintainLabelSize: true,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Improvements',
            maintainLabelSize: true,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Improvements',
            maintainLabelSize: true,
          ),
        ),
      ],
    );
  }
}

@AppPreview(group: 'AddLogItem')
Widget addLogItemPreview() {
  return SizedBox(width: 400, child: const UpsertLogItem());
}
