// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_dao.dart';

// ignore_for_file: type=lint
mixin _$LogDaoMixin on DatabaseAccessor<Database> {
  $LogTableTable get logTable => attachedDatabase.logTable;
  LogDaoManager get managers => LogDaoManager(this);
}

class LogDaoManager {
  final _$LogDaoMixin _db;
  LogDaoManager(this._db);
  $$LogTableTableTableManager get logTable =>
      $$LogTableTableTableManager(_db.attachedDatabase, _db.logTable);
}
