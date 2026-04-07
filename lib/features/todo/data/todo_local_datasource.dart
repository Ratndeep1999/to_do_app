import 'package:to_do_app/core/services/database/db_constants.dart';
import 'package:to_do_app/core/services/database/db_service.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';

class TodoLocalDatasource {
  final db = DbService.instance;

  /// Add Todo_ to Database
  Future<int> insertTodo(TodoModel todo) async {
    final database = await db.db;
    return await database!.insert(DbConstants.kTableTodo, todo.toMap());
  }
}
