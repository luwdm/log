import 'package:equatable/equatable.dart';

/// Placeholder to return a value for void functions.
class Unit {
  const Unit._();
}

const unit = Unit._();

sealed class AsyncState<T> with Equatable {
  const AsyncState();

  const factory AsyncState.initial() = InitialState;

  const factory AsyncState.loading() = LoadingState;

  const factory AsyncState.success(T data) = SuccessState;

  const factory AsyncState.failure(Exception exception) = FailureState;

  bool get isLoading => this is LoadingState;

  @override
  List<Object?> get props => [];
}

class InitialState<T> extends AsyncState<T> {
  const InitialState();
}

class LoadingState<T> extends AsyncState<T> {
  const LoadingState();
}

class SuccessState<T> extends AsyncState<T> {
  const SuccessState(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class FailureState<T> extends AsyncState<T> {
  const FailureState(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
