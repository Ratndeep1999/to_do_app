import 'package:flutter/material.dart';
import 'package:to_do_app/core/exceptions/app_exception.dart';
import 'package:to_do_app/core/services/database/db_constants.dart';
import 'package:to_do_app/core/services/database/db_service.dart';
import 'package:to_do_app/features/todo/model/todo_model.dart';

class TodoLocalDatasource {
  final dbInstance = DbService.instance;

  /// Add Todo_ to Database
  Future<bool> insertTodo(TodoModel todo) async {
    try {
      final database = await dbInstance.db;
      final result = await database.insert(
        DbConstants.kTableTodo,
        todo.toMap(),
      );
      return result > 0;
    } catch (e) {
      debugPrint("Insert Error: $e");
      throw DatabaseException("Failed to insert todo");
    }
  }

  /// Get Database Data
  Future<List<TodoModel>> getTodos() async {
    try {
      final database = await dbInstance.db;
      final data = await database.query(DbConstants.kTableTodo);
      return data.map((e) => TodoModel.fromMap(e)).toList();
    } catch (e) {
      debugPrint("Fetch Error: $e");
      throw DatabaseException("Failed to fetch todos");
    }
  }

  /// Delete_Todo
  Future<bool> deleteTodo(int id) async {
    try {
      final database = await dbInstance.db;
      final result = await database.delete(
        DbConstants.kTableTodo,
        where: "${DbConstants.kColId} = ?",
        whereArgs: [id],
      );
      return result > 0;
    } catch (e) {
      debugPrint("Delete Error: $e");
      throw DatabaseException("Failed to delete todo");
    }
  }

  /// Update_Todo
  Future<bool> updateTodo(TodoModel todo) async {
    final database = await dbInstance.db;
    final result = await database.update(
      DbConstants.kTableTodo,
      todo.toMap(),
      where: "${DbConstants.kColId} = ?",
      whereArgs: [todo.id],
    );
    return result > 0;
  }
}
