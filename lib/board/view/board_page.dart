import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/board/board.dart';
import 'package:work_log/extensions/build_context_ext.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BoardCubit(taskRepository: context.read())..getTasks(),
      child: const BoardView(),
    );
  }
}

class BoardView extends StatelessWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: Text(l10n.tasks)),
          const BoardBody(),
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
      BoardSuccessState() => BoardSuccessView(tasks: state.tasks),
    };
  }
}

// TODO: Display done tickets? and show opens one
