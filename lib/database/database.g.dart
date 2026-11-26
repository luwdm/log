// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LogTableTable extends LogTable
    with TableInfo<$LogTableTable, LogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _accomplishmentsMeta = const VerificationMeta(
    'accomplishments',
  );
  @override
  late final GeneratedColumn<String> accomplishments = GeneratedColumn<String>(
    'accomplishments',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _improvementsMeta = const VerificationMeta(
    'improvements',
  );
  @override
  late final GeneratedColumn<String> improvements = GeneratedColumn<String>(
    'improvements',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextThingsMeta = const VerificationMeta(
    'nextThings',
  );
  @override
  late final GeneratedColumn<String> nextThings = GeneratedColumn<String>(
    'next_things',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    accomplishments,
    improvements,
    nextThings,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('accomplishments')) {
      context.handle(
        _accomplishmentsMeta,
        accomplishments.isAcceptableOrUnknown(
          data['accomplishments']!,
          _accomplishmentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accomplishmentsMeta);
    }
    if (data.containsKey('improvements')) {
      context.handle(
        _improvementsMeta,
        improvements.isAcceptableOrUnknown(
          data['improvements']!,
          _improvementsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_improvementsMeta);
    }
    if (data.containsKey('next_things')) {
      context.handle(
        _nextThingsMeta,
        nextThings.isAcceptableOrUnknown(data['next_things']!, _nextThingsMeta),
      );
    } else if (isInserting) {
      context.missing(_nextThingsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      accomplishments: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accomplishments'],
      )!,
      improvements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}improvements'],
      )!,
      nextThings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_things'],
      )!,
    );
  }

  @override
  $LogTableTable createAlias(String alias) {
    return $LogTableTable(attachedDatabase, alias);
  }
}

class LogTableData extends DataClass implements Insertable<LogTableData> {
  final int id;
  final DateTime date;
  final String accomplishments;
  final String improvements;
  final String nextThings;
  const LogTableData({
    required this.id,
    required this.date,
    required this.accomplishments,
    required this.improvements,
    required this.nextThings,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['accomplishments'] = Variable<String>(accomplishments);
    map['improvements'] = Variable<String>(improvements);
    map['next_things'] = Variable<String>(nextThings);
    return map;
  }

  LogTableCompanion toCompanion(bool nullToAbsent) {
    return LogTableCompanion(
      id: Value(id),
      date: Value(date),
      accomplishments: Value(accomplishments),
      improvements: Value(improvements),
      nextThings: Value(nextThings),
    );
  }

  factory LogTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogTableData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      accomplishments: serializer.fromJson<String>(json['accomplishments']),
      improvements: serializer.fromJson<String>(json['improvements']),
      nextThings: serializer.fromJson<String>(json['nextThings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'accomplishments': serializer.toJson<String>(accomplishments),
      'improvements': serializer.toJson<String>(improvements),
      'nextThings': serializer.toJson<String>(nextThings),
    };
  }

  LogTableData copyWith({
    int? id,
    DateTime? date,
    String? accomplishments,
    String? improvements,
    String? nextThings,
  }) => LogTableData(
    id: id ?? this.id,
    date: date ?? this.date,
    accomplishments: accomplishments ?? this.accomplishments,
    improvements: improvements ?? this.improvements,
    nextThings: nextThings ?? this.nextThings,
  );
  LogTableData copyWithCompanion(LogTableCompanion data) {
    return LogTableData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      accomplishments: data.accomplishments.present
          ? data.accomplishments.value
          : this.accomplishments,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      nextThings: data.nextThings.present
          ? data.nextThings.value
          : this.nextThings,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogTableData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('accomplishments: $accomplishments, ')
          ..write('improvements: $improvements, ')
          ..write('nextThings: $nextThings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, accomplishments, improvements, nextThings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogTableData &&
          other.id == this.id &&
          other.date == this.date &&
          other.accomplishments == this.accomplishments &&
          other.improvements == this.improvements &&
          other.nextThings == this.nextThings);
}

class LogTableCompanion extends UpdateCompanion<LogTableData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> accomplishments;
  final Value<String> improvements;
  final Value<String> nextThings;
  const LogTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.accomplishments = const Value.absent(),
    this.improvements = const Value.absent(),
    this.nextThings = const Value.absent(),
  });
  LogTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String accomplishments,
    required String improvements,
    required String nextThings,
  }) : date = Value(date),
       accomplishments = Value(accomplishments),
       improvements = Value(improvements),
       nextThings = Value(nextThings);
  static Insertable<LogTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? accomplishments,
    Expression<String>? improvements,
    Expression<String>? nextThings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (accomplishments != null) 'accomplishments': accomplishments,
      if (improvements != null) 'improvements': improvements,
      if (nextThings != null) 'next_things': nextThings,
    });
  }

  LogTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? accomplishments,
    Value<String>? improvements,
    Value<String>? nextThings,
  }) {
    return LogTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      accomplishments: accomplishments ?? this.accomplishments,
      improvements: improvements ?? this.improvements,
      nextThings: nextThings ?? this.nextThings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (accomplishments.present) {
      map['accomplishments'] = Variable<String>(accomplishments.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (nextThings.present) {
      map['next_things'] = Variable<String>(nextThings.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('accomplishments: $accomplishments, ')
          ..write('improvements: $improvements, ')
          ..write('nextThings: $nextThings')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int id;
  final String title;
  final String description;

  /// The day the task is planned for, stored without a time of day.
  final DateTime date;
  const TaskTableData({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      date: Value(date),
    );
  }

  factory TaskTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  TaskTableData copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
  }) => TaskTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    date: date ?? this.date,
  );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.date == this.date);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> date;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required DateTime date,
  }) : title = Value(title),
       date = Value(date);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
    });
  }

  TaskTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? date,
  }) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $LogTableTable logTable = $LogTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [logTable, taskTable];
}

