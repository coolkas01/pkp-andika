import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/data/dto/logger_dto.dart';

abstract class Db {
  Future<List<LoggerDTO>> read();

  Future<void> save(LoggerDTO logger);
}

class DbImpl extends Db {
  static const _tableName = 'response_logs';
  static Database? _database;
  
  Future<Database> get database async {
    _database ??= await _init();
    return _database!;
  }

  @override
  Future<List<LoggerDTO>> read() async {
    final db = await database;
    final raw = await db.query(_tableName);
    return raw.map((e) => LoggerDTO.fromRaw(e)).toList();
  }

  @override
  Future<void> save(LoggerDTO logger) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.insert(_tableName, logger.toMap());
    });
  }

  Future<Database> _init() async {
    return openDatabase(
      join(await getDatabasesPath(), 'logger_db'),
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            method TEXT NOT NULL,
            url TEXT NOT NUll,
            code INTEGER NOT NULL,
            body TEXT,
            created_at TEXT NOT NULL
            )
        ''');
      },
    );
  }
}