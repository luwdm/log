// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dao.dart';

// ignore_for_file: type=lint
mixin _$ScheduleDaoMixin on DatabaseAccessor<Database> {
  $TaskTableTable get taskTable => attachedDatabase.taskTable;
  $ScheduleTableTable get scheduleTable => attachedDatabase.scheduleTable;
  ScheduleDaoManager get managers => ScheduleDaoManager(this);
}

class ScheduleDaoManager {
  final _$ScheduleDaoMixin _db;
  ScheduleDaoManager(this._db);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db.attachedDatabase, _db.taskTable);
  $$ScheduleTableTableTableManager get scheduleTable =>
      $$ScheduleTableTableTableManager(_db.attachedDatabase, _db.scheduleTable);
}
