import 'package:to_do_app/core/services/database/db_constants.dart';
import 'package:to_do_app/core/services/database/db_service.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';

class TodoLocalDatasource {
  final db = DbService.instance;

  /// Add Todo_ to Database
  Future<int> insertTodo(TodoModel todo) async {
    final database = await db.db;
    return await database.insert(DbConstants.kTableTodo, todo.toMap());
  }

  /// Get Database Data
  Future<List<TodoModel>> getTodos() async {
    final database = await db.db;
    final data = await database.query(DbConstants.kTableTodo);
    return data.map((e) => TodoModel.fromMap(e)).toList();
  }

  /// Delete_Todo
  Future<int> deleteTodo(int id) async {
    final database = await db.db;
    return await database.delete(
      DbConstants.kTableTodo,
      where: "${DbConstants.kColId} = ?",
      whereArgs: [id],
    );
  }
}
