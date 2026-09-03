import 'package:flutter/widget_previews.dart';
import 'package:flutter/widgets.dart';

@Preview()
Widget logsItemPreview() {
  return LogsItem();
}

class LogsItem extends StatelessWidget {
  const LogsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: const Text('Hello World'));
  }
}
