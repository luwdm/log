import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:work_log/formz/formz.dart';

class const UpsertTaskState({
  final RequiredInput title = const .pure(),
  final String description = '',
  final FormzSubmissionStatus status = .initial,
  final int? id,
}) with Equatable, FormzMixin {
  UpsertTaskState copyWith({
    RequiredInput? title,
    String? description,
    FormzSubmissionStatus? status,
    int? id,
  }) => UpsertTaskState(
    title: title ?? this.title,
    description: description ?? this.description,
    status: status ?? this.status,
    id: id ?? this.id,
  );

  @override
  List<Object?> get props => [title, description, status, id];

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [title];
}
