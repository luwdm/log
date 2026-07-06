import 'package:drift/drift.dart';

/// Database entity of a day.
class DayEntity extends Table {
  /// Combination of year + month + day.
  IntColumn get id => integer().unique()();
}