typedef $$LogTableTableCreateCompanionBuilder = LogTableCompanion Function({
  Value<int> id,
  required DateTime date,
  required String accomplishments,
  required String improvements,
  required String nextThings,
});
typedef $$LogTableTableUpdateCompanionBuilder = LogTableCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<String> accomplishments,
  Value<String> improvements,
  Value<String> nextThings,
});

class $$LogTableTableFilterComposer
    extends Composer<_$Database, $LogTableTable> {
  $$LogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accomplishments => $composableBuilder(
    column: $table.accomplishments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get improvements => $composableBuilder(
    column: $table.improvements,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextThings => $composableBuilder(
    column: $table.nextThings,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LogTableTableOrderingComposer
    extends Composer<_$Database, $LogTableTable> {
  $$LogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accomplishments => $composableBuilder(
    column: $table.accomplishments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get improvements => $composableBuilder(
    column: $table.improvements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextThings => $composableBuilder(
    column: $table.nextThings,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LogTableTableAnnotationComposer
    extends Composer<_$Database, $LogTableTable> {
  $$LogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get accomplishments => $composableBuilder(
    column: $table.accomplishments,
    builder: (column) => column,
  );

  GeneratedColumn<String> get improvements => $composableBuilder(
    column: $table.improvements,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextThings => $composableBuilder(
    column: $table.nextThings,
    builder: (column) => column,
  );
}

class $$LogTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $LogTableTable,
          LogTableData,
          $$LogTableTableFilterComposer,
          $$LogTableTableOrderingComposer,
          $$LogTableTableAnnotationComposer,
          $$LogTableTableCreateCompanionBuilder,
          $$LogTableTableUpdateCompanionBuilder,
          (
            LogTableData,
            BaseReferences<_$Database, $LogTableTable, LogTableData>,
          ),
          LogTableData,
          PrefetchHooks Function()
        > {
  $$LogTableTableTableManager(_$Database db, $LogTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> accomplishments = const Value.absent(),
                Value<String> improvements = const Value.absent(),
                Value<String> nextThings = const Value.absent(),
              }) => LogTableCompanion(
                id: id,
                date: date,
                accomplishments: accomplishments,
                improvements: improvements,
                nextThings: nextThings,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String accomplishments,
                required String improvements,
                required String nextThings,
              }) => LogTableCompanion.insert(
                id: id,
                date: date,
                accomplishments: accomplishments,
                improvements: improvements,
                nextThings: nextThings,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LogTableTable, LogTableData>(table),
                  BaseReferences<_$Database, $LogTableTable, LogTableData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LogTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $LogTableTable,
      LogTableData,
      $$LogTableTableFilterComposer,
      $$LogTableTableOrderingComposer,
      $$LogTableTableAnnotationComposer,
      $$LogTableTableCreateCompanionBuilder,
      $$LogTableTableUpdateCompanionBuilder,
      (LogTableData, BaseReferences<_$Database, $LogTableTable, LogTableData>),
      LogTableData,
      PrefetchHooks Function()
    >;
typedef $$TaskTableTableCreateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  required String title,
  Value<String> description,
  required DateTime date,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<DateTime> date,
});

class $$TaskTableTableFilterComposer
    extends Composer<_$Database, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$Database, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$Database, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$TaskTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $TaskTableTable,
          TaskTableData,
          $$TaskTableTableFilterComposer,
          $$TaskTableTableOrderingComposer,
          $$TaskTableTableAnnotationComposer,
          $$TaskTableTableCreateCompanionBuilder,
          $$TaskTableTableUpdateCompanionBuilder,
          (
            TaskTableData,
            BaseReferences<_$Database, $TaskTableTable, TaskTableData>,
          ),
          TaskTableData,
          PrefetchHooks Function()
        > {
  $$TaskTableTableTableManager(_$Database db, $TaskTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => TaskTableCompanion(
                id: id,
                title: title,
                description: description,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String> description = const Value.absent(),
                required DateTime date,
              }) => TaskTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                date: date,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaskTableTable, TaskTableData>(table),
                  BaseReferences<_$Database, $TaskTableTable, TaskTableData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaskTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $TaskTableTable,
      TaskTableData,
      $$TaskTableTableFilterComposer,
      $$TaskTableTableOrderingComposer,
      $$TaskTableTableAnnotationComposer,
      $$TaskTableTableCreateCompanionBuilder,
      $$TaskTableTableUpdateCompanionBuilder,
      (
        TaskTableData,
        BaseReferences<_$Database, $TaskTableTable, TaskTableData>,
      ),
      TaskTableData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$LogTableTableTableManager get logTable =>
      $$LogTableTableTableManager(_db, _db.logTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
}
