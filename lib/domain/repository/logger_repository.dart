import '/domain/entity/logger.dart';

abstract class LoggerRepository {
  Future<Loggers> read();
}