import 'dart:sync';
import '../models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
  Future <void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
}

class TodoResitoryImpl implements TodoRepository {
  final List<TodoModel> _todos = [];

  @override
  Future<List<TodoModel>> getTodos() async {
    return List.from(_todos);
  }

  @override
  Future<void> updateTodo(TodoModel updateTodo) async {
    final index = _todos.indexWhere((todo) => todo.id == updateTodo.id);
    if(index != -1) {
      _todos[index] = updateTodo;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
  }
}