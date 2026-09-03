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
  static const VerificationMeta _ideasMeta = const VerificationMeta('ideas');
  @override
  late final GeneratedColumn<String> ideas = GeneratedColumn<String>(
    'ideas',
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
    accomplishments,
    improvements,
    ideas,
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
    if (data.containsKey('ideas')) {
      context.handle(
        _ideasMeta,
        ideas.isAcceptableOrUnknown(data['ideas']!, _ideasMeta),
      );
    } else if (isInserting) {
      context.missing(_ideasMeta);
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
      accomplishments: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accomplishments'],
      )!,
      improvements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}improvements'],
      )!,
      ideas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ideas'],
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
  final String accomplishments;
  final String improvements;
  final String ideas;
  final String nextThings;
  const LogTableData({
    required this.id,
    required this.accomplishments,
    required this.improvements,
    required this.ideas,
    required this.nextThings,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['accomplishments'] = Variable<String>(accomplishments);
    map['improvements'] = Variable<String>(improvements);
    map['ideas'] = Variable<String>(ideas);
    map['next_things'] = Variable<String>(nextThings);
    return map;
  }

  LogTableCompanion toCompanion(bool nullToAbsent) {
    return LogTableCompanion(
      id: Value(id),
      accomplishments: Value(accomplishments),
      improvements: Value(improvements),
      ideas: Value(ideas),
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
      accomplishments: serializer.fromJson<String>(json['accomplishments']),
      improvements: serializer.fromJson<String>(json['improvements']),
      ideas: serializer.fromJson<String>(json['ideas']),
      nextThings: serializer.fromJson<String>(json['nextThings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accomplishments': serializer.toJson<String>(accomplishments),
      'improvements': serializer.toJson<String>(improvements),
      'ideas': serializer.toJson<String>(ideas),
      'nextThings': serializer.toJson<String>(nextThings),
    };
  }

  LogTableData copyWith({
    int? id,
    String? accomplishments,
    String? improvements,
    String? ideas,
    String? nextThings,
  }) => LogTableData(
    id: id ?? this.id,
    accomplishments: accomplishments ?? this.accomplishments,
    improvements: improvements ?? this.improvements,
    ideas: ideas ?? this.ideas,
    nextThings: nextThings ?? this.nextThings,
  );
  LogTableData copyWithCompanion(LogTableCompanion data) {
    return LogTableData(
      id: data.id.present ? data.id.value : this.id,
      accomplishments: data.accomplishments.present
          ? data.accomplishments.value
          : this.accomplishments,
      improvements: data.improvements.present
          ? data.improvements.value
          : this.improvements,
      ideas: data.ideas.present ? data.ideas.value : this.ideas,
      nextThings: data.nextThings.present
          ? data.nextThings.value
          : this.nextThings,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogTableData(')
          ..write('id: $id, ')
          ..write('accomplishments: $accomplishments, ')
          ..write('improvements: $improvements, ')
          ..write('ideas: $ideas, ')
          ..write('nextThings: $nextThings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accomplishments, improvements, ideas, nextThings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogTableData &&
          other.id == this.id &&
          other.accomplishments == this.accomplishments &&
          other.improvements == this.improvements &&
          other.ideas == this.ideas &&
          other.nextThings == this.nextThings);
}

class LogTableCompanion extends UpdateCompanion<LogTableData> {
  final Value<int> id;
  final Value<String> accomplishments;
  final Value<String> improvements;
  final Value<String> ideas;
  final Value<String> nextThings;
  const LogTableCompanion({
    this.id = const Value.absent(),
    this.accomplishments = const Value.absent(),
    this.improvements = const Value.absent(),
    this.ideas = const Value.absent(),
    this.nextThings = const Value.absent(),
  });
  LogTableCompanion.insert({
    this.id = const Value.absent(),
    required String accomplishments,
    required String improvements,
    required String ideas,
    required String nextThings,
  }) : accomplishments = Value(accomplishments),
       improvements = Value(improvements),
       ideas = Value(ideas),
       nextThings = Value(nextThings);
  static Insertable<LogTableData> custom({
    Expression<int>? id,
    Expression<String>? accomplishments,
    Expression<String>? improvements,
    Expression<String>? ideas,
    Expression<String>? nextThings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accomplishments != null) 'accomplishments': accomplishments,
      if (improvements != null) 'improvements': improvements,
      if (ideas != null) 'ideas': ideas,
      if (nextThings != null) 'next_things': nextThings,
    });
  }

  LogTableCompanion copyWith({
    Value<int>? id,
    Value<String>? accomplishments,
    Value<String>? improvements,
    Value<String>? ideas,
    Value<String>? nextThings,
  }) {
    return LogTableCompanion(
      id: id ?? this.id,
      accomplishments: accomplishments ?? this.accomplishments,
      improvements: improvements ?? this.improvements,
      ideas: ideas ?? this.ideas,
      nextThings: nextThings ?? this.nextThings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accomplishments.present) {
      map['accomplishments'] = Variable<String>(accomplishments.value);
    }
    if (improvements.present) {
      map['improvements'] = Variable<String>(improvements.value);
    }
    if (ideas.present) {
      map['ideas'] = Variable<String>(ideas.value);
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
          ..write('accomplishments: $accomplishments, ')
          ..write('improvements: $improvements, ')
          ..write('ideas: $ideas, ')
          ..write('nextThings: $nextThings')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $LogTableTable logTable = $LogTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [logTable];
}

typedef $$LogTableTableCreateCompanionBuilder = LogTableCompanion Function({
  Value<int> id,
  required String accomplishments,
  required String improvements,
  required String ideas,
  required String nextThings,
});
typedef $$LogTableTableUpdateCompanionBuilder = LogTableCompanion Function({
  Value<int> id,
  Value<String> accomplishments,
  Value<String> improvements,
  Value<String> ideas,
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

  ColumnFilters<String> get accomplishments => $composableBuilder(
    column: $table.accomplishments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get improvements => $composableBuilder(
    column: $table.improvements,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ideas => $composableBuilder(
    column: $table.ideas,
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

  ColumnOrderings<String> get accomplishments => $composableBuilder(
    column: $table.accomplishments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get improvements => $composableBuilder(
    column: $table.improvements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ideas => $composableBuilder(
    column: $table.ideas,
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

  GeneratedColumn<String> get accomplishments => $composableBuilder(
    column: $table.accomplishments,
    builder: (column) => column,
  );

  GeneratedColumn<String> get improvements => $composableBuilder(
    column: $table.improvements,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ideas =>
      $composableBuilder(column: $table.ideas, builder: (column) => column);

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
                Value<String> accomplishments = const Value.absent(),
                Value<String> improvements = const Value.absent(),
                Value<String> ideas = const Value.absent(),
                Value<String> nextThings = const Value.absent(),
              }) => LogTableCompanion(
                id: id,
                accomplishments: accomplishments,
                improvements: improvements,
                ideas: ideas,
                nextThings: nextThings,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String accomplishments,
                required String improvements,
                required String ideas,
                required String nextThings,
              }) => LogTableCompanion.insert(
                id: id,
                accomplishments: accomplishments,
                improvements: improvements,
                ideas: ideas,
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

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$LogTableTableTableManager get logTable =>
      $$LogTableTableTableManager(_db, _db.logTable);
}
