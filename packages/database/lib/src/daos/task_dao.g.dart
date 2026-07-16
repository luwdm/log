// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dao.dart';

// ignore_for_file: type=lint
mixin _$TaskDaoMixin on DatabaseAccessor<Database> {
  $TaskEntityTable get taskEntity => attachedDatabase.taskEntity;
  TaskDaoManager get managers => TaskDaoManager(this);
}

class TaskDaoManager {
  final _$TaskDaoMixin _db;
  TaskDaoManager(this._db);
  $$TaskEntityTableTableManager get taskEntity =>
      $$TaskEntityTableTableManager(_db.attachedDatabase, _db.taskEntity);
}
