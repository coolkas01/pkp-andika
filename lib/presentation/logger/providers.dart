import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/logger_repository_impl.dart';
import '/data/source/local/db.dart';
import '/domain/usecase/read_saved_logs.dart';

final dbProvider = Provider((_) => DbImpl());

final loggerRepositoryProvider = Provider((ref) =>
    LoggerRepositoryImpl(db: ref.read(dbProvider)));

final readSavedLogsProvider = FutureProvider((ref) =>
    ReadSavedLogs(repo: ref.read(loggerRepositoryProvider)).call());