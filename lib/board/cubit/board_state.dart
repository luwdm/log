part of 'board_cubit.dart';

sealed class BoardState with Equatable {
  const BoardState();
}

class BoardLoadingState extends BoardState {
  const BoardLoadingState();

  @override
  List<Object?> get props => [];
}

class BoardSuccessState extends BoardState {
  const BoardSuccessState({required this.tasks});

  final List<Task> tasks;

  @override
  List<Object?> get props => [tasks];
}

class BoardErrorState extends BoardState {
  const BoardErrorState();

  @override
  List<Object?> get props => [];
}
