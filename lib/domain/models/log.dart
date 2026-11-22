import 'package:equatable/equatable.dart';

class const Log({
  required final int id,
  required final DateTime date,
  required final String accomplishments,
  required final String improvements,
  required final String nextThings,
}) with Equatable {
  @override
  List<Object?> get props => [
    id,
    date,
    accomplishments,
    improvements,
    nextThings,
  ];
}
