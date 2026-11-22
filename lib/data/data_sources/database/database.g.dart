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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduleAtMeta = const VerificationMeta(
    'scheduleAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduleAt = GeneratedColumn<DateTime>(
    'schedule_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, scheduleAt];
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
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('schedule_at')) {
      context.handle(
        _scheduleAtMeta,
        scheduleAt.isAcceptableOrUnknown(data['schedule_at']!, _scheduleAtMeta),
      );
    } else if (isInserting) {
      context.missing(_scheduleAtMeta);
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
      scheduleAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}schedule_at'],
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
  final DateTime scheduleAt;
  const TaskTableData({
    required this.id,
    required this.title,
    required this.description,
    required this.scheduleAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['schedule_at'] = Variable<DateTime>(scheduleAt);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      scheduleAt: Value(scheduleAt),
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
      scheduleAt: serializer.fromJson<DateTime>(json['scheduleAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'scheduleAt': serializer.toJson<DateTime>(scheduleAt),
    };
  }

  TaskTableData copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? scheduleAt,
  }) => TaskTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    scheduleAt: scheduleAt ?? this.scheduleAt,
  );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      scheduleAt: data.scheduleAt.present
          ? data.scheduleAt.value
          : this.scheduleAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduleAt: $scheduleAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, scheduleAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.scheduleAt == this.scheduleAt);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> scheduleAt;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.scheduleAt = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required DateTime scheduleAt,
  }) : title = Value(title),
       description = Value(description),
       scheduleAt = Value(scheduleAt);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? scheduleAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (scheduleAt != null) 'schedule_at': scheduleAt,
    });
  }

  TaskTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? scheduleAt,
  }) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduleAt: scheduleAt ?? this.scheduleAt,
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
    if (scheduleAt.present) {
      map['schedule_at'] = Variable<DateTime>(scheduleAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduleAt: $scheduleAt')
          ..write(')'))
        .toString();
  }
}

class $ScheduleTableTable extends ScheduleTable
    with TableInfo<$ScheduleTableTable, ScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _tasksMeta = const VerificationMeta('tasks');
  @override
  late final GeneratedColumn<int> tasks = GeneratedColumn<int>(
    'tasks',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES task_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, tasks];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tasks')) {
      context.handle(
        _tasksMeta,
        tasks.isAcceptableOrUnknown(data['tasks']!, _tasksMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tasks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tasks'],
      ),
    );
  }

  @override
  $ScheduleTableTable createAlias(String alias) {
    return $ScheduleTableTable(attachedDatabase, alias);
  }
}

