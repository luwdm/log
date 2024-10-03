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
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishedAtMeta =
      const VerificationMeta('finishedAt');
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
      'finished_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, createdAt, updatedAt, finishedAt];
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
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
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
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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

  /// The date of the last update.
  final DateTime updatedAt;

  /// The date when the user finished the task.
  final DateTime? finishedAt;
  const TaskEntityData(
      {required this.id,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      this.finishedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      updatedAt: Value(updatedAt),
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
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
    };
  }

  TaskEntityData copyWith(
          {int? id,
          String? description,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> finishedAt = const Value.absent()}) =>
      TaskEntityData(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
      );
  TaskEntityData copyWithCompanion(TaskEntityCompanion data) {
    return TaskEntityData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
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
          ..write('updatedAt: $updatedAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, description, createdAt, updatedAt, finishedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskEntityData &&
          other.id == this.id &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.finishedAt == this.finishedAt);
}

class TaskEntityCompanion extends UpdateCompanion<TaskEntityData> {
  final Value<int> id;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> finishedAt;
  const TaskEntityCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
  });
  TaskEntityCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.finishedAt = const Value.absent(),
  })  : description = Value(description),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TaskEntityData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? finishedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
    });
  }

  TaskEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? finishedAt}) {
    return TaskEntityCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('updatedAt: $updatedAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }
}

class $TagEntityTable extends TagEntity
    with TableInfo<$TagEntityTable, TagEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TagEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TagEntityTable createAlias(String alias) {
    return $TagEntityTable(attachedDatabase, alias);
  }
}

class TagEntityData extends DataClass implements Insertable<TagEntityData> {
  /// The id of the tag.
  final int id;

  /// The name of the tag.
  final String name;
  const TagEntityData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TagEntityCompanion toCompanion(bool nullToAbsent) {
    return TagEntityCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory TagEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TagEntityData copyWith({int? id, String? name}) => TagEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  TagEntityData copyWithCompanion(TagEntityCompanion data) {
    return TagEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagEntityData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagEntityData &&
          other.id == this.id &&
          other.name == this.name);
}

class TagEntityCompanion extends UpdateCompanion<TagEntityData> {
  final Value<int> id;
  final Value<String> name;
  const TagEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TagEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagEntityCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TagEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $TaskEntityTable taskEntity = $TaskEntityTable(this);
  late final $TagEntityTable tagEntity = $TagEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskEntity, tagEntity];
}

typedef $$TaskEntityTableCreateCompanionBuilder = TaskEntityCompanion Function({
  Value<int> id,
  required String description,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> finishedAt,
});
typedef $$TaskEntityTableUpdateCompanionBuilder = TaskEntityCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> finishedAt,
});

class $$TaskEntityTableFilterComposer
    extends FilterComposer<_$Database, $TaskEntityTable> {
  $$TaskEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finishedAt => $state.composableBuilder(
      column: $state.table.finishedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskEntityTableOrderingComposer
    extends OrderingComposer<_$Database, $TaskEntityTable> {
  $$TaskEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finishedAt => $state.composableBuilder(
      column: $state.table.finishedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TaskEntityTableTableManager extends RootTableManager<
    _$Database,
    $TaskEntityTable,
    TaskEntityData,
    $$TaskEntityTableFilterComposer,
    $$TaskEntityTableOrderingComposer,
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
          filteringComposer:
              $$TaskEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> finishedAt = const Value.absent(),
          }) =>
              TaskEntityCompanion(
            id: id,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            finishedAt: finishedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> finishedAt = const Value.absent(),
          }) =>
              TaskEntityCompanion.insert(
            id: id,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
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
    $$TaskEntityTableCreateCompanionBuilder,
    $$TaskEntityTableUpdateCompanionBuilder,
    (
      TaskEntityData,
      BaseReferences<_$Database, $TaskEntityTable, TaskEntityData>
    ),
    TaskEntityData,
    PrefetchHooks Function()>;
typedef $$TagEntityTableCreateCompanionBuilder = TagEntityCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$TagEntityTableUpdateCompanionBuilder = TagEntityCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$TagEntityTableFilterComposer
    extends FilterComposer<_$Database, $TagEntityTable> {
  $$TagEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TagEntityTableOrderingComposer
    extends OrderingComposer<_$Database, $TagEntityTable> {
  $$TagEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TagEntityTableTableManager extends RootTableManager<
    _$Database,
    $TagEntityTable,
    TagEntityData,
    $$TagEntityTableFilterComposer,
    $$TagEntityTableOrderingComposer,
    $$TagEntityTableCreateCompanionBuilder,
    $$TagEntityTableUpdateCompanionBuilder,
    (TagEntityData, BaseReferences<_$Database, $TagEntityTable, TagEntityData>),
    TagEntityData,
    PrefetchHooks Function()> {
  $$TagEntityTableTableManager(_$Database db, $TagEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              TagEntityCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              TagEntityCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TagEntityTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TagEntityTable,
    TagEntityData,
    $$TagEntityTableFilterComposer,
    $$TagEntityTableOrderingComposer,
    $$TagEntityTableCreateCompanionBuilder,
    $$TagEntityTableUpdateCompanionBuilder,
    (TagEntityData, BaseReferences<_$Database, $TagEntityTable, TagEntityData>),
    TagEntityData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$TaskEntityTableTableManager get taskEntity =>
      $$TaskEntityTableTableManager(_db, _db.taskEntity);
  $$TagEntityTableTableManager get tagEntity =>
      $$TagEntityTableTableManager(_db, _db.tagEntity);
}
