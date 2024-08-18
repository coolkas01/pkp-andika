import '/domain/entity/logger.dart';
import '/domain/repository/logger_repository.dart';

class ReadSavedLogs {
  ReadSavedLogs({required LoggerRepository repo})
      : _repo = repo;

  final LoggerRepository _repo;

  Future<Loggers> call() =>
      _repo.read();
}