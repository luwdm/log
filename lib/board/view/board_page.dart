import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_log/board/cubit/board_cubit.dart';
import 'package:work_log/board/view/board_view.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardCubit(
        taskRepository: context.read(),
      )..getTasks(),
      child: const BoardView(),
    );
  }
}
