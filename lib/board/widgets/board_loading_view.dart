import 'package:flutter/widgets.dart';

class BoardLoadingView extends StatelessWidget {
  const BoardLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Text('Loading'));
  }
}
