import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/core/services/database/db_constants.dart';

class DbService {
  /// Singleton
  DbService._();

  static final DbService instance = DbService._();

  static Database? _database;

  /// Return Database
  Future<Database?> get db async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database;
  }

  /// Return Database Path
  Future<String> get _dbPath async {
    final dbPath = await getDatabasesPath();
    return join(dbPath, DbConstants.kTableTodo);
  }

  /// Initialize Database
  Future<Database?> _initDb() async {
    final path = await _dbPath;
    Database database = await openDatabase(
      path,
      version: DbConstants.kDbVersion,
      onCreate: _createDb,
      singleInstance: true,
    );
    return database;
  }
}
