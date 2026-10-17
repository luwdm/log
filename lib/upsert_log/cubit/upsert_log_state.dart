part of 'upsert_log_cubit.dart';

class const UpsertLogState({
  final AccomplishmentsInput accomplishments = const .pure(),
  final NextStepsInput nextSteps = const .pure(),
  final String improvements = '',
  final FormzSubmissionStatus status = .initial,
  final bool isFormValid = false,
}) with Equatable {
  UpsertLogState copyWith({
    AccomplishmentsInput? accomplishments,
    NextStepsInput? nextSteps,
    String? improvements,
    FormzSubmissionStatus? status,
    bool? isFormValid,
  }) {
    return UpsertLogState(
      accomplishments: accomplishments ?? this.accomplishments,
      improvements: improvements ?? this.improvements,
      nextSteps: nextSteps ?? this.nextSteps,
      status: status ?? this.status,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [
    accomplishments,
    improvements,
    nextSteps,
    status,
    isFormValid,
  ];
}
