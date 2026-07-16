import 'package:flutter/widgets.dart';

class BoardErrorView extends StatelessWidget {
  const BoardErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Text('Error'));
  }
}