class ScheduleTableData extends DataClass
    implements Insertable<ScheduleTableData> {
  final int id;
  final int? tasks;
  const ScheduleTableData({required this.id, this.tasks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || tasks != null) {
      map['tasks'] = Variable<int>(tasks);
    }
    return map;
  }

  ScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTableCompanion(
      id: Value(id),
      tasks: tasks == null && nullToAbsent
          ? const Value.absent()
          : Value(tasks),
    );
  }

  factory ScheduleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTableData(
      id: serializer.fromJson<int>(json['id']),
      tasks: serializer.fromJson<int?>(json['tasks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tasks': serializer.toJson<int?>(tasks),
    };
  }

  ScheduleTableData copyWith({
    int? id,
    Value<int?> tasks = const Value.absent(),
  }) => ScheduleTableData(
    id: id ?? this.id,
    tasks: tasks.present ? tasks.value : this.tasks,
  );
  ScheduleTableData copyWithCompanion(ScheduleTableCompanion data) {
    return ScheduleTableData(
      id: data.id.present ? data.id.value : this.id,
      tasks: data.tasks.present ? data.tasks.value : this.tasks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableData(')
          ..write('id: $id, ')
          ..write('tasks: $tasks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tasks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTableData &&
          other.id == this.id &&
          other.tasks == this.tasks);
}

class ScheduleTableCompanion extends UpdateCompanion<ScheduleTableData> {
  final Value<int> id;
  final Value<int?> tasks;
  const ScheduleTableCompanion({
    this.id = const Value.absent(),
    this.tasks = const Value.absent(),
  });
  ScheduleTableCompanion.insert({
    this.id = const Value.absent(),
    this.tasks = const Value.absent(),
  });
  static Insertable<ScheduleTableData> custom({
    Expression<int>? id,
    Expression<int>? tasks,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tasks != null) 'tasks': tasks,
    });
  }

  ScheduleTableCompanion copyWith({Value<int>? id, Value<int?>? tasks}) {
    return ScheduleTableCompanion(
      id: id ?? this.id,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tasks.present) {
      map['tasks'] = Variable<int>(tasks.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('tasks: $tasks')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $LogTableTable logTable = $LogTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $ScheduleTableTable scheduleTable = $ScheduleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    logTable,
    taskTable,
    scheduleTable,
  ];
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
  required String description,
  required DateTime scheduleAt,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<DateTime> scheduleAt,
});

final class $$TaskTableTableReferences
    extends BaseReferences<_$Database, $TaskTableTable, TaskTableData> {
  $$TaskTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ScheduleTableTable, List<ScheduleTableData>>
  _scheduleTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.scheduleTable,
    aliasName: 'task_table__id__schedule_table__tasks',
  );

  $$ScheduleTableTableProcessedTableManager get scheduleTableRefs {
    final manager = $$ScheduleTableTableTableManager(
      $_db,
      $_db.scheduleTable,
    ).filter((f) => f.tasks.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scheduleTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<DateTime> get scheduleAt => $composableBuilder(
    column: $table.scheduleAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> scheduleTableRefs(
    Expression<bool> Function($$ScheduleTableTableFilterComposer f) f,
  ) {
    final $$ScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleTable,
      getReferencedColumn: (t) => t.tasks,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.scheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<DateTime> get scheduleAt => $composableBuilder(
    column: $table.scheduleAt,
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

  GeneratedColumn<DateTime> get scheduleAt => $composableBuilder(
    column: $table.scheduleAt,
    builder: (column) => column,
  );

  Expression<T> scheduleTableRefs<T extends Object>(
    Expression<T> Function($$ScheduleTableTableAnnotationComposer a) f,
  ) {
    final $$ScheduleTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleTable,
      getReferencedColumn: (t) => t.tasks,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTableTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (TaskTableData, $$TaskTableTableReferences),
          TaskTableData,
          PrefetchHooks Function({bool scheduleTableRefs})
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
                Value<DateTime> scheduleAt = const Value.absent(),
              }) => TaskTableCompanion(
                id: id,
                title: title,
                description: description,
                scheduleAt: scheduleAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required DateTime scheduleAt,
              }) => TaskTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                scheduleAt: scheduleAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaskTableTable, TaskTableData>(table),
                  $$TaskTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({scheduleTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (scheduleTableRefs) db.scheduleTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (scheduleTableRefs)
                    await $_getPrefetchedDataByColumns<
                      TaskTableData,
                      $TaskTableTable,
                      ScheduleTableData,
                      $ScheduleTableTable
                    >(
                      currentTable: table,
                      referencedTable: $$TaskTableTableReferences
                          ._scheduleTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TaskTableTableReferences(
                            db,
                            table,
                            p0,
                          ).scheduleTableRefs,
                      currentColumn: 'id',
                      referencedColumn: 'tasks',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (TaskTableData, $$TaskTableTableReferences),
      TaskTableData,
      PrefetchHooks Function({bool scheduleTableRefs})
    >;
typedef $$ScheduleTableTableCreateCompanionBuilder =
    ScheduleTableCompanion Function({Value<int> id, Value<int?> tasks});
typedef $$ScheduleTableTableUpdateCompanionBuilder =
    ScheduleTableCompanion Function({Value<int> id, Value<int?> tasks});

final class $$ScheduleTableTableReferences
    extends BaseReferences<_$Database, $ScheduleTableTable, ScheduleTableData> {
  $$ScheduleTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TaskTableTable _tasksTable(_$Database db) =>
      db.taskTable.createAlias('schedule_table__tasks__task_table__id');

  $$TaskTableTableProcessedTableManager? get tasks {
    final $_column = $_itemColumn<int>('tasks');
    if ($_column == null) return null;
    final manager = $$TaskTableTableTableManager(
      $_db,
      $_db.taskTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tasksTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduleTableTableFilterComposer
    extends Composer<_$Database, $ScheduleTableTable> {
  $$ScheduleTableTableFilterComposer({
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

  $$TaskTableTableFilterComposer get tasks {
    final $$TaskTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tasks,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableFilterComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleTableTableOrderingComposer
    extends Composer<_$Database, $ScheduleTableTable> {
  $$ScheduleTableTableOrderingComposer({
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

  $$TaskTableTableOrderingComposer get tasks {
    final $$TaskTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tasks,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableOrderingComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleTableTableAnnotationComposer
    extends Composer<_$Database, $ScheduleTableTable> {
  $$ScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TaskTableTableAnnotationComposer get tasks {
    final $$TaskTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tasks,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableAnnotationComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ScheduleTableTable,
          ScheduleTableData,
          $$ScheduleTableTableFilterComposer,
          $$ScheduleTableTableOrderingComposer,
          $$ScheduleTableTableAnnotationComposer,
          $$ScheduleTableTableCreateCompanionBuilder,
          $$ScheduleTableTableUpdateCompanionBuilder,
          (ScheduleTableData, $$ScheduleTableTableReferences),
          ScheduleTableData,
          PrefetchHooks Function({bool tasks})
        > {
  $$ScheduleTableTableTableManager(_$Database db, $ScheduleTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> tasks = const Value.absent(),
          }) => ScheduleTableCompanion(id: id, tasks: tasks),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> tasks = const Value.absent(),
          }) => ScheduleTableCompanion.insert(id: id, tasks: tasks),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ScheduleTableTable, ScheduleTableData>(table),
                  $$ScheduleTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tasks = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tasks) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.tasks,
                        referencedTable: $$ScheduleTableTableReferences
                            ._tasksTable(db),
                        referencedColumn: $$ScheduleTableTableReferences
                            ._tasksTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ScheduleTableTable,
      ScheduleTableData,
      $$ScheduleTableTableFilterComposer,
      $$ScheduleTableTableOrderingComposer,
      $$ScheduleTableTableAnnotationComposer,
      $$ScheduleTableTableCreateCompanionBuilder,
      $$ScheduleTableTableUpdateCompanionBuilder,
      (ScheduleTableData, $$ScheduleTableTableReferences),
      ScheduleTableData,
      PrefetchHooks Function({bool tasks})
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$LogTableTableTableManager get logTable =>
      $$LogTableTableTableManager(_db, _db.logTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
  $$ScheduleTableTableTableManager get scheduleTable =>
      $$ScheduleTableTableTableManager(_db, _db.scheduleTable);
}
