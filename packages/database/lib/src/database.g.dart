// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskEntityTable extends TaskEntity
    with TableInfo<$TaskEntityTable, TaskEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishedAtMeta =
      const VerificationMeta('finishedAt');
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
      'finished_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, createdAt, finishedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TaskEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
          _finishedAtMeta,
          finishedAt.isAcceptableOrUnknown(
              data['finished_at']!, _finishedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      finishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finished_at']),
    );
  }

  @override
  $TaskEntityTable createAlias(String alias) {
    return $TaskEntityTable(attachedDatabase, alias);
  }
}

class TaskEntityData extends DataClass implements Insertable<TaskEntityData> {
  /// The id of the task.
  final int id;

  /// The description of the task.
  final String description;

  /// The creation date of the task.
  final DateTime createdAt;

  /// The date when the user finished the task.
  final DateTime? finishedAt;
  const TaskEntityData(
      {required this.id,
      required this.description,
      required this.createdAt,
      this.finishedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    return map;
  }

  TaskEntityCompanion toCompanion(bool nullToAbsent) {
    return TaskEntityCompanion(
      id: Value(id),
      description: Value(description),
      createdAt: Value(createdAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
    );
  }

  factory TaskEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskEntityData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
    };
  }

  TaskEntityData copyWith(
          {int? id,
          String? description,
          DateTime? createdAt,
          Value<DateTime?> finishedAt = const Value.absent()}) =>
      TaskEntityData(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
      );
  TaskEntityData copyWithCompanion(TaskEntityCompanion data) {
    return TaskEntityData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      finishedAt:
          data.finishedAt.present ? data.finishedAt.value : this.finishedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskEntityData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, createdAt, finishedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskEntityData &&
          other.id == this.id &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.finishedAt == this.finishedAt);
}

class TaskEntityCompanion extends UpdateCompanion<TaskEntityData> {
  final Value<int> id;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> finishedAt;
  const TaskEntityCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
  });
  TaskEntityCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required DateTime createdAt,
    this.finishedAt = const Value.absent(),
  })  : description = Value(description),
        createdAt = Value(createdAt);
  static Insertable<TaskEntityData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? finishedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (finishedAt != null) 'finished_at': finishedAt,
    });
  }

  TaskEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<DateTime?>? finishedAt}) {
    return TaskEntityCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      finishedAt: finishedAt ?? this.finishedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskEntityCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }
}

class $DayEntityTable extends DayEntity
    with TableInfo<$DayEntityTable, DayEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_entity';
  @override
  VerificationContext validateIntegrity(Insertable<DayEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DayEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $DayEntityTable createAlias(String alias) {
    return $DayEntityTable(attachedDatabase, alias);
  }
}

class DayEntityData extends DataClass implements Insertable<DayEntityData> {
  /// Combination of year + month + day.
  final int id;
  const DayEntityData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  DayEntityCompanion toCompanion(bool nullToAbsent) {
    return DayEntityCompanion(
      id: Value(id),
    );
  }

  factory DayEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayEntityData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  DayEntityData copyWith({int? id}) => DayEntityData(
        id: id ?? this.id,
      );
  DayEntityData copyWithCompanion(DayEntityCompanion data) {
    return DayEntityData(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayEntityData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is DayEntityData && other.id == this.id);
}

class DayEntityCompanion extends UpdateCompanion<DayEntityData> {
  final Value<int> id;
  final Value<int> rowid;
  const DayEntityCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayEntityCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DayEntityData> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayEntityCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return DayEntityCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayEntityCompanion(')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayTaskAssignmentTable extends DayTaskAssignment
    with TableInfo<$DayTaskAssignmentTable, DayTaskAssignmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayTaskAssignmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
      'day_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, dayId, taskId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_task_assignment';
  @override
  VerificationContext validateIntegrity(
      Insertable<DayTaskAssignmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayTaskAssignmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayTaskAssignmentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dayId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_id'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
    );
  }

