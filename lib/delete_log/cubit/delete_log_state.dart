part of 'delete_log_cubit.dart';

class const DeleteLogState({
  required final int id,
  final FormzSubmissionStatus status = .initial,
}) with Equatable {
  DeleteLogState copyWith({int? id, FormzSubmissionStatus? status}) {
    return DeleteLogState(id: id ?? this.id, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [id, status];
}
