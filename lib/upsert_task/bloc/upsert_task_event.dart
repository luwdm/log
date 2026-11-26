part of 'upsert_task_bloc.dart';

sealed class const UpsertTaskEvent() with Equatable {
  @override
  List<Object?> get props => [];
}

final class const UpsertTaskTitleChanged(final String title)
    extends UpsertTaskEvent {
  @override
  List<Object?> get props => [title];
}

final class const UpsertTaskDescriptionChanged(final String description)
    extends UpsertTaskEvent {
  @override
  List<Object?> get props => [description];
}

final class const UpsertTaskDateChanged(final DateTime date)
    extends UpsertTaskEvent {
  @override
  List<Object?> get props => [date];
}

final class const UpsertTaskSubmitted() extends UpsertTaskEvent;

final class const UpsertTaskDeleted() extends UpsertTaskEvent;
