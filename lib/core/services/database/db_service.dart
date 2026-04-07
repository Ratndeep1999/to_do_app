import 'package:sqflite/sqflite.dart';

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
}