  @override
  $DayTaskAssignmentTable createAlias(String alias) {
    return $DayTaskAssignmentTable(attachedDatabase, alias);
  }
}

class DayTaskAssignmentData extends DataClass
    implements Insertable<DayTaskAssignmentData> {
  final int id;

  /// The id of the day.
  final int dayId;

  /// The id of the task.
  final int taskId;
  const DayTaskAssignmentData(
      {required this.id, required this.dayId, required this.taskId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day_id'] = Variable<int>(dayId);
    map['task_id'] = Variable<int>(taskId);
    return map;
  }

  DayTaskAssignmentCompanion toCompanion(bool nullToAbsent) {
    return DayTaskAssignmentCompanion(
      id: Value(id),
      dayId: Value(dayId),
      taskId: Value(taskId),
    );
  }

  factory DayTaskAssignmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayTaskAssignmentData(
      id: serializer.fromJson<int>(json['id']),
      dayId: serializer.fromJson<int>(json['dayId']),
      taskId: serializer.fromJson<int>(json['taskId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dayId': serializer.toJson<int>(dayId),
      'taskId': serializer.toJson<int>(taskId),
    };
  }

  DayTaskAssignmentData copyWith({int? id, int? dayId, int? taskId}) =>
      DayTaskAssignmentData(
        id: id ?? this.id,
        dayId: dayId ?? this.dayId,
        taskId: taskId ?? this.taskId,
      );
  DayTaskAssignmentData copyWithCompanion(DayTaskAssignmentCompanion data) {
    return DayTaskAssignmentData(
      id: data.id.present ? data.id.value : this.id,
      dayId: data.dayId.present ? data.dayId.value : this.dayId,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayTaskAssignmentData(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dayId, taskId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayTaskAssignmentData &&
          other.id == this.id &&
          other.dayId == this.dayId &&
          other.taskId == this.taskId);
}

class DayTaskAssignmentCompanion
    extends UpdateCompanion<DayTaskAssignmentData> {
  final Value<int> id;
  final Value<int> dayId;
  final Value<int> taskId;
  const DayTaskAssignmentCompanion({
    this.id = const Value.absent(),
    this.dayId = const Value.absent(),
    this.taskId = const Value.absent(),
  });
  DayTaskAssignmentCompanion.insert({
    this.id = const Value.absent(),
    required int dayId,
    required int taskId,
  })  : dayId = Value(dayId),
        taskId = Value(taskId);
  static Insertable<DayTaskAssignmentData> custom({
    Expression<int>? id,
    Expression<int>? dayId,
    Expression<int>? taskId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dayId != null) 'day_id': dayId,
      if (taskId != null) 'task_id': taskId,
    });
  }

  DayTaskAssignmentCompanion copyWith(
      {Value<int>? id, Value<int>? dayId, Value<int>? taskId}) {
    return DayTaskAssignmentCompanion(
      id: id ?? this.id,
      dayId: dayId ?? this.dayId,
      taskId: taskId ?? this.taskId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayTaskAssignmentCompanion(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $TaskEntityTable taskEntity = $TaskEntityTable(this);
  late final $DayEntityTable dayEntity = $DayEntityTable(this);
  late final $DayTaskAssignmentTable dayTaskAssignment =
      $DayTaskAssignmentTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [taskEntity, dayEntity, dayTaskAssignment];
}

typedef $$TaskEntityTableCreateCompanionBuilder = TaskEntityCompanion Function({
  Value<int> id,
  required String description,
  required DateTime createdAt,
  Value<DateTime?> finishedAt,
});
typedef $$TaskEntityTableUpdateCompanionBuilder = TaskEntityCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<DateTime?> finishedAt,
});

class $$TaskEntityTableFilterComposer
    extends Composer<_$Database, $TaskEntityTable> {
  $$TaskEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnFilters(column));
}

class $$TaskEntityTableOrderingComposer
    extends Composer<_$Database, $TaskEntityTable> {
  $$TaskEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnOrderings(column));
}

class $$TaskEntityTableAnnotationComposer
    extends Composer<_$Database, $TaskEntityTable> {
  $$TaskEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => column);
}

class $$TaskEntityTableTableManager extends RootTableManager<
    _$Database,
    $TaskEntityTable,
    TaskEntityData,
    $$TaskEntityTableFilterComposer,
    $$TaskEntityTableOrderingComposer,
    $$TaskEntityTableAnnotationComposer,
    $$TaskEntityTableCreateCompanionBuilder,
    $$TaskEntityTableUpdateCompanionBuilder,
    (
      TaskEntityData,
      BaseReferences<_$Database, $TaskEntityTable, TaskEntityData>
    ),
    TaskEntityData,
    PrefetchHooks Function()> {
  $$TaskEntityTableTableManager(_$Database db, $TaskEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> finishedAt = const Value.absent(),
          }) =>
              TaskEntityCompanion(
            id: id,
            description: description,
            createdAt: createdAt,
            finishedAt: finishedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            required DateTime createdAt,
            Value<DateTime?> finishedAt = const Value.absent(),
          }) =>
              TaskEntityCompanion.insert(
            id: id,
            description: description,
            createdAt: createdAt,
            finishedAt: finishedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TaskEntityTable,
    TaskEntityData,
    $$TaskEntityTableFilterComposer,
    $$TaskEntityTableOrderingComposer,
    $$TaskEntityTableAnnotationComposer,
    $$TaskEntityTableCreateCompanionBuilder,
    $$TaskEntityTableUpdateCompanionBuilder,
    (
      TaskEntityData,
      BaseReferences<_$Database, $TaskEntityTable, TaskEntityData>
    ),
    TaskEntityData,
    PrefetchHooks Function()>;
typedef $$DayEntityTableCreateCompanionBuilder = DayEntityCompanion Function({
  required int id,
  Value<int> rowid,
});
typedef $$DayEntityTableUpdateCompanionBuilder = DayEntityCompanion Function({
  Value<int> id,
  Value<int> rowid,
});

class $$DayEntityTableFilterComposer
    extends Composer<_$Database, $DayEntityTable> {
  $$DayEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));
}

