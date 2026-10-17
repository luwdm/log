import 'package:work_log/database/daos/log_dao.dart';
import 'package:work_log/database/database.dart';

class const LogRepository(final LogDao _logDao) {
  Stream<List<LogTableData>> watch() => _logDao.watch();

  Future<void> upsert({
    required String accomplishments,
    required String improvements,
    required String nextThings,
    DateTime? date,
    int? id,
  }) async {
    await _logDao.upsert(
      LogTableCompanion.insert(
        id: .absentIfNull(id),
        accomplishments: accomplishments,
        improvements: improvements,
        nextThings: nextThings,
        date: date ?? .now(),
      ),
    );
  }
}
