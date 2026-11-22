import 'package:formz/formz.dart';

enum RequiredInputError { required }

class RequiredInput extends FormzInput<String, RequiredInputError> {
  const new pure() : super.pure('');
  const new dirty(super.value) : super.dirty();

  @override
  RequiredInputError? validator(String value) =>
      value.isEmpty ? .required : null;
}
