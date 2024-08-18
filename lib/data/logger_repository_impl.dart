import '/data/source/local/db.dart';
import '/domain/entity/logger.dart';
import '/domain/repository/logger_repository.dart';

class LoggerRepositoryImpl extends LoggerRepository {
  LoggerRepositoryImpl({required Db db})
      : _db = db;

  final Db _db;

  @override
  Future<Loggers> read() =>
      _db.read();
}