import 'package:to_do_app/core/services/database/db_constants.dart';
import 'package:to_do_app/core/services/database/db_service.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';

class TodoLocalDatasource {
  final db = DbService.instance;

  /// Add Todo_ to Database
  Future<bool> insertTodo(TodoModel todo) async {
    final database = await db.db;
    final result = await database.insert(DbConstants.kTableTodo, todo.toMap());
    return result > 0;
  }

  /// Get Database Data
  Future<List<TodoModel>> getTodos() async {
    final database = await db.db;
    final data = await database.query(DbConstants.kTableTodo);
    return data.map((e) => TodoModel.fromMap(e)).toList();
  }

  /// Delete_Todo
  Future<bool> deleteTodo(int id) async {
    final database = await db.db;
    final result = await database.delete(
      DbConstants.kTableTodo,
      where: "${DbConstants.kColId} = ?",
      whereArgs: [id],
    );
    return result > 0;
  }

  /// Update_Todo
  Future<bool> updateTodo(TodoModel todo) async {
    final database = await db.db;
    final result = await database.update(
      DbConstants.kTableTodo,
      todo.toMap(),
      where: "${DbConstants.kColId} = ?",
      whereArgs: [todo.id],
    );
    return result > 0;
  }
}
