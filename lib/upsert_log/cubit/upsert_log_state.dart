part of 'upsert_log_cubit.dart';

class const UpsertLogState({
  final RequiredInput accomplishments = const .pure(),
  final RequiredInput nextSteps = const .pure(),
  final String improvements = '',
  final FormzSubmissionStatus status = .initial,

  /// The date of the existing log. This only exists in the UpdateScreen.
  final DateTime? logDate,

  /// The id of the existing log.
  final int? logId,
  final bool isFormValid = false,
}) with Equatable {
  UpsertLogState copyWith({
    RequiredInput? accomplishments,
    RequiredInput? nextSteps,
    String? improvements,
    FormzSubmissionStatus? status,
    DateTime? logDate,
    int? logId,
    bool? isFormValid,
  }) {
    return UpsertLogState(
      accomplishments: accomplishments ?? this.accomplishments,
      improvements: improvements ?? this.improvements,
      nextSteps: nextSteps ?? this.nextSteps,
      status: status ?? this.status,
      logDate: logDate ?? this.logDate,
      logId: logId ?? this.logId,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [
    accomplishments,
    improvements,
    nextSteps,
    status,
    logDate,
    logId,
    isFormValid,
  ];
}
