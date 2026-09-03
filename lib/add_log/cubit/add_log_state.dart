part of 'add_log_cubit.dart';

enum AddLogFormStatus { initial, inProgress, success, failure }

class const AddLogState({
  final String accomplishments = '',
  final String improvements = '',
  final String ideas = '',
  final String nextThings = '',
  final AddLogFormStatus status = .initial,
}) with Equatable {
  AddLogState copyWith({
    String? accomplishments,
    String? improvements,
    String? ideas,
    String? nextThings,
    AddLogFormStatus? status,
  }) {
    return AddLogState(
      accomplishments: accomplishments ?? this.accomplishments,
      improvements: improvements ?? this.improvements,
      ideas: ideas ?? this.ideas,
      nextThings: nextThings ?? this.nextThings,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    accomplishments,
    improvements,
    ideas,
    nextThings,
    status,
  ];
}
