import 'package:equatable/equatable.dart';

/// A task planned for a day of the week.
class const Task({
  required final int id,
  required final String title,
  required final String description,

  /// The day the task is planned for, without a time of day.
  required final DateTime date,
}) with Equatable {
  @override
  List<Object?> get props => [id, title, description, date];
}
