import 'package:equatable/equatable.dart';

/// A task with a description that can be checked.
class Task with EquatableMixin {
  const Task({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.finishedAt,
  });

  /// The id of the task.
  final int id;

  /// The description of the task.
  final String description;

  /// The creation date of the the task.
  final DateTime createdAt;

  /// The date of the last update.
  final DateTime updatedAt;

  /// The date of the last update.
  final DateTime? finishedAt;

  @override
  List<Object?> get props => [
        id,
        description,
        createdAt,
        updatedAt,
        finishedAt,
      ];
}
