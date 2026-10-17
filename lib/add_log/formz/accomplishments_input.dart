import 'package:formz/formz.dart';

enum AccomplishmentsError { required }

class AccomplishmentsInput extends FormzInput<String, AccomplishmentsError> {
  const new pure() : super.pure('');
  const new dirty([super.value = '']) : super.dirty();

  @override
  AccomplishmentsError? validator(String value) =>
      value.isEmpty ? .required : null;
}