class $$DayEntityTableOrderingComposer
    extends Composer<_$Database, $DayEntityTable> {
  $$DayEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $$DayEntityTableAnnotationComposer
    extends Composer<_$Database, $DayEntityTable> {
  $$DayEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $$DayEntityTableTableManager extends RootTableManager<
    _$Database,
    $DayEntityTable,
    DayEntityData,
    $$DayEntityTableFilterComposer,
    $$DayEntityTableOrderingComposer,
    $$DayEntityTableAnnotationComposer,
    $$DayEntityTableCreateCompanionBuilder,
    $$DayEntityTableUpdateCompanionBuilder,
    (DayEntityData, BaseReferences<_$Database, $DayEntityTable, DayEntityData>),
    DayEntityData,
    PrefetchHooks Function()> {
  $$DayEntityTableTableManager(_$Database db, $DayEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DayEntityCompanion(
            id: id,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<int> rowid = const Value.absent(),
          }) =>
              DayEntityCompanion.insert(
            id: id,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DayEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $DayEntityTable,
    DayEntityData,
    $$DayEntityTableFilterComposer,
    $$DayEntityTableOrderingComposer,
    $$DayEntityTableAnnotationComposer,
    $$DayEntityTableCreateCompanionBuilder,
    $$DayEntityTableUpdateCompanionBuilder,
    (DayEntityData, BaseReferences<_$Database, $DayEntityTable, DayEntityData>),
    DayEntityData,
    PrefetchHooks Function()>;
typedef $$DayTaskAssignmentTableCreateCompanionBuilder
    = DayTaskAssignmentCompanion Function({
  Value<int> id,
  required int dayId,
  required int taskId,
});
typedef $$DayTaskAssignmentTableUpdateCompanionBuilder
    = DayTaskAssignmentCompanion Function({
  Value<int> id,
  Value<int> dayId,
  Value<int> taskId,
});

class $$DayTaskAssignmentTableFilterComposer
    extends Composer<_$Database, $DayTaskAssignmentTable> {
  $$DayTaskAssignmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayId => $composableBuilder(
      column: $table.dayId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));
}

class $$DayTaskAssignmentTableOrderingComposer
    extends Composer<_$Database, $DayTaskAssignmentTable> {
  $$DayTaskAssignmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayId => $composableBuilder(
      column: $table.dayId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));
}

class $$DayTaskAssignmentTableAnnotationComposer
    extends Composer<_$Database, $DayTaskAssignmentTable> {
  $$DayTaskAssignmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayId =>
      $composableBuilder(column: $table.dayId, builder: (column) => column);

  GeneratedColumn<int> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);
}

class $$DayTaskAssignmentTableTableManager extends RootTableManager<
    _$Database,
    $DayTaskAssignmentTable,
    DayTaskAssignmentData,
    $$DayTaskAssignmentTableFilterComposer,
    $$DayTaskAssignmentTableOrderingComposer,
    $$DayTaskAssignmentTableAnnotationComposer,
    $$DayTaskAssignmentTableCreateCompanionBuilder,
    $$DayTaskAssignmentTableUpdateCompanionBuilder,
    (
      DayTaskAssignmentData,
      BaseReferences<_$Database, $DayTaskAssignmentTable, DayTaskAssignmentData>
    ),
    DayTaskAssignmentData,
    PrefetchHooks Function()> {
  $$DayTaskAssignmentTableTableManager(
      _$Database db, $DayTaskAssignmentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayTaskAssignmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayTaskAssignmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayTaskAssignmentTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> dayId = const Value.absent(),
            Value<int> taskId = const Value.absent(),
          }) =>
              DayTaskAssignmentCompanion(
            id: id,
            dayId: dayId,
            taskId: taskId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int dayId,
            required int taskId,
          }) =>
              DayTaskAssignmentCompanion.insert(
            id: id,
            dayId: dayId,
            taskId: taskId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DayTaskAssignmentTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $DayTaskAssignmentTable,
    DayTaskAssignmentData,
    $$DayTaskAssignmentTableFilterComposer,
    $$DayTaskAssignmentTableOrderingComposer,
    $$DayTaskAssignmentTableAnnotationComposer,
    $$DayTaskAssignmentTableCreateCompanionBuilder,
    $$DayTaskAssignmentTableUpdateCompanionBuilder,
    (
      DayTaskAssignmentData,
      BaseReferences<_$Database, $DayTaskAssignmentTable, DayTaskAssignmentData>
    ),
    DayTaskAssignmentData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$TaskEntityTableTableManager get taskEntity =>
      $$TaskEntityTableTableManager(_db, _db.taskEntity);
  $$DayEntityTableTableManager get dayEntity =>
      $$DayEntityTableTableManager(_db, _db.dayEntity);
  $$DayTaskAssignmentTableTableManager get dayTaskAssignment =>
      $$DayTaskAssignmentTableTableManager(_db, _db.dayTaskAssignment);
}
