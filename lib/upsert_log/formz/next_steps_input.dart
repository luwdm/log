import 'package:formz/formz.dart';

enum NextStepsError { required }

class NextStepsInput extends FormzInput<String, NextStepsError> {
  const new pure() : super.pure('');
  const new dirty(super.value) : super.dirty();

  @override
  NextStepsError? validator(String value) => value.isEmpty ? .required : null;
}
