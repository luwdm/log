part of 'add_log_cubit.dart';

class const AddLogState({
  final AccomplishmentsInput accomplishments = const .pure(),
  final NextStepsInput nextSteps = const .pure(),
  final String improvements = '',
  final FormzSubmissionStatus status = .initial,
  final bool isFormValid = false,
}) with Equatable {
  AddLogState copyWith({
    AccomplishmentsInput? accomplishments,
    NextStepsInput? nextSteps,
    String? improvements,
    FormzSubmissionStatus? status,
    bool? isFormValid,
  }) {
    return AddLogState(
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
