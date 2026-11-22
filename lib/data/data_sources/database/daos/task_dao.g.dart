// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dao.dart';

// ignore_for_file: type=lint
mixin _$TaskDaoMixin on DatabaseAccessor<Database> {
  $TaskTableTable get taskTable => attachedDatabase.taskTable;
  TaskDaoManager get managers => TaskDaoManager(this);
}

class TaskDaoManager {
  final _$TaskDaoMixin _db;
  TaskDaoManager(this._db);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db.attachedDatabase, _db.taskTable);
}
