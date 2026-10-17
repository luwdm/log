import 'package:drift/drift.dart';

class LogTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get accomplishments => text()();
  TextColumn get improvements => text()();
  TextColumn get nextThings => text()();
}
