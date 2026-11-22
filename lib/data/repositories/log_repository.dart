import 'package:work_log/data/data.dart';
import 'package:work_log/domain/domain.dart';

class const LogRepository(final LogDao _logDao) {
  Stream<List<Log>> watch() {
    return _logDao.watch().map(
      (logs) => logs
          .map(
            (log) => Log(
              id: log.id,
              date: log.date,
              accomplishments: log.accomplishments,
              improvements: log.improvements,
              nextThings: log.nextThings,
            ),
          )
          .toList(),
    );
  }

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

  Future<void> delete(int id) => _logDao.remove(id);
}
