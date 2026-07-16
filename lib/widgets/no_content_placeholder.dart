import 'package:flutter/widgets.dart';

class NoContentPlaceholder extends StatelessWidget {
  const NoContentPlaceholder({required this.title, super.key});

  final Text title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [title]);
  }
}
