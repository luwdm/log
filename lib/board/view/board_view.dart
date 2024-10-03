import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/board/board.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text('Tasks'),
          ),
          BoardBody(),
        ],
      ),
    );
  }
}

class BoardBody extends StatelessWidget {
  const BoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((BoardCubit cubit) => cubit.state);

    return switch (state) {
      BoardLoadingState() => const BoardLoadingView(),
      BoardErrorState() => const BoardErrorView(),
      BoardSuccessState() => BoardSuccessView(
          tasks: state.tasks,
        ),
    };
  }
}
