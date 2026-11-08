import 'package:flutter/widgets.dart';

class const NoContentPlaceholder({required final Text title, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [title]);
  }
}
