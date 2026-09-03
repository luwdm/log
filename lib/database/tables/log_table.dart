import 'package:drift/drift.dart';

class LogTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get accomplishments => text()();
  TextColumn get improvements => text()();
  TextColumn get ideas => text()();
  TextColumn get nextThings => text()();
}
