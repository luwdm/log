import 'package:drift/drift.dart';

/// Database entity of a tag.
class TagEntity extends Table {
  /// The id of the tag.
  IntColumn get id => integer().autoIncrement()();

  /// The name of the tag.
  TextColumn get name => text()();
}
