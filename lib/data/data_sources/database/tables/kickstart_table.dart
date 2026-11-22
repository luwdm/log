import 'package:drift/drift.dart';

class KickstartTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get scheduledDate => dateTime().unique()();

  DateTimeColumn get date => dateTime().unique()();
  TextColumn get accomplishments => text()();
  TextColumn get improvements => text()();
  TextColumn get nextThings => text()();
}
