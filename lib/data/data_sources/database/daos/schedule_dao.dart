import 'package:drift/drift.dart';
import 'package:work_log/data/data.dart';

part 'schedule_dao.g.dart';

@DriftAccessor(tables: [ScheduleTable])
class ScheduleDao(super.attachedDatabase)
    extends DatabaseAccessor<Database>
    with _$ScheduleDaoMixin {
  Stream<List<ScheduleTableData>> watch() => select(scheduleTable).watch();

  Future<void> upsert(ScheduleTableCompanion schedule) async {
    await into(scheduleTable).insertOnConflictUpdate(schedule);
  }

  Future<void> remove(int id) async {
    await (delete(scheduleTable)..where((t) => t.id.equals(id))).go();
  }
}
